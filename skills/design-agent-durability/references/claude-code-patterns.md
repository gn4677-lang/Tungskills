# Claude Code Patterns For Durability Ops

Use this file for code-confirmed durability and operational patterns from `cc-haha-main`.

## Pattern: background extraction runs beside the foreground loop

- Confidence: `code-confirmed`
- Source area:
  - `src/services/extractMemories/extractMemories.ts`
- Why it matters:
  - durable memory maintenance is not forced into the user's foreground turn
  - cursoring, coalescing, trailing runs, and drain behavior make background work operationally safe

## Pattern: consolidation is a gated subsystem with rollback

- Confidence: `code-confirmed`
- Source area:
  - `src/services/autoDream/autoDream.ts`
  - `src/services/autoDream/consolidationLock.ts`
  - `src/services/autoDream/consolidationPrompt.ts`
- Why it matters:
  - consolidation is scheduled by explicit time and session gates
  - lock acquisition, stale-holder recovery, and rollback keep background memory cleanup from corrupting state

## Pattern: team memory is optimistic sync, not shared-disk magic

- Confidence: `code-confirmed`
- Source area:
  - `src/services/teamMemorySync/index.ts`
  - `src/services/teamMemorySync/watcher.ts`
- Why it matters:
  - shared memory uses pull/push semantics, per-key checksums, ETag conflict handling, batching, and retry policy
  - watcher debounce and suppression rules are part of the design, not incidental glue

## Pattern: snapshot bootstrapping is separate from live memory

- Confidence: `code-confirmed`
- Source area:
  - `src/tools/AgentTool/agentMemorySnapshot.ts`
- Why it matters:
  - project snapshots seed or replace local agent memory without making all memory globally shared
  - bootstrapping and steady-state writes are different lifecycle phases

## Pattern: recovery is a first-class resume surface

- Confidence: `code-confirmed`
- Source area:
  - `src/utils/conversationRecovery.ts`
  - `src/localRecoveryCli.ts`
- Why it matters:
  - interrupted sessions are detected and normalized before resume
  - recovery is designed as a controlled state-restoration path, not a best-effort transcript replay

## Pattern: budgets are execution guards, not reporting only

- Confidence: `code-confirmed`
- Source area:
  - `src/query/tokenBudget.ts`
  - `src/QueryEngine.ts`
  - `src/services/tokenEstimation.ts`
  - `src/cost-tracker.ts`
  - `src/services/claudeAiLimits.ts`
- Why it matters:
  - token, quota, and USD budgets directly influence whether loops continue, stop, or warn
  - runtime budgeting exists before and during execution, not only in after-the-fact analytics

## Pattern: policy and quota fetchers are background operational surfaces

- Confidence: `code-confirmed`
- Source area:
  - `src/services/policyLimits/index.ts`
  - `src/services/claudeAiLimits.ts`
- Why it matters:
  - operational safety includes background polling, cache validation, fail-open or fail-closed rules, and eligibility checks
  - control-plane state must refresh without destabilizing the foreground interaction loop
