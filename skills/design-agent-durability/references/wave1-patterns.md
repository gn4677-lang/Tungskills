# Wave 1 Patterns

Use this file after the Claude Code and OpenClaw durability references.

## `letta-main.zip`

- Confidence:
  - `doc-confirmed`
- Keep:
  - long-lived agent memory framing
  - stateful agent posture
  - memory that can improve over time
- Use it to answer:
  - why durability is partly about preserving agent identity over time
  - how long-lived memory changes the runtime contract for an agent
- Do not use it to answer:
  - gateway ownership or transport-level session control

## `mem0-main.zip`

- Confidence:
  - `doc-confirmed`
- Keep:
  - memory lifecycle surfaces such as history, feedback, and scoped storage
  - organizational and project-level memory as durable operating state
- Use it to answer:
  - how persistent memory should stay inspectable and correctable
  - how durable memory surfaces support long-running operations

## `openai-agents-python-main.zip`

- Confidence:
  - `doc-confirmed`
- Keep:
  - session persistence as an explicit runtime surface
  - guardrails and human approval as safety controls around continued execution
- Use it to answer:
  - how long-running work can stay interruptible and inspectable
- Do not let it take over:
  - shared-memory sync semantics
  - token or quota guard ownership

## Boundary reminder

- `design-agent-durability` owns:
  - maintenance over time
  - recoverability
  - inspectable durable state
  - budget-aware continuity
- It does not own:
  - normal context assembly for the current prompt
  - retrieval mode choice
  - provider failover or generic tracing
