---
name: agent-durability-ops
description: Use when the main problem is background runtime durability or operational continuity, especially agent 背景任務, crash recovery, worker/job lifecycle, checkpointing, snapshot bootstrapping, budget/quota guards, state restoration across sessions/devices, or background memory sync. Trigger on failure modes such as worker crash, recovery after partial completion, duplicate execution, idempotency risk, or quota exhaustion. Do not use as primary for search/RAG, active context packing, proactive reminders, or provider/model failover.
---

# Agent Durability Ops

Use this skill when the agent must stay recoverable, synchronized, and budget-aware across background operation, multiple sessions, or multiple collaborators.

## Operating mode

Use this as an operational design workflow, not a memory reference. Start from the runtime's failure and recovery requirements, then define the durable control plane.

Before reading references, write down:

- the work that continues outside the foreground turn
- the state that must survive process, device, or session failure
- the actor that owns each state transition
- the budget, quota, and rollback limit

## Default Output

```text
Durability risk: ...
Background maintenance loop: ...
State ownership and sync rule: ...
Budget and quota guard: ...
Recovery and bootstrap path: ...
Observability and rollback rule: ...
Operator runbook check: ...
Handoff block: optional
Decision: proceed | narrow | stop
```

## Workflow

1. Classify the durability problem as one of:
   - resumable execution
   - background maintenance
   - shared-state synchronization
   - snapshot bootstrap
   - crash recovery
   - budget or quota runaway
2. Choose the durable mechanism:
   - checkpoint for resumable workflow state
   - ledger for task history and audit
   - lock or lease for background workers
   - snapshot for bootstrap and rollback
   - budget gate before expensive loops
3. Read [references/claude-code-patterns.md](references/claude-code-patterns.md) for background extraction, consolidation, recovery, and budget patterns.
4. Read [references/openclaw-patterns.md](references/openclaw-patterns.md) for gateway ownership, background actors, ledgers, and shared-state semantics.
5. Read [references/wave1-patterns.md](references/wave1-patterns.md) when long-lived memory products, session persistence, or inspectable durable state are part of the design.
6. Read [references/wave3-patterns.md](references/wave3-patterns.md) when durable execution backends, disaster recovery, worker lifecycle, operator runbooks, or human-in-the-loop resume are part of the design.
7. Read [references/translation.md](references/translation.md) only after choosing the durable mechanism.
8. Return the Default Output, using [../agent-runtime-architecture/references/handoff-schema.md](../agent-runtime-architecture/references/handoff-schema.md) when a handoff is needed.

## Rules

- Treat durability as a first-class runtime subsystem, not an implementation detail.
- Separate foreground response quality from background maintenance quality.
- Prefer `agent-context-architecture` when the problem is "what should be in context right now" rather than "how state is maintained over time".
- Define what state is local, shared, cached, derived, and recoverable.
- Background jobs must have gates, locks, retry limits, and rollback behavior.
- Shared memory must have explicit conflict semantics; never rely on incidental file behavior.
- Budget guards must act before runaway loops, not only after spend is visible.
- When budget exhaustion affects a user-visible result, specify the operator action and whether degraded response ownership hands off to `agent-fallback-eval`.
- Recovery must specify what is restored, what is recomputed, and what is discarded.
- Checkpoints are not a memory product by themselves; they are execution recovery artifacts.
- Every detached job needs idempotency, ownership, trace ID, and a terminal state.
- Choose a durable mechanism by resume granularity, side-effect risk, approval needs, budget exposure, and operator visibility.
- Durable workflows require deterministic replay boundaries; side-effecting tools belong behind idempotent activities or guarded tasks.
- Include at least one chaos case, such as worker crash, duplicate wake, stale lock, quota exhaustion, or conflicting shared update.
- If the core complaint is forgetting, session leakage, identity confusion, or context packing in the active loop, route to `agent-context-architecture`.
- If the core complaint is search, retrieval, or document scope, route to `agent-retrieval-architecture`.
- If the core complaint is reminders, wake triggers, or autonomy policy, route to `agent-proactive-architecture`.
- If the core complaint is provider failure, retry, or degraded response behavior, route to `agent-fallback-eval`.

## Stop Signals

Stop or narrow when:

- a background worker has no owner, lease, idempotency key, trace ID, retry limit, or terminal state
- checkpointing is used as a memory product instead of execution recovery
- a crash, duplicate wake, stale lock, or quota exhaustion case is not described
- user-visible degradation is being designed without a handoff to `agent-fallback-eval`

## Verification

Before claiming durability is safe, name the evidence: durable mechanism, state owner, lease/lock rule, idempotency boundary, recovery path, budget gate, operator runbook check, and chaos case.
