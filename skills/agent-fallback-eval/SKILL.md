---
name: agent-fallback-eval
description: Use when the main problem is runtime failure handling, especially retry, timeout, rate limit, provider/model failover, degraded mode, trace fields, eval loops for failures, concurrency budgets, or guardrail stop/approval boundaries. Use when Codex encounters tool timeout, provider 掛掉, 降級回應, 失敗恢復 policy, or retry/failover confusion. Do not use as primary for proactive reminders or general eval-suite design.
---

# Agent Fallback Eval

Use this skill when provider failures, model failures, or invisible runtime errors are degrading the agent experience.

## Operating mode

Use this as a reliability workflow, not a list of fallback ideas. Start from a concrete failure surface, then define retry, failover, degraded behavior, traces, and evals as one contract.

Before reading references, write down:

- the operation that failed
- whether the failure is transient, deterministic, policy-related, context-related, or quality-related
- the user-visible impact
- the safe degraded result

## Workflow

1. Classify the failure as one of:
   - rate limit or quota
   - timeout or transport
   - provider/model unavailable
   - tool or auth failure
   - context overflow or bad compaction
   - low-quality answer
   - unsafe or out-of-policy action
2. Choose the response policy:
   - retry same operation
   - rotate auth/profile
   - fail over provider or model
   - resume from checkpoint or context summary
   - return degraded result
   - stop and ask for human approval
3. Read [references/claude-code-patterns.md](references/claude-code-patterns.md) for explicit retry/fallback, context recovery, and degraded behavior patterns.
4. Read [references/openclaw-patterns.md](references/openclaw-patterns.md) for per-request retry, auth rotation, stickiness, cooldowns, and failure-class escalation.
5. Read [references/wave1-patterns.md](references/wave1-patterns.md) when tracing, eval datasets, or human approval surfaces matter.
6. Read [references/wave2-patterns.md](references/wave2-patterns.md) when stable runtime contracts or operator-facing compatibility matter.
7. Read [references/wave3-patterns.md](references/wave3-patterns.md) when a failure-class matrix, guardrail placement, trace-to-eval loop, stop condition, or durable retry boundary is needed.
8. Read [references/translation.md](references/translation.md) only after choosing the response policy.
9. Return:
   - failure surface
   - retry rule
   - failover rule
   - degraded mode
   - trace additions
   - eval additions
   - stop condition
   - regression dataset seed
   - optional handoff block using [../agent-runtime-architecture/references/handoff-schema.md](../agent-runtime-architecture/references/handoff-schema.md)

## Rules

- Separate retry from failover.
- Retry the current request, not the entire multi-step workflow, unless explicitly justified.
- Define what a degraded success looks like.
- Add traces before adding more prompt text.
- Do not hide repeated failure behind infinite retries or model hopping.
- Trace inputs, chosen policy, attempt count, failure class, model/provider, latency, cost, and final user-visible outcome.
- Evals should include fair transcript review plus at least one regression for each failure class.
- Map every failure class to a response policy, stop condition, trace fields, and regression seed before adding another fallback path.
- State which guardrails apply to input, tool, output, and handoff boundaries; do not assume one guardrail covers every path.
- State which tools, hosted or built-in capabilities, and handoff paths cannot be wrapped by the proposed guardrail, then choose a stop or approval boundary for those paths.
- If the core complaint is "the agent should initiate action", route to `agent-proactive-architecture`.
- If the primary work is designing eval suites, graders, product-truth rubrics, regression datasets, or Eval Driven Development beyond a concrete runtime failure class, route to `agentic-eval-development`.

## Live LLM Eval Discipline

Use this when live provider tests, manager evals, tool-loop evals, or model comparison runs time out or hit rate limits.

- Default to `max_concurrency=1` for provider debugging until one case has known latency and failure class.
- Isolate one provider/model/profile before comparing multiple providers.
- Set both per-request timeout and total run budget.
- Retry timeout or rate-limit failures with bounded exponential backoff and jitter.
- Honor provider retry guidance such as `retry-after` when present.
- Retry the failed request, not the whole eval workflow, unless the workflow is explicitly idempotent.
- Trace provider, model, profile, attempt count, latency, timeout, rate-limit signal, failure class, and final outcome.
- Use batch, queue, or background mode only when synchronous user latency is not under test.
- Stop parallel expansion when errors increase faster than completed cases.
