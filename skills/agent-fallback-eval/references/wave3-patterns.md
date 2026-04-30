# Wave 3 Patterns

Use this file when the reliability problem needs a failure-class matrix, guardrail placement, trace-to-eval loop, stop condition, or durable retry boundary.

## Sources promoted

- OpenAI Agents SDK: input/output/tool guardrails, tripwires, handoff caveats, and trace spans.
  - Source: https://openai.github.io/openai-agents-python/guardrails/
- Langfuse: traces, sessions, observations, datasets, experiments, cost, latency, and LLM-as-judge.
  - Source: https://langfuse.com/docs/observability/overview
- Arize Phoenix: OpenTelemetry tracing, datasets, experiments, evaluator explanations, and trace evals.
  - Source: https://arize.com/docs/phoenix/evaluation/llm-evals/evaluator-traces
- Pydantic Evals: systematic evaluation for simple LLM calls through multi-agent apps.
  - Source: https://ai.pydantic.dev/evals/
- Ragas: RAG and agent/tool-use metrics.
  - Source: https://docs.ragas.io/en/stable/concepts/metrics/
- TruLens: feedback functions for groundedness, relevance, moderation, and custom app metrics.
  - Source: https://www.trulens.org/component_guides/evaluation/
- Temporal: durable retry and recovery boundaries for long-running work.
  - Source: https://temporal.io/home

## Failure-class matrix

| Failure class | First response | Stop condition | Trace fields | Eval seed |
| --- | --- | --- | --- | --- |
| Rate limit or quota | retry after delay or rotate allowed profile | budget exhausted, cooldown exceeded, or no eligible profile | provider, profile, quota bucket, retry-after, attempt count | "quota pressure should degrade without loop" |
| Timeout or transport | retry current operation only | max attempts or SLA exceeded | endpoint/tool, latency, timeout class, attempt count | "single slow tool should not replay whole workflow" |
| Provider/model unavailable | fail over within policy | all eligible providers unavailable or incompatible | model, provider, fallback target, compatibility reason | "fallback preserves contract shape" |
| Tool/auth failure | refresh auth or return actionable degraded result | auth refresh failed or permission denied | tool, auth profile, permission scope, side-effect status | "auth failure does not fabricate tool output" |
| Context overflow/bad compaction | resume from checkpoint or rebuild context pack | required state cannot be reconstructed | context size, compaction version, checkpoint ID, omitted sources | "compaction keeps pending actions and decisions" |
| Low-quality answer | run eval/critic or request missing source | confidence below threshold after retry | rubric, score, missing evidence, retrieved sources | "quality failure becomes dataset example" |
| Unsafe/out-of-policy action | tripwire and stop for approval | guardrail blocks or human rejects | guardrail name, policy class, blocked action, approval ID | "unsafe tool call is blocked before side effect" |

## Guardrail placement

- Input guardrail: validate user request, scope, policy, and required source before the main agent acts.
- Tool guardrail: validate arguments before execution and output after execution when the tool path supports it.
- Output guardrail: validate final answer, format, policy, and evidence before returning to the user.
- Handoff boundary: record which guardrails do and do not apply across handoff paths.
- Tripwire: stop immediately when continuing would create unsafe, costly, or misleading behavior.

## Trace-field checklist

Add trace fields before adding more retry or failover logic:

- run ID, session ID, user/workspace scope
- failure class
- operation name
- tool/model/provider/profile
- attempt count
- retry and failover policy selected
- guardrail name and result
- checkpoint or resume ID when used
- latency, token count, and cost
- degraded mode selected
- final user-visible outcome

## Eval seed shape

Each regression seed should include:

- user request
- minimal prior context or checkpoint summary
- expected failure class
- allowed response policy
- forbidden behavior
- trace fields that must be present
- acceptance rule for degraded success

## Trace-to-dataset loop

1. Capture production or test traces with failure class and outcome.
2. Convert representative failures into regression seeds.
3. Evaluate retrieval/tool/answer quality separately when possible.
4. Keep judge explanations, not only numeric scores.
5. Re-run the dataset before changing retry, failover, guardrail, or model policy.

## Boundary reminders

- Retry is for transient operation failure; failover is for provider/model/profile substitution.
- Durable workflow recovery belongs in `agent-durability-ops` when the main problem is long-running execution survival.
- Retrieval-quality evaluation belongs in `agent-retrieval-architecture` when the main failure is source selection or grounding.
