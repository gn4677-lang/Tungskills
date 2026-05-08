# Claude Code Patterns For Fallback And Eval

Use this file for reliability patterns confirmed from `cc-haha-main.zip`.

## Pattern: retry and fallback are explicit policies

- Confidence: `code-confirmed`
- Source area:
  - `src/services/api/withRetry.ts`
- Why it matters:
  - transient retry, 529 handling, persistent retry, and fallback triggers are runtime policy, not prompt magic

## Pattern: reliability includes context recovery

- Confidence: `code-confirmed`
- Source area:
  - `src/query.ts`
  - compact-related imports surfaced there
- Why it matters:
  - prompt-too-long and overflow conditions are treated as reliability problems with defined recovery paths

## Pattern: degraded behavior is better than abrupt failure

- Confidence: `code-confirmed`
- Source area:
  - `src/services/api/withRetry.ts`
  - `src/query.ts`
- Why it matters:
  - the runtime keeps trying alternate paths before surfacing hard failure
  - this is the backbone for product-level graceful degradation
