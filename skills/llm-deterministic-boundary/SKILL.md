---
name: llm-deterministic-boundary
description: Use when deciding whether LLMs, deterministic code, validators, guards, repair loops, prompts, semantic routing, post-pass overrides, or agent decision authority should own a product/workflow decision. Use when Codex encounters 該寫 prompt 還是 code, deterministic rule vs LLM judgment, validator/guard ownership, semantic router, or code overwriting an LLM semantic decision.
---

# LLM Deterministic Boundary

## Overview

Use this to assign decision ownership before changing agent runtime behavior.

Core principle: deterministic code may constrain or verify LLM decisions, but it must not silently rewrite completed semantic decisions.

## Default Output

Keep the answer compact:

```text
Decision surface: ...
Truth owner: LLM | deterministic | hybrid | human
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
6. Stop if deterministic code rewrites a completed LLM semantic field only because a heuristic pattern matched.
7. Prefer a validator or repair contract before changing prompts for one-off failures.
8. Use `architecture-boundary-governance` when the ownership decision changes module placement, public API, data model, dependency direction, or runtime boundary.
9. Use `agentic-eval-development` when the boundary must be validated through eval datasets, graders, traces, or regression seeds.

## Heuristics

| If you see | Prefer |
| --- | --- |
| Post-pass override of `action_taken`, `follow_up_needed`, routing, or disposition | Stop; assign truth ownership first. |
| Prompt patch for one benchmark case | Narrow; identify the failure family. |
| LLM asked to enforce exact schema or threshold | Move that role to deterministic validation. |
| Deterministic keyword router for semantic intent | Use it only as guard, prior, or reject rule unless product truth approves it. |
| Repair loop with no attempt limit | Add bounded repair and stop condition. |

## Verification

Before claiming the boundary is safe, name the evidence: invariant test, schema check, trace field, comparison run, failure-family eval, human approval, or product-truth note.
