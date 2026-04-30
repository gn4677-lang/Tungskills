---
name: agent-context-architecture
description: Use when the main problem is agent memory or context continuity, especially agent 記憶, forgetting, session leakage, identity confusion, context packing, compaction, memory scope, checkpoint vs memory, or cross-project/user memory carryover. Trigger on symptoms such as forgotten state, memory leakage, cross-project memory mixing, tenant/user scope confusion, or context 太亂. Do not use as primary for search, RAG, or external-document retrieval.
---

# Agent Context Architecture

Use this skill when the agent forgets, leaks context across sessions, or carries too much history.

## Operating mode

Use this as a design workflow, not a knowledge pack. Start from the user's failure case, identify the state boundary, and produce an implementable context contract.

Before reading references, write down:

- the user-visible symptom
- the active surface or session type
- the actor identity and workspace/project scope
- the state that must survive, expire, or stay private

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
8. Return:
   - session boundary
   - identity boundary
   - durable memory
   - session state
   - assembled context pack
   - compaction rule
   - leakage risk
   - verification case
   - optional handoff block using [../agent-runtime-architecture/references/handoff-schema.md](../agent-runtime-architecture/references/handoff-schema.md)

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
- If the core complaint is search quality or RAG scope, route to `agent-retrieval-architecture`.
