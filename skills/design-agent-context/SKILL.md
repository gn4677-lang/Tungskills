---
name: design-agent-context
description: "Use when designing or fixing agent context, memory, session state, compaction, identity scope, tenant/project boundaries, checkpoint-vs-memory, or context leakage. Trigger on forgetting, memory leak, cross-session continuity, context packing, agent 記憶, scope 混亂, 中文語境的記憶/上下文問題. Do not use as primary for RAG/source lookup."
---

# Design Agent Context

## Action Protocol

Use this as a design protocol. Start from the concrete context failure, identify scope keys and state layers, then return an implementable context contract.

Use this skill when the agent forgets, leaks context across sessions, or carries too much history.

## Operating mode

Use this as a design workflow, not a knowledge pack. Start from the user's failure case, identify the state boundary, and produce an implementable context contract.

Positive default: preserve the right context at the right scope so the agent can act correctly without leaking private state, reviving stale state, or bloating the prompt.

Before reading references, write down:

- the user-visible symptom
- the active surface or session type
- the actor identity and workspace/project scope
- the state that must survive, expire, or stay private

## Default Output

```text
Session boundary: ...
Identity boundary: ...
Durable memory: ...
Session state: ...
Assembled context pack: ...
Compaction rule: ...
Leakage risk: ...
Verification case: ...
Handoff block: optional
Decision: proceed | narrow | stop
```

## Workflow

1. Classify the problem as one of:
   - continuity loss
   - cross-session leakage
   - identity confusion
   - context bloat
   - compaction damage
   - durable memory design
2. Decide whether the fix belongs in:
   - deterministic routing and scope keys
   - active session state
   - durable memory records
   - context pack assembly
   - compaction or summarization policy
3. Read [references/claude-code-patterns.md](references/claude-code-patterns.md) for context layering, compaction, and memory maintenance patterns.
4. Read [references/openclaw-patterns.md](references/openclaw-patterns.md) for session routing, identity linking, and multi-surface isolation patterns.
5. Read [references/wave1-patterns.md](references/wave1-patterns.md) when memory productization or long-lived stateful memory is part of the problem.
6. Read [references/wave3-patterns.md](references/wave3-patterns.md) when multi-tenant scope, state taxonomy, checkpoint-vs-memory boundaries, or temporal memory are part of the problem.
7. Read [references/translation.md](references/translation.md) only after choosing the capability shape.
8. Return the Default Output, using [../route-agent-runtime-design/references/handoff-schema.md](../route-agent-runtime-design/references/handoff-schema.md) when a handoff is needed.

## Rules

- Routing is not the same thing as memory.
- Durable memory is not the transcript.
- Build context packs intentionally; do not replay full history by default.
- Compaction should preserve action continuity, not just shorten text.
- Treat checkpoints as resumable execution state; treat memory as reusable user/project knowledge.
- Store scope keys and retention rules deterministically. Let the agent select and summarize, not decide who owns the data.
- Classify state as scratchpad, event history, checkpoint, user memory, agent memory, project memory, or temporal relationship memory before choosing storage.
- Never let LLM-inferred memory scope override tenant, user, workspace, privacy, or retention keys.
- Name at least one regression scenario, such as "same user in two projects", "two users in one shared channel", or "resume after compaction".
- If the core complaint is search quality or RAG scope, route to `design-agent-retrieval`.

## Stop Signals

Stop or narrow when:

- checkpoint, transcript, retrieved document text, or search result is treated as reusable memory
- tenant, user, workspace, project, privacy, or retention scope is missing
- the fix depends on replaying full history by default
- the primary complaint is source lookup or RAG quality rather than active context or memory continuity

## Verification

Before claiming the context design is safe, name the evidence: scope keys, memory-state taxonomy, context-pack rule, compaction preservation case, leakage regression, and any retrieval handoff.
