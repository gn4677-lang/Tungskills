# Translation

Use this file to extract product capabilities from context patterns.

## Capability: isolated continuity

- Runtime pattern:
  - session routing by source, user, and scope
- Product capability:
  - the assistant remembers the right things in the right thread without leaking across users or surfaces
- Surface shape:
  - make session ownership visible in status, reset, and audit surfaces
- Keep deterministic:
  - identity mapping
  - session boundary rules
- Make agentic:
  - deciding which recent evidence matters inside that boundary
- Failure mode if missing:
  - cross-user leakage, fractured continuity, or one giant chat bucket

## Capability: durable coaching memory

- Runtime pattern:
  - sparse typed memory plus background memory extraction
- Product capability:
  - the assistant remembers recurring preferences, goals, and barriers without replaying whole transcripts
- Surface shape:
  - keep durable memory mostly invisible until it affects answer quality or needs explicit inspection
- Keep deterministic:
  - memory schema
  - retention policy
  - what categories should never be stored as memory
- Make agentic:
  - whether a new observation deserves promotion into memory
- Failure mode if missing:
  - either total forgetfulness or an oversized profile blob

## Capability: stateful memory contract

- Runtime pattern:
  - the agent is explicitly treated as stateful, with persistent memory considered part of its identity and API posture
- Product capability:
  - teams design memory as a stable runtime contract instead of a hidden implementation detail
- Surface shape:
  - memory should have inspectable boundaries and explicit scopes even when the user rarely sees them
- Keep deterministic:
  - memory scopes
  - persistence contract
  - what counts as durable identity versus temporary session state
- Make agentic:
  - when a new observation crosses the bar into durable state
- Failure mode if missing:
  - persistence grows opportunistically without a clear concept of agent identity

## Capability: compact but coherent sessions

- Runtime pattern:
  - compaction and summaries as normal maintenance
- Product capability:
  - long-running relationships stay coherent without exploding context cost
- Surface shape:
  - compaction should preserve a stable session identity even when old raw messages disappear
- Keep deterministic:
  - compaction trigger thresholds
- Make agentic:
  - what survives each compaction pass
- Failure mode if missing:
  - bloated prompts, lost context, or brittle summaries

## Capability: stable session notes

- Runtime pattern:
  - session memory updated only after meaningful token and tool-use growth
- Product capability:
  - the assistant keeps a working notebook for long sessions without thrashing or overwriting itself every turn
- Surface shape:
  - session notes should support operator inspection and resume, not just model prompting
- Keep deterministic:
  - update thresholds
  - file or section structure
- Make agentic:
  - what progress, errors, and state changes deserve inclusion
- Failure mode if missing:
  - either stale session notes or excessive background churn

## Capability: continuity-preserving compaction

- Runtime pattern:
  - compaction keeps a maintained session notebook and preserves tool/message invariants
- Product capability:
  - long threads can shrink without losing the actionable work state or breaking downstream protocol assumptions
- Surface shape:
  - manual reset, daily reset, and auto-compaction should feel like different lifecycle actions, not random history loss
- Keep deterministic:
  - boundary rules
  - min/max preserved window
- Make agentic:
  - what goes into the notebook that will survive compaction
- Failure mode if missing:
  - compaction either loses critical work state or produces invalid message sequences

## Capability: periodic memory cleanup

- Runtime pattern:
  - a gated background consolidation pass orients, gathers, consolidates, and prunes
- Product capability:
  - long-term memory gets cleaner and more coherent over time instead of only growing
- Surface shape:
  - cleanup should run as quiet housekeeping unless it changes something worth surfacing
- Keep deterministic:
  - consolidation gates
  - locking behavior
  - index constraints
- Make agentic:
  - which memories should merge, be corrected, or be pruned
- Failure mode if missing:
  - long-term memory drifts, duplicates, and accumulates contradictions

## Capability: shared-but-safe team memory

- Runtime pattern:
  - team memory sync with explicit pull/push rules, path validation, and watcher-driven updates
- Product capability:
  - multiple collaborators can accumulate shared operating memory without turning one user's local edits into silent corruption for everyone else
- Surface shape:
  - promotion into shared memory should be explicit enough that operators can trust where team knowledge came from
- Keep deterministic:
  - sync semantics
  - path safety
  - secret filtering
- Make agentic:
  - what deserves promotion into shared memory rather than staying private
- Failure mode if missing:
  - collaboration memory becomes either unsafe, inconsistent, or too fragile to trust

## Capability: role-scoped persistent memory

- Runtime pattern:
  - separate agent memory directories and scopes, optionally bootstrapped from snapshots
- Product capability:
  - planner, reviewer, coach, and analyst agents can each accumulate their own durable experience without contaminating one another
- Surface shape:
  - role boundaries should be visible in tooling and bootstrap flows, not only in prompt text
- Keep deterministic:
  - scope definitions
  - snapshot application rules
- Make agentic:
  - what each role should learn over time
- Failure mode if missing:
  - all specialist agents collapse into one noisy generic memory pool

## Capability: long-lived append-only capture

- Runtime pattern:
  - assistant mode writes timestamped daily logs and distills later
- Product capability:
  - perpetual assistants can capture ongoing signal without constantly rewriting a central index during the day
- Surface shape:
  - append-only capture should preserve chronology for operators while staying cheap for the model
- Keep deterministic:
  - log path scheme
  - append-only rules
  - distillation boundary
- Make agentic:
  - what observations deserve to be logged
- Failure mode if missing:
  - long-lived sessions either lose chronology or thrash shared memory files

## Capability: predictable memory refresh

- Runtime pattern:
  - memoized memory/context loads are cleared at explicit session and compaction boundaries
- Product capability:
  - memory-backed behavior stays stable within a turn and refreshes at understandable lifecycle points
- Surface shape:
  - refresh boundaries should align with user-visible lifecycle events like reset, resume, and compaction
- Keep deterministic:
  - cache invalidation triggers
  - reload reasons
- Make agentic:
  - nothing; this is mainly runtime discipline
- Failure mode if missing:
  - either stale memory persists too long or hot-reload creates inconsistent behavior mid-session
