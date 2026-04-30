# Wave 1 Patterns

Use this file only after the Claude Code and OpenClaw references.

## `letta-main.zip`

- Confidence:
  - `doc-confirmed`
- Keep:
  - long-lived, stateful agent framing
  - explicit language for memory that learns and self-improves over time
  - API posture where memory is part of agent identity, not an afterthought
- Use it to answer:
  - how persistent memory should be framed for long-lived agents
  - why stateful agents need memory designed as part of the runtime contract
- Do not use it to answer:
  - gateway-owned session routing
  - channel isolation
  - operator-facing multi-surface session ownership

## `mem0-main.zip`

- Confidence:
  - `doc-confirmed`
- Keep:
  - memory CRUD
  - memory history and feedback
  - organization and project memory concepts
- Use it to answer:
  - how memory can be inspectable, correctable, and scoped beyond one transcript
  - how productized memory surfaces differ from hidden prompt stuffing
- Do not use it to answer:
  - retrieval indexing strategy as the main architecture
  - generic orchestration or eval loops

## Boundary reminder

- `agent-context-architecture` still owns:
  - active-session context
  - identity and session boundaries
  - memory schema
  - compaction continuity
- Route to `agent-durability-ops` when the core question becomes:
  - background maintenance
  - sync
  - checkpointing
  - recovery
  - budget or quota policy over time
