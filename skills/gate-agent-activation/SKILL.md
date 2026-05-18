---
name: gate-agent-activation
description: "Use when deciding whether an agent capability may move from fake/local/offline to live provider, diagnostic, shadow, canary, user-facing, mutation-bearing, or production-like operation. Trigger on live test, pre-live gate, live-failure regression, canary, shadow, rollout, user-facing enablement, 開給使用者, 寫入真實資料, mutation authority, red-team pass, fake pass, capability realism, or activation readiness."
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
Activation invariant: ...
Known live-failure gates: passed | missing | not_applicable
Required evidence: ...
Tested adversarial surfaces: ...
Residual risk / untested surfaces: ...
Capability realism evidence: ...
Safe fallback: ...
Decision: proceed | narrow | stop
```

## Activation Order

Move one step at a time unless the skipped stage is explicitly irrelevant:

`contract -> fake -> deterministic -> live-diagnostic -> shadow -> canary -> user-facing -> mutation-bearing`

## Decision Rules

1. Move one activation step at a time unless the skipped stage is explicitly irrelevant.
2. Name the activation invariant: what user-visible behavior, runtime truth, or mutation authority must not turn on early.
3. Fake, fixture, unit, runner, diagnostic, or strict-suite passes do not permit user-facing or mutation-bearing activation.
4. `live-diagnostic` needs contract-backed I/O, trace surface, deterministic closure gate, and no user-visible or mutation authority.
5. `shadow` needs live-diagnostic evidence, comparable current-path output, and isolated candidate output.
6. `canary` or `user-facing` needs shadow evidence, rollback/no-commit fallback, guard behavior, monitoring, and claim boundaries.
7. `mutation-bearing` needs explicit mutation boundary, audit trail, rollback/compensation path, and human/product approval where needed.
8. Before spending another live/canary run, pass pre-live gates for known traceable live-failure families when such gates exist.
9. Single-profile live evidence remains diagnostic until diversity, holdouts, fallback, and claim boundaries are present.
10. Red-team or no-findings evidence is not rollout permission; it covers only the tested adversarial scope.
11. Future-wave implementation being green is not activation permission; active imports, routes, schedulers, DB migrations, user-visible behavior, or mutation authority require activation review.
12. AI user-facing promotion needs capability realism evidence: real entrypoint, intended semantic owner, final response owner, representative raw prompts, trace path, state effect, and user-perceived output check.

## Heuristics

| If you see | Prefer |
| --- | --- |
| Fake provider green -> live user-facing | Stop; require live diagnostic and shadow first. |
| Shadow looks better once -> write canonical state | Stop; mutation-bearing needs rollout evidence. |
| Single-profile live pass -> canary | Require portability evidence and activation review. |
| Previous live failure has a cheap pre-live gate | Run that gate before another live/canary attempt. |
| Browser baseline passes but assistant feels templated | Require capability realism evidence before user-facing AI claims. |
| Live LLM invoked but final text is deterministic copy | Treat as structured-decision evidence only. |
| Hidden code touches route, scheduler, or mutation path | Stop; that is activation, not passive shadow code. |

## Stop Signals

Stop or narrow when live LLM output would own product truth, user-visible behavior, or mutation before the stage has required evidence, when the activation invariant is not named, or when known live-failure gates are missing before the next live/canary run.

## Verification

Before advancing, name the evidence: activation invariant, known live-failure gate result, contract, deterministic gate, live trace, shadow comparison, canary metric, guard result, rollback/no-commit fallback, audit trail, or approval.

## Handoffs

- Use `red-team-application-security` when the missing evidence is adversarial testing of auth/session, API abuse, file upload/storage, data exposure, prompt/tool misuse, memory, RAG, or other application attack surfaces.
- Use `gate-delivery-readiness` for PR, CI, merge queue, release gate, or deploy readiness.
- Use `narrow-evidence-claims` before saying the capability is ready, safe, stable, or production-grade.
- Use `design-agentic-evals` when the missing evidence is an eval suite, grader, trace replay, or holdout design.
