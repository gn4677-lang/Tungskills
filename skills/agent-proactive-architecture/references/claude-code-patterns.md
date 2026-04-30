# Claude Code Patterns For Proactive Work

Use this file for proactive-runtime patterns confirmed from `cc-haha-main.zip`.

## Pattern: background workers with narrower duties

- Confidence: `code-confirmed`
- Source area:
  - `src/services/SessionMemory/sessionMemory.ts`
  - `src/services/extractMemories/extractMemories.ts`
- Why it matters:
  - background jobs should not have the same role as the foreground agent
  - proactive work is safer when workers are scoped to summarization or extraction tasks

## Pattern: proactive maintenance hidden behind the main loop

- Confidence: `code-confirmed`
- Source area:
  - `src/query.ts`
  - background services referenced from stop hooks and memory services
- Why it matters:
  - valuable proactive behavior often happens after the visible answer, not inside the visible reply
  - this supports quiet maintenance and future-facing orchestration
