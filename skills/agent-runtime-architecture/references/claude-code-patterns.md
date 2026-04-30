# Claude Code Runtime Patterns

Use this file for umbrella runtime thinking.

Code-confirmed patterns:
- the runtime assembles context instead of replaying raw history
- memory is layered rather than one profile blob
- compaction is a normal lifecycle tool, not only an emergency step
- fallback is orchestrated across retry, overflow, and model decisions
- the agent loop treats tools, progress, and intermediate state as first-class runtime concerns
