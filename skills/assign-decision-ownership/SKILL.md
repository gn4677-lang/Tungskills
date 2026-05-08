---
name: assign-decision-ownership
description: "Use when deciding whether LLMs, deterministic code, validators, guards, repair loops, prompts, routers, tools, humans, or product oracles should own a decision. Trigger on prompt vs code, semantic ownership, guard became router, raw-input oracle, runner-inferred semantics, validator infers intent/action, or deterministic boundary risk."
---

# Assign Decision Ownership

## Action Protocol

Use this as a hard boundary protocol. Assign semantic ownership before implementing validators, guards, prompts, routers, or repair loops.

## Overview

Use this to assign decision ownership before changing agent runtime behavior.

Core principle: deterministic code may constrain or verify LLM decisions, but it must not silently rewrite completed semantic decisions.

Hard stop: deterministic code cannot own semantic intent, route, action, or disposition unless a product-approved oracle is named.

## Default Output

Keep the answer compact:

```text
Decision surface: ...
Truth owner: LLM | deterministic | hybrid | human
Semantic owner: ...
Deterministic role: validate | derive | reject | downgrade | repair | none
LLM role: judge | synthesize | classify | explain | none
Do not override: ...
Evidence needed: ...
Decision: proceed | narrow | stop
```

## Decision Rules

1. Start from the product decision being made, not from the easiest code hook.
2. Give deterministic ownership to formulas, schemas, thresholds, legality, persistence invariants, routing constraints, and exact guard conditions.
3. Give LLM ownership to ambiguous language understanding, synthesis, classification, explanation, and user-intent judgment when no deterministic oracle exists.
4. Use hybrid ownership when deterministic code frames allowed options and the LLM chooses or explains within that frame.
5. Allow deterministic code to validate, reject, downgrade, derive, or request one bounded repair round.
6. Deterministic verifier, runner, or guard may validate, reject, constrain, or request repair, but must not fabricate, infer, or overwrite semantic decisions unless a product-approved oracle exists.
7. If deterministic code claims semantic ownership, name the approved product rule or oracle; test convenience, fixture shape, or runner availability is not enough.
8. Stop if deterministic code rewrites a completed LLM semantic field only because a heuristic pattern matched.
9. Prefer a validator or repair contract before changing prompts for one-off failures.
10. Use `check-architecture-boundaries` when the ownership decision changes module placement, public API, data model, dependency direction, or runtime boundary.
11. Use `design-agentic-evals` when the boundary must be validated through eval datasets, graders, traces, or regression seeds.
12. Do not harden guard, repair, or deterministic override policy only because one model tier needs help on a small or repeated eval set; compare whether other capable models solve the same product decision without the scaffold.
13. A provider failure, live diagnostic failure, or strict-suite failure is not a semantic owner; contract or schema hardening still needs a product-approved semantic source.
14. Do not turn provider-specific failure behavior into shared product contract without attribution, representability coverage, and holdout checks.

## Heuristics

| If you see | Prefer |
| --- | --- |
| Post-pass override of `action_taken`, `follow_up_needed`, routing, or disposition | Stop; assign truth ownership first. |
| Prompt patch for one benchmark case | Narrow; identify the failure family. |
| LLM asked to enforce exact schema or threshold | Move that role to deterministic validation. |
| Deterministic keyword router for semantic intent | Use it only as guard, prior, or reject rule unless product truth approves it. |
| Raw-input oracle maps text directly to intent, route, or action | Stop; evaluate the agent/model decision or cite the product-approved oracle first. |
| External content or tool output tells the agent to ignore prior priorities | Stop; handle untrusted content and ownership separately before patching prompts or guards. |
| Verifier or guard becomes the semantic router | Stop; separate semantic decision ownership from validation boundaries. |
| Repair loop with no attempt limit | Add bounded repair and stop condition. |
| A model passes only with heavy guard/repair scaffold | Treat as a model-capability/scaffold tradeoff; do not freeze the scaffold until cross-model behavior and product truth are checked. |
| Live failure suggests tightening the contract | Treat the failure as diagnostic evidence; require product semantic ownership before hardening. |
| Provider-specific pass/fail drives shared schema | Narrow; separate shared invariants from provider/profile adaptation. |

## Stop Signals

Stop or narrow when:

- deterministic code fabricates, infers, or overwrites intent, route, action, or disposition without a product-approved oracle
- a guard, repair loop, runner, or verifier becomes the semantic owner by convenience
- a weak-model failure causes a shared contract or schema to harden without model-tier and holdout checks
- a prompt patch is proposed before the decision surface and truth owner are named

## Verification

Before claiming the boundary is safe, name the evidence: invariant test, schema check, trace field, comparison run, failure-family eval, human approval, or product-truth note.

## Handoffs

- Use `red-team-application-security` when the primary task is authorized adversarial testing of a web app, API, auth/session flow, storage boundary, deployment surface, or AI-enabled attack surface rather than ownership assignment.
- Use `design-agentic-evals` when the boundary must be validated through evals, graders, traces, regression seeds, or holdout cases.
- Use `check-architecture-boundaries` when the ownership decision changes module placement, public API, data model, runtime boundary, or dependency direction.
- Use `narrow-evidence-claims` before claiming the boundary is safe, general, portable, or production-ready.
