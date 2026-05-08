# Translation

Use this file to extract product capabilities from durability patterns.

## Capability: safe background memory maintenance

- Runtime pattern:
  - extraction and consolidation run in background workers with gates, locks, and narrow permissions
- Product capability:
  - the assistant improves its long-term memory without making every foreground response slower or riskier
- Operator surface:
  - maintenance should be traceable as runtime housekeeping, not invisible magic
- Keep deterministic:
  - scheduling gates
  - locking and rollback rules
  - tool permission envelope
- Make agentic:
  - what to extract, consolidate, prune, or leave untouched
- Failure mode if missing:
  - memory quality decays, or background jobs become unsafe and noisy

## Capability: trustworthy shared team memory

- Runtime pattern:
  - explicit pull/push sync, optimistic locking, conflict retries, and watcher-driven propagation
- Product capability:
  - collaborators can teach the agent shared operating knowledge without turning memory into a race condition
- Operator surface:
  - shared-state sync should expose enough provenance and conflict behavior that teams trust it
- Keep deterministic:
  - sync semantics
  - checksum and conflict rules
  - suppression and debounce policy
- Make agentic:
  - what should remain private versus what deserves promotion into shared memory
- Failure mode if missing:
  - shared memory drifts, flaps, duplicates, or loses edits unpredictably

## Capability: recoverable agent state

- Runtime pattern:
  - snapshots, resume normalization, and explicit local recovery paths
- Product capability:
  - agents can restart, hand off, or bootstrap into a known-good state instead of starting from a blank or corrupted context
- Operator surface:
  - resume, snapshot, and replace flows should be explicit lifecycle actions, not hidden repair
- Keep deterministic:
  - snapshot format
  - sync markers
  - restore versus replace rules
- Make agentic:
  - whether to merge, preserve, or discard local learned state during recovery
- Failure mode if missing:
  - restarts create fragmented identity, duplicated work, or stale memory overlays

## Capability: inspectable memory lifecycle

- Runtime pattern:
  - persistent memory exposes history, feedback, and scoped storage rather than acting as a hidden blob
- Product capability:
  - long-running systems can correct, audit, and refine durable memory without relying on transcript archaeology
- Operator surface:
  - memory lifecycle operations should be visible enough for repair and governance, not only for model prompting
- Keep deterministic:
  - scope boundaries
  - history retention
  - correction flow
- Make agentic:
  - what deserves promotion, correction, or demotion in durable memory
- Failure mode if missing:
  - durable memory becomes sticky but unfixable

## Capability: budget-aware execution

- Runtime pattern:
  - token estimation, quota warnings, diminishing-return checks, and hard USD stop conditions
- Product capability:
  - the assistant can scale up when justified and stop when continued looping is wasteful or unsafe
- Operator surface:
  - budget state should be inspectable before it becomes a surprise bill or a silent stop
- Keep deterministic:
  - budget thresholds
  - hard-stop conditions
  - warning policy
- Make agentic:
  - whether the remaining budget should be spent on another loop, compaction, or a narrower answer
- Failure mode if missing:
  - runaway loops, hidden cost spikes, or work that dies without a graceful fallback

## Capability: durable operational control plane

- Runtime pattern:
  - background polling, cache validation, eligibility checks, and fail-open or fail-closed rules for control-plane state
- Product capability:
  - policy, quota, and operational limits can change over time without making the main assistant loop brittle
- Operator surface:
  - control-plane refresh should show up in status or audits, not only as invisible internal churn
- Keep deterministic:
  - cache invalidation
  - retry envelope
  - fallback posture
- Make agentic:
  - almost nothing; this layer should stay mostly operational and constrained
- Failure mode if missing:
  - runtime behavior becomes unpredictable when policy or quota state changes mid-session

## Capability: auditable detached work

- Runtime pattern:
  - detached runs create task records with explicit queued, running, terminal, and lost states
- Product capability:
  - operators can inspect what background work happened without reconstructing it from transcripts
- Operator surface:
  - tasks are the ledger for detached work, not the scheduler itself
- Keep deterministic:
  - task lifecycle states
  - retention and cleanup policy
- Make agentic:
  - almost nothing; detached work visibility should remain mostly explicit and operational
- Failure mode if missing:
  - background work becomes impossible to audit, debug, or trust
