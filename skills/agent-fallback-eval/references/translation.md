# Translation

Use this file to extract product capabilities from reliability patterns.

## Capability: graceful survival

- Runtime pattern:
  - staged retry and failover
- Product capability:
  - the system keeps helping instead of collapsing on first provider or model trouble
- Surface shape:
  - failure handling should be visible as a staged policy, not a mysterious provider roulette
- Keep deterministic:
  - failure categories
  - retry limits
- Make agentic:
  - choosing the best degraded behavior once a category is known
- Failure mode if missing:
  - random silent failures or brute-force retries

## Capability: explicit degraded modes

- Runtime pattern:
  - fallback changes the behavior, not just the model
- Product capability:
  - users still get a useful but reduced response under stress
- Surface shape:
  - degraded behavior should still fit the channel and delivery surface instead of dumping raw errors
- Keep deterministic:
  - degraded-mode policy
- Make agentic:
  - when to return summary-only, draft-only, or delayed-delivery behavior
- Failure mode if missing:
  - "fallback" becomes an invisible quality drop with no product design

## Capability: inspectable failures

- Runtime pattern:
  - trace and runtime state are preserved for diagnosis
- Product capability:
  - teams can see why the agent failed and what it tried next
- Surface shape:
  - operators need task, presence, or run surfaces that expose failures without reading raw logs first
- Keep deterministic:
  - trace schema
  - retention of run metadata
- Make agentic:
  - none; diagnosis surfaces should be explicit
- Failure mode if missing:
  - everything gets blamed on "the model was weird"

## Capability: measurable eval loop

- Runtime pattern:
  - traces, datasets, feedback, and prompt iterations are linked rather than handled as separate tools
- Product capability:
  - teams can turn repeated failures into a visible improvement loop instead of anecdotal debugging
- Surface shape:
  - operators need dataset, trace, and prompt-version surfaces that line up with each other
- Keep deterministic:
  - eval schema
  - dataset selection policy
  - release criteria
- Make agentic:
  - selecting the best narrowed reproduction path once a failure class is known
- Failure mode if missing:
  - teams collect traces but never improve behavior systematically

## Capability: guarded runtime control

- Runtime pattern:
  - guardrails and human approval can interrupt, redirect, or constrain a run
- Product capability:
  - reliability is not only "retry harder"; risky or ambiguous work can be paused before it becomes damage
- Surface shape:
  - approvals and interruptions should appear as explicit run-state transitions, not hidden policy decisions
- Keep deterministic:
  - interruption points
  - approval requirements
  - policy classes
- Make agentic:
  - what safe degraded option to propose while waiting for approval
- Failure mode if missing:
  - the system either over-automates risky work or forces humans to micromanage every run

## Capability: stable operator contract

- Runtime pattern:
  - run metadata, error surfaces, and control fields evolve with backward-compatibility discipline instead of ad hoc renaming
- Product capability:
  - operators, dashboards, and downstream tooling can trust reliability surfaces across upgrades
- Surface shape:
  - trace fields, run states, and control APIs should feel stable enough to automate against
- Keep deterministic:
  - public field names
  - deprecation policy
  - compatibility guarantees
- Make agentic:
  - almost nothing; this is mostly interface discipline
- Failure mode if missing:
  - debugging and automation break whenever the runtime internals are refactored

## Capability: sticky-but-escapable failover

- Runtime pattern:
  - session-sticky profile preference plus cooldown-based escape hatches
- Product capability:
  - the system benefits from warm caches and stable auth until evidence says it should rotate
- Surface shape:
  - fallback should preserve session continuity while still escaping poisoned credentials or overloaded lanes
- Keep deterministic:
  - pinning rules
  - cooldown policy
- Make agentic:
  - which acceptable degraded path is best once a profile or model is unhealthy
- Failure mode if missing:
  - either credential thrash or a session stuck on a dying route
