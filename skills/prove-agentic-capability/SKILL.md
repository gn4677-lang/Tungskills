---
name: prove-agentic-capability
description: "Use when proving or gating agentic product capability: EDD, golden sets, fake-pass diagnosis, trace replay, browser evaluator loops, holdouts, pre-live gates, stale evidence, activation stages, delivery readiness, or claims like done/ready/safe/live."
---

# Prove Agentic Capability

## Core

Use this to prove that an agentic capability is real, not fixture-backed, template-backed, screenshot-backed, or locally overclaimed.

Primary owner: eval design, mechanism-first EDD, claim narrowing, activation gating, and delivery readiness claims.

Does not own: ordinary unit-test TDD, generic verification-before-final, frontend testing mechanics, or runtime design.

## Modes

Choose one primary mode:

- Mechanism-first EDD: build or fix the mechanism before adding more broad cases.
- Fake-pass diagnosis: tests pass but self-use or E2E behavior is wrong.
- Trace-to-prelive gate: turn live-run failures into cheaper gates.
- Browser evaluator loop: evaluator uses browser/DOM/interaction evidence and feeds findings back into implementation.
- Claim narrowing: evidence is partial, stale, fixture-backed, local-only, or artifact-only.
- Activation gate: fake/local/offline/diagnostic/shadow/canary/live stage movement.
- Delivery gate: pre-PR, PR-ready, queue-ready, merge-ready, deploy-ready, release-ready, production-ready.

## Proof Rules

- Start from expected user-visible capability, not test names.
- Name the mechanism that should make the capability true.
- Use contracts and invariants to prevent local fake passes.
- Holdouts catch overfit; they do not replace mechanism proof.
- Screenshots support human review only when inspected in the same run and used in the feedback loop.
- Do not claim natural assistant behavior if final response text is deterministic template output.
- CI green is not merge-ready unless base, queue, environment gates, and release claim are also true.
- Lab/shadow/canary/live stage movement needs explicit mutation, provider, user-visible, and rollback evidence.

## Minimum Capability Record

Use this only when a gate or handoff needs structure:

```text
Capability:
Mechanism:
Evidence:
Invariant:
Holdout or pre-live gate:
Claim allowed:
Next stage allowed:
```

## Stop Signals

Stop when:

- adding another golden case is proposed before the mechanism is understood
- evidence comes from stale screenshots or old artifacts
- tests assert fixtures instead of runtime behavior
- assistant says "logged/updated/sent" without state proof
- merge/live readiness is inferred from local tests only

## Verification

Before saying ready, state what is proven, what is not proven, and which exact claim is allowed. Hand off to `design-agent-runtime` if the runtime mechanism is missing.
