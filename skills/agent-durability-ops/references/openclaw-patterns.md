# OpenClaw Patterns For Durability Ops

Use this file for long-lived assistant durability patterns from `openclaw-main.zip`.

## Pattern: the gateway owns long-lived runtime state

- Confidence: `doc-confirmed`, partially `code-confirmed`
- Source area:
  - docs: `docs/concepts/session.md`, `docs/reference/session-management-compaction.md`
  - code surface: `src/config/sessions.ts`
- Why it matters:
  - session stores, transcripts, and maintenance state live in one control plane
  - durability depends on a clear owner, not on whichever client was last connected

## Pattern: background jobs are separate runtime actors

- Confidence: `doc-confirmed`, partially `code-confirmed`
- Source area:
  - docs: `docs/automation/index.md`, `docs/automation/cron-jobs.md`, `docs/automation/tasks.md`
- Why it matters:
  - recurring or maintenance work should have explicit ownership and lifecycle
  - a background subsystem should not silently inherit every foreground permission or context rule

## Pattern: tasks are a ledger, not the scheduler

- Confidence: `doc-confirmed`
- Source area:
  - docs: `docs/automation/tasks.md`, `docs/automation/index.md`
- Why it matters:
  - detached work needs auditable lifecycle records even when scheduling is owned elsewhere
  - runtime durability improves when operators can inspect queued, running, lost, or failed work explicitly

## Pattern: operational state survives beyond one chat turn

- Confidence: `doc-confirmed`
- Source area:
  - docs: `docs/reference/session-management-compaction.md`, `docs/automation/tasks.md`
- Why it matters:
  - a serious agent stores working state, recovery markers, and maintenance outputs outside the visible chat stream
  - continuity depends on lifecycle state, not just transcript length

## Pattern: silent housekeeping is part of durability design

- Confidence: `doc-confirmed`
- Source area: `docs/reference/session-management-compaction.md`
- Why it matters:
  - memory flushes and pre-compaction maintenance may need to run without user-visible chatter
  - silent runtime work still needs explicit rules for delivery suppression and lifecycle tracking

## Pattern: collaboration requires explicit shared-state semantics

- Confidence: `doc-confirmed`
- Source area:
  - docs: `docs/concepts/session.md`, `docs/channels/channel-routing.md`
- Why it matters:
  - multiple humans or agents touching the same memory surface need deterministic rules for ownership and propagation
  - "shared memory" without sync semantics becomes an integrity problem

## Pattern: long-lived agents need resource discipline

- Confidence: `doc-confirmed`
- Source area:
  - docs: `docs/reference/session-management-compaction.md`, `docs/reference/token-use.md`, `docs/reference/api-usage-costs.md`
- Why it matters:
  - powerful agents still need token, latency, and retry budgets
  - the runtime should know when to continue, compact, pause, or ask for a narrower plan
