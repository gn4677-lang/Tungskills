# Wave 3 Patterns

Use this file when the durability problem involves durable execution backends, disaster recovery, worker lifecycle, operator runbooks, or human-in-the-loop resume.

## Sources promoted

- Temporal: durable execution, workflows, activities, retries, timers, signals, task queues, and replay discipline.
  - Source: https://temporal.io/home
- Pydantic AI durable execution: durable agents integrated with Temporal, DBOS, and Prefect.
  - Source: https://ai.pydantic.dev/durable_execution/overview/
- Microsoft Agent Framework: checkpointing, pause/resume, streaming workflows, and human-in-the-loop approvals.
  - Source: https://devblogs.microsoft.com/agent-framework/microsoft-agent-framework-version-1-0/
- DBOS: durable workflows and crashproof agent execution patterns.
  - Source: https://www.dbos.dev/solutions/agentic-ai-platform
- Prefect: dynamic Python workflows, retries, caching, task observability, and event-driven execution.
  - Source: https://www.prefect.io/solutions/durable-execution

## Durable mechanism selector

| Need | Prefer | Why | Caution |
| --- | --- | --- | --- |
| Resume a multi-step agent after crash or approval | checkpointed workflow | preserves progress and avoids repeating completed steps | checkpoints are not durable memory |
| Retry external side effects safely | activity/task wrapper | isolates retry policy around a side-effect boundary | tool/activity must be idempotent or guarded |
| Run scheduled or event-triggered maintenance | background job with lease | prevents duplicate workers and stale ownership | needs terminal states and retry limits |
| Recover from corrupted or missing local state | snapshot plus recompute path | separates bootstrap from live updates | define what is discarded |
| Coordinate human approval | pause/resume workflow | records pending request and resumes after response | approval payload must be auditable |
| Control runaway cost | budget gate before loop | stops spend before execution expands | reporting after the fact is too late |

## Backend framing

- Temporal-style durable workflow:
  - best for long-running, multi-step, replayable execution
  - requires deterministic workflow code and idempotent activities
- DBOS-style durable workflow:
  - best when database-backed durability and observable transactional execution fit the stack
  - still needs explicit side-effect ownership and approval boundaries
- Prefect-style dynamic workflow:
  - best when native Python control flow, task observability, retries, and cacheable task results are primary
  - still requires workload-specific review for exactly-once claims
- Framework-native checkpointing:
  - best for agent workflow pause/resume and human-in-the-loop approval
  - must define where checkpoints are stored and how stale or incompatible checkpoints are handled

## Worker lifecycle contract

Every detached worker, maintenance loop, or durable workflow needs:

- owner key
- lease or lock rule
- input payload hash
- idempotency key
- retry policy
- budget gate
- trace ID
- terminal states: succeeded, failed, canceled, expired, superseded
- rollback or compensation path
- operator-visible last heartbeat and last error

## Operator runbook check

Return an operator runbook check when durability is the primary layer:

- how to see current jobs, checkpoints, leases, and budgets
- how to resume, cancel, replay, or mark a job superseded
- how to detect duplicate workers or stale locks
- how to restore from snapshot or recompute derived state
- what data is safe to discard
- which traces prove the recovery path worked

## Chaos cases

- Worker crashes after completing a tool call but before writing terminal state.
- Duplicate wake starts two workers for the same maintenance job.
- Human approval arrives after the checkpoint expired.
- Snapshot is older than live derived state.
- Budget is exhausted halfway through a multi-step run.
- Retry succeeds after the user already canceled or superseded the task.

## Boundary reminders

- Route to `agent-context-architecture` when the question is what belongs in context now.
- Route to `agent-fallback-eval` when the question is user-visible degraded behavior after provider/tool failure.
- Keep durability answers focused on survival, recovery, synchronization, budget, and operator control.
