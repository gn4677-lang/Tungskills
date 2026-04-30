# Claude Code Patterns For Frictionless Design

Use this file for low-friction interaction patterns confirmed from `cc-haha-main.zip`.

## Pattern: progress is surfaced through the loop

- Confidence: `code-confirmed`
- Source area:
  - `src/query.ts`
- Why it matters:
  - the runtime is built to emit streaming progress instead of making users wait for a single final blob
  - visible progress reduces perceived latency and uncertainty

## Pattern: context preparation reduces needless clarification

- Confidence: `code-confirmed`
- Source area:
  - `src/constants/prompts.ts`
  - `src/query.ts`
- Why it matters:
  - better context assembly reduces avoidable back-and-forth
  - low friction is partly a runtime preparation problem, not only a UX copy problem

## Pattern: failure handling protects continuity

- Confidence: `code-confirmed`
- Source area:
  - `src/services/api/withRetry.ts`
  - `src/query.ts`
- Why it matters:
  - resilient runtimes dump less repair work back on the user
  - friction is often caused by weak fallback, not only by bad interface design
