---
name: agent-runtime-activation-ladder
description: Use when deciding when to run live LLM/provider tests, diagnostic canaries, shadow mode, canary rollout, user-facing rollout, mutation authority, fake-to-live promotion, provider/tool activation, or runtime rollout maturity. Use when Codex encounters 要不要上線, 開給使用者, 寫入真實資料, strict harness pass, repeated stability runs, model portability, shadow, canary, or whether a built agent capability may become live, user-facing, or mutation-bearing.
---

# Agent Runtime Activation Ladder

## Overview

Use this to decide how far an agentic capability may be turned on.

Core principle: capability dependency decides what to build next; activation ladder decides how safely a built capability may run.

## Default Output

Keep the answer compact:

```text
Capability: ...
Capability dependency status: missing | draft | contract-backed | tested
Current activation: contract | fake | deterministic | live-diagnostic | shadow | canary | user-facing | mutation-bearing
Target activation: ...
User-facing changed: true | false
Runtime truth changed: true | false
Mutation changed: true | false
Required evidence: ...
Safe fallback: ...
Decision: proceed | narrow | stop
```

## Activation Order

Move one step at a time unless the skipped stage is explicitly irrelevant:

`contract -> fake -> deterministic -> live-diagnostic -> shadow -> canary -> user-facing -> mutation-bearing`

## Decision Rules

1. A capability may run live LLM diagnostic before it is user-facing.
2. A capability must not become user-facing or mutation-bearing just because fake, fixture, unit, runner, or diagnostic tests passed.
3. To move into `live-diagnostic`, require a contract-backed input/output boundary, trace surface, deterministic closure gate, and no direct user-visible or mutation authority.
4. To move into `shadow`, require live-diagnostic evidence, comparable current-path output, and isolated candidate output.
5. To move into `canary` or `user-facing`, require shadow evidence, rollback or no-commit fallback, guard behavior, monitoring, and claim boundaries.
6. To move into `mutation-bearing`, require user-facing stability, explicit mutation boundary, audit trail, rollback or compensation path, and human/product approval where needed.
7. Route timeout, rate limit, provider failover, or concurrency as the primary problem to `agent-fallback-eval`.
8. Use `evidence-claim-integrity` before claiming rollout readiness.
9. Use `agentic-eval-development` when the primary task is designing the eval suite, grader, trace replay, or regression seed rather than deciding activation stage.
10. Use `llm-deterministic-boundary` when activation would change whether LLM output, deterministic code, or a human owns runtime truth.
11. Passing a strict harness, diagnostic suite, or repeated stability runs is activation evidence only; it does not freeze guard/repair architecture, prove model portability, or skip shadow/canary checks across model tiers.

## Heuristics

| If you see | Prefer |
| --- | --- |
| Fake provider green -> live user-facing | Stop; require live diagnostic and shadow first. |
| Closure gate green -> live diagnostic with no product change | Proceed if traces and fallback exist. |
| Shadow looks better once -> write canonical state | Stop; mutation-bearing needs rollout evidence. |
| Strict harness passes repeatedly -> freeze scaffold | Narrow; compare shadow behavior across model tiers before treating guard/repair weight as product architecture. |
| All providers live in parallel | Narrow; isolate one provider/model first or route fallback concerns. |
| Capability built -> activate for users | Stop; build completion is not activation permission. |

## Stop Signals

Stop or narrow when live LLM output would own product truth, user-visible behavior, or mutation before the stage has required evidence.

## Verification

Before advancing, name the evidence: contract, deterministic gate, live trace, shadow comparison, canary metric, guard result, rollback/no-commit fallback, audit trail, or approval.
