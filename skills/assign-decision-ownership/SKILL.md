---
name: assign-decision-ownership
description: "Use when deciding whether LLMs, deterministic code, validators, guards, repair loops, prompts, routers, tools, humans, renderers, or product oracles should own a decision or user-visible answer. Trigger on prompt vs code, semantic ownership, response ownership, template response, guard became router, raw-input oracle, runner-inferred semantics, keyword scaffold, evidence-span support, or deterministic boundary risk."
---

# Assign Decision Ownership

## Action Protocol

Use this as a hard boundary protocol. Assign semantic ownership before implementing validators, guards, prompts, routers, repair loops, or evidence-support checks.

## Overview

Use this to assign decision ownership before changing agent runtime behavior.

Core principle: deterministic code may constrain or verify LLM decisions, but it must not silently rewrite completed semantic decisions.

Positive default: assign each decision to the layer that can make it correctly, verify it cheaply, and expose failures without hidden semantic overrides.

Hard stop: deterministic code cannot own semantic intent, route, action, or disposition unless a product-approved oracle is named.

Hard stop: keyword lists, regexes, lexical hints, dictionaries, or fixture labels cannot prove semantic support unless a product-approved oracle explicitly gives that lexical rule ownership.

## Read First

- Read `references/semantic-support-and-keyword-scaffold.md` when keyword lists, term maps, regexes, dictionaries, lexical hints, evidence support, groundedness, category support, or axis support are involved.

## Default Output

Keep the answer compact:

```text
Decision surface: ...
Truth owner: LLM | deterministic | hybrid | human
Semantic owner: ...
Final response owner: LLM composer | deterministic renderer | hybrid | human | none
Semantic proof source: evidence span | product oracle | lexical scaffold | none
Deterministic role: validate | derive | reject | downgrade | repair | none
Scaffold allowed role: warning | negative guard | smoke test | prior | none
LLM role: judge | synthesize | classify | explain | none
Ownership invariant: ...
Do not override: ...
Evidence needed: ...
Decision: proceed | narrow | stop
```

## Decision Rules

1. Start from the product decision, not the easiest code hook.
2. Deterministic code owns formulas, schemas, thresholds, legality, persistence invariants, routing constraints, and exact guard conditions.
3. LLMs own ambiguous language understanding, synthesis, classification, explanation, and user-intent judgment when no deterministic oracle exists.
4. Hybrid ownership is valid when deterministic code frames allowed options and the LLM chooses or explains within that frame.
5. Name the ownership invariant: the decision that must not silently move to another layer.
6. Deterministic code may validate, reject, downgrade, derive, or request one bounded repair round.
7. Deterministic guards, verifiers, runners, and repair loops must not fabricate, infer, or overwrite semantic decisions unless a product-approved oracle exists.
8. Provider failures, live failures, and strict-suite failures are diagnostic evidence, not semantic owners.
9. Keyword lists, regexes, lexical hints, dictionaries, and fixture labels may warn, reject, prioritize review, or smoke test; they must not prove semantic support.
10. For semantic support, prefer evidence-span ownership: LLM/human/tool/oracle proposes support state and cited evidence; deterministic code validates shape, provenance, containment, enum legality, and review routing.
11. Assign final response ownership separately from structured decision ownership. Do not claim natural assistant behavior if visible text is owned by a deterministic template.

## Heuristics

| If you see | Prefer |
| --- | --- |
| LLM asked to enforce exact schema or threshold | Move that role to deterministic validation. |
| Deterministic keyword router for semantic intent | Use only as guard, prior, warning, or review trigger unless product truth approves it. |
| LLM proposes support with cited source span | Let deterministic code validate provenance and containment; do not reinterpret meaning from keywords. |
| Visible answer is templated | Split manager decision ownership from final-response ownership. |
| Verifier or guard becomes the semantic router | Stop; separate decision ownership from validation. |
| Live failure suggests tightening the contract | Treat as diagnostic evidence until product semantic ownership is named. |

## Stop Signals

Stop or narrow when:

- deterministic code fabricates, infers, or overwrites intent, route, action, or disposition without a product-approved oracle
- the ownership invariant is missing for a high-impact decision boundary
- keyword lists, regexes, lexical hints, dictionaries, or fixture labels are treated as semantic proof
- a validator claims category, axis, groundedness, or support from lexical hits instead of cited evidence spans or a product-approved oracle
- a scaffold created for cheap warning, negative guard, or smoke testing becomes the primary semantic mechanism
- a guard, repair loop, runner, or verifier becomes the semantic owner by convenience
- a weak-model failure causes a shared contract or schema to harden without model-tier and holdout checks
- a prompt patch is proposed before the decision surface and truth owner are named
- the product claim is "intelligent assistant" or "manager-style agent" but final user-visible text is owned by a deterministic template without that limitation being named

## Verification

Before claiming the boundary is safe, name the evidence: invariant test, schema check, trace field, comparison run, failure-family eval, human approval, product-truth note, cited evidence span, provenance check, or product-approved oracle.

## Handoffs

- Use `red-team-application-security` when the primary task is authorized adversarial testing of a web app, API, auth/session flow, storage boundary, deployment surface, or AI-enabled attack surface rather than ownership assignment.
- Use `design-agentic-evals` when the boundary must be validated through evals, graders, traces, regression seeds, or holdout cases.
- Use `check-architecture-boundaries` when the ownership decision changes module placement, public API, data model, runtime boundary, or dependency direction.
- Use `narrow-evidence-claims` before claiming the boundary is safe, general, portable, or production-ready.
