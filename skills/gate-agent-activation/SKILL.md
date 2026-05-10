---
name: gate-agent-activation
description: "Use when deciding whether an agent capability may move from fake/local/offline to live provider, diagnostic, shadow, canary, user-facing, mutation-bearing, or production-like operation. Trigger on live test, canary, shadow, rollout, 開給使用者, 寫入真實資料, mutation authority, red-team pass, or activation readiness."
---

# Gate Agent Activation

## Action Protocol

Use this as a hard gate. Decide the highest permitted activation stage from evidence, and separate built/tested/live/shadow/canary/user-facing/mutation claims.

## Overview

Use this to decide how far an agentic capability may be turned on.

Core principle: capability dependency decides what to build next; activation ladder decides how safely a built capability may run.

Positive default: promote a built capability only to the highest runtime stage supported by current evidence, permissions, rollback, and user impact controls.

Hard stop: built, tested, green, shadowed, or merged does not by itself permit user-facing or mutation-bearing activation.

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
Tested adversarial surfaces: ...
Residual risk / untested surfaces: ...
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
7. Route timeout, rate limit, provider failover, or concurrency as the primary problem to `design-agent-fallbacks`.
8. Use `narrow-evidence-claims` before claiming rollout readiness.
9. Use `design-agentic-evals` when the primary task is designing the eval suite, grader, trace replay, or regression seed rather than deciding activation stage.
10. Use `assign-decision-ownership` when activation would change whether LLM output, deterministic code, or a human owns runtime truth.
11. Use `gate-delivery-readiness` when the question is whether a PR, queue candidate, CI result, or deployment pipeline may merge or release the capability.
12. Passing a strict harness, diagnostic suite, or repeated stability runs is activation evidence only; it does not freeze guard/repair architecture, prove model portability, or skip shadow/canary checks across model tiers.
13. Single-profile live evidence or full-suite diagnostic pass remains `live-diagnostic` evidence until model/profile diversity, holdout coverage, claim boundaries, and rollback/no-commit fallback are present.
14. A pass that appears only after prompt, schema, guard, or contract hardening must not advance activation until overfit risk and legal-flow representability are reviewed.
15. A future-wave PR being implemented, reviewed, or green is not activation permission; merging active imports, routes, schedulers, DB migrations, user-visible behavior, or mutation authority requires an activation-stage decision.
16. Guard, contract, schema, and no-runtime-effect slices may enter main as activation controls; hidden or shadow implementation must remain non-authoritative until the next ladder step has evidence.
17. A red-team pass, no-findings report, pentest, or prompt-injection review is not rollout permission; it proves only the tested adversarial scope.
18. Before canary, user-facing, or mutation-bearing promotion, name which adversarial surfaces were tested, which were not tested, and which safeguards still bound the residual risk.

## Heuristics

| If you see | Prefer |
| --- | --- |
| Fake provider green -> live user-facing | Stop; require live diagnostic and shadow first. |
| Closure gate green -> live diagnostic with no product change | Proceed if traces and fallback exist. |
| Shadow looks better once -> write canonical state | Stop; mutation-bearing needs rollout evidence. |
| Strict harness passes repeatedly -> freeze scaffold | Narrow; compare shadow behavior across model tiers before treating guard/repair weight as product architecture. |
| Single-profile live pass -> private use or canary | Stop; require portability evidence and explicit activation review. |
| Full-suite pass after hardening -> readiness | Narrow; check overfit risk, representability, and holdout coverage first. |
| Red-team pass or pentest report -> canary now | Narrow; adversarial evidence is one input, not activation permission by itself. |
| All providers live in parallel | Narrow; isolate one provider/model first or route fallback concerns. |
| Capability built -> activate for users | Stop; build completion is not activation permission. |
| Future-wave PR wants merge because implementation is complete | Narrow; merge only activation controls unless the capability is promoted. |
| Hidden code touches route, scheduler, or mutation path | Stop; that is activation, not passive shadow code. |

## Stop Signals

Stop or narrow when live LLM output would own product truth, user-visible behavior, or mutation before the stage has required evidence.

## Verification

Before advancing, name the evidence: contract, deterministic gate, live trace, shadow comparison, canary metric, guard result, rollback/no-commit fallback, audit trail, or approval.

## Handoffs

- Use `red-team-application-security` when the missing evidence is adversarial testing of auth/session, API abuse, file upload/storage, data exposure, prompt/tool misuse, memory, RAG, or other application attack surfaces.
- Use `gate-delivery-readiness` for PR, CI, merge queue, release gate, or deploy readiness.
- Use `narrow-evidence-claims` before saying the capability is ready, safe, stable, or production-grade.
- Use `design-agentic-evals` when the missing evidence is an eval suite, grader, trace replay, or holdout design.
