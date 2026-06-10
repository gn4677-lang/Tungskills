---
name: assign-system-boundaries
description: "Use when a change may move system responsibility: module/API/data/runtime ownership, dependency direction, public contracts, LLM-vs-deterministic truth, validators/guards/repair loops, semantic overreach, or fat-file boundary risk."
---

# Assign System Boundaries

## Core

Use this before implementing when a local fix could silently move responsibility.

Primary owner: where a responsibility lives, who owns truth/action, and which layer may validate, reject, repair, or decide.

Does not own: ordinary code style review, generic security scanning, or product slice selection.

## Two Questions

1. Where does this responsibility live?
2. Who owns truth or action?

If either answer is unclear, do not patch by convenience.

## Ownership Rules

- Deterministic code owns formulas, schemas, thresholds, persistence invariants, exact guards, and mechanical validation.
- LLMs own ambiguous language understanding, synthesis, classification, explanation, and user-intent judgment when no deterministic oracle exists.
- Hybrid ownership is valid when deterministic code frames allowed options and the LLM chooses or explains inside that frame.
- Deterministic code may validate, reject, downgrade, derive, or request one bounded repair round.
- Deterministic code must not silently rewrite semantic intent, route, action, disposition, `base_dish`, `brand`, `listed_items`, or user-visible natural response unless a product-approved oracle exists.
- Keyword lists, regexes, dictionaries, fixture labels, and lexical hints may warn or route review; they must not prove semantic support unless explicitly approved as product truth.

## Architecture Rules

- Public API, data model, persistence, auth, runtime truth, and dependency direction are high-risk boundaries.
- New helpers do not belong in orchestration or protected fat files just because that is faster.
- Shared utilities require a stable owner and real consumers.
- Subagent or PR splits should follow responsibility boundaries, not file count.

## Stop Signals

Stop when:

- a validator becomes the semantic router
- a repair loop fabricates or overwrites meaning
- a local cleanup changes public contracts
- a helper grows a protected/fat file
- an LLM/template split makes the assistant look intelligent while final text is deterministic

## Verification

Before claiming boundary safety, name:

- responsibility owner
- truth/action owner
- deterministic role
- boundary invariant
- evidence: schema, test, trace, dependency graph, product-truth note, or human approval

Hand off to `prove-agentic-capability` when the boundary must be proven by evals or live-stage gates.
