# Wave 3 Patterns

Use this file when the context problem involves multi-tenant scope, state taxonomy, checkpoint-vs-memory boundaries, or temporal memory.

## Sources promoted

- LangGraph persistence: threads, checkpoints, super-step snapshots, human-in-the-loop resume, and fault-tolerant execution.
  - Source: https://docs.langchain.com/oss/python/langgraph/persistence
- Google Agent Development Kit state: session state as scratchpad, event history separation, scope prefixes, and controlled state updates.
  - Source: https://google.github.io/adk-docs/sessions/state/
- Mem0: user, agent, and session memory as explicit source classes for long-lived personalization.
  - Source: https://docs.mem0.ai/overview
- Letta: core, archival, and recall memory as long-lived stateful-agent memory tiers.
  - Source: https://docs.letta.com/
- Zep / Graphiti: temporal knowledge graph memory for changing relationships across conversations and structured data.
  - Source: https://help.getzep.com/graphiti/graphiti/overview

## Memory-state taxonomy

Classify every candidate memory or context item before designing storage or retrieval:

| State class | Owns | Use for | Do not use for |
| --- | --- | --- | --- |
| Session scratchpad | active session | current task variables, short-lived choices, transient UI flow | durable preferences or cross-project facts |
| Event history | runtime/session log | reconstructing what happened and supporting audit | prompt replay by default |
| Checkpoint state | workflow runtime | resume, human approval, time travel, crash recovery | user memory or personalization |
| User memory | durable user profile | preferences, stable facts, consented personalization | project-private facts without project scope |
| Agent memory | agent role or skill | reusable tactics, tool preferences, operating habits | facts belonging to a specific user or tenant |
| Project memory | project/workspace | repo decisions, architecture constraints, local conventions | cross-project personalization |
| Temporal relationship memory | entity graph | facts that change over time, role/status/ownership history | simple static facts that a scoped key can hold |

## Scope-key checklist

Require deterministic scope keys before any agentic memory selection:

- `tenant_id` or equivalent isolation boundary
- `user_id` or actor identity
- `workspace_id` or project/repo identity
- `surface_id` when channel, DM, thread, browser, or device matters
- `agent_id` or role when memory is agent-specific
- retention class: transient, session, project, user, org, archive
- privacy class: private, shared, admin-visible, exportable, delete-on-request

The model may select, summarize, and rank scoped memory. It must not invent ownership, privacy class, tenant boundary, or retention class.

## Pattern translations

### LangGraph

- Keep: checkpoint and thread language for resumable execution and human-in-the-loop resume.
- Translate to: checkpoint state is runtime recovery state, not durable user memory.
- Use it to answer: "What must be restored after interruption or approval?"
- Do not overstate: checkpoints do not solve memory governance, leakage prevention, or long-term recall quality.

### Google ADK

- Keep: `session.state` as the active scratchpad and `session.events` as history.
- Translate to: active context should be assembled from state classes, not raw transcript replay.
- Use it to answer: "What belongs in the current session versus durable memory?"
- Do not overstate: ADK scope prefixes are examples, not a universal schema.

### Mem0 and Letta

- Keep: explicit memory classes and long-lived memory tiers.
- Translate to: user, agent, session, core, archival, and recall memory are separate source classes.
- Use it to answer: "Which durable memory class should receive or serve this fact?"
- Do not overstate: vendor benchmark claims should not be used as architectural proof.

### Zep / Graphiti

- Keep: temporal validity for relationships and changing facts.
- Translate to: memory records involving people, roles, ownership, status, and business state need time-aware freshness checks.
- Use it to answer: "Could this fact have changed, and how would stale memory be detected?"
- Do not overstate: temporal graphs are not required for simple deterministic state.

## Output additions

When using this reference, add these fields if they materially affect the answer:

- memory-state taxonomy
- deterministic scope keys
- retention and privacy rule
- checkpoint-vs-memory boundary
- temporal validity rule

## Regression cases

- Same user asks about two different projects: project memory must not bleed across workspace scope.
- Two users share a channel: private user memory must not enter shared context unless explicitly allowed.
- Agent resumes after checkpoint: recovery state restores progress but does not create new durable memory.
- A user's role changed last week: temporal memory must prefer the currently valid relationship or surface uncertainty.
