---
name: agentic-eval-development
description: Use when designing or revising agentic evals, Eval Driven Development, manager or multi-agent behavior, tool orchestration, guardrails, handoffs, traces, graders or rubrics, product-truth validation, capability evals, regression seeds, benchmark replay, fixture-shape drift, eval overfitting, harness or scaffold confounders, raw prompt to route, oracle leakage, dataset leakage, runner-inferred semantics, adversarial holdouts, attack replay, poisoned-context replay, red-team regressions, fix-verification suites, live failure shaping contract, legal-flow matrix, or product truth vs fixture truth.
---

# Agentic Eval Development

## Overview

Use this to design evals that validate agentic product behavior without letting fixtures, benchmarks, or runner payloads become product truth.

Core principle: eval assets validate product truth; they do not define architecture, manager contracts, tool semantics, or user-visible behavior.

Hard stop: do not use eval, fixture, runner, or live-failure evidence as the only source for product semantics or contract hardening.

## Read First

- Read `references/semantic-ownership-and-harness-leakage.md` when evals, runners, fixtures, guards, or verifiers may infer semantic decisions from raw input, dataset wording, or test convenience.

## Workflow

1. Name the product truth and the agent behavior under eval.
2. Separate agent/model decision, deterministic validation, and state/output correctness.
3. Choose trace fields before grader type.
4. Identify leakage risks from fixtures, runners, seeds, guards, and replay selection.
5. Add negative or holdout coverage before using eval results to change prompts, schemas, or contracts.

## Default Output

Keep the answer compact:

```text
Product truth: ...
Agent behavior under eval: ...
Decision under test: ...
Trace surface: ...
Grader type: deterministic | model | human | hybrid
Deterministic validation boundary: ...
Capability or regression: ...
Regression seed provenance: ...
Rubric calibration / acceptance threshold: ...
Fixture-shape risk: ...
Harness leakage risk: ...
Contract change source: product rule | trace attribution | eval failure only | unknown
Representability / legal-flow coverage: ...
Negative / holdout coverage: ...
Decision: proceed | narrow | stop
```

## Decision Rules

1. Start from intended user-visible behavior and truth ownership.
2. Name the agent behavior being evaluated: manager decision, tool call, handoff, guard, state transition, final response, or multi-agent coordination.
3. Define the trace surface before choosing graders.
4. Separate the agent/model decision under test, deterministic validation boundary, and state/output correctness before writing pass/fail logic.
5. Do not let evals, harnesses, or runners infer semantic route, intent, action, mutation disposition, or workflow outcome from raw input keywords unless a product-approved oracle exists.
6. Do not let regression seeds turn fixture wording, dataset labels, seed data, or runner convenience into product semantics.
7. Separate capability evals from regression evals.
8. Prefer deterministic graders where possible; use model or human graders for subjective behavior and calibrate them.
9. Treat a green fixture with wrong product behavior as incomplete or misaligned eval evidence.
10. Use `agent-fallback-eval` instead when the primary problem is retry, failover, degraded mode, runtime failure class, or failure regression.
11. Use `llm-deterministic-boundary` when an eval failure exposes a truth-owner conflict between LLM judgment, prompt behavior, deterministic code, validators, or guards.
12. Use `agent-runtime-activation-ladder` when the primary question is whether an evaluated capability may run live, user-facing, canary, shadow, or mutation-bearing.
13. When converting trace replay into regression seeds, name seed provenance, replay selection criteria, rubric calibration, and the acceptance threshold.
14. Do not let fixed strict cases, path-specific pass criteria, repair success, or repeated stability runs define product architecture; include outcome-based grading, negative/holdout cases, and model-tier comparison when eval or scaffold overfitting is a risk.
15. Treat live, provider, or full-suite failures as evidence for attribution, semantic audit, representability review, and holdout design; do not let them directly justify prompt, schema, or contract hardening.
16. Before tightening a contract from eval evidence, require a product-approved semantic source plus legal-flow or representability coverage and holdout cases that catch both over-triggering and over-blocking.
17. Use `application-security-red-teaming` when the primary task is adversarial discovery, app/API attack-family selection, prompt/tool attack design, memory or RAG poisoning exploration, or authorized white-hat probing rather than replay and regression design.

## Heuristics

| If you see | Prefer |
| --- | --- |
| Benchmark payload shaping a manager contract | Stop; resolve product truth first. |
| Multi-agent split because the task feels complex | Narrow; require eval-backed reason for added orchestration. |
| Final answer looks good | Check tool, handoff, guard, state, and manager traces. |
| One SKU or one case fixed by a prompt | Check the broader failure family before patching. |
| Live failure triggers schema or prompt hardening | Stop; require attribution, product semantic source, representability coverage, and holdout cases first. |
| Full-suite pass after hardening | Narrow; check whether the pass is scaffold/provider-specific before upgrading claims. |
| A prompt-injection or poisoning bug is already known | Design attack replay, poisoned-context replay, and adversarial holdouts before claiming it is closed. |
| Provider timeout, rate limit, or failover issue | Route to `agent-fallback-eval`. |
| Subjective quality claim | Add rubric plus human calibration or sampling. |
| Eval checks exact steps or tool order instead of useful outcomes | Prefer outcome grading, partial credit, and negative cases that catch overtriggering. |

## Stop Signals

Do not proceed when:

- fixtures, runner fields, or benchmark vocabulary define product architecture
- no trace can show the agent behavior under eval
- eval or harness logic maps raw input keywords directly to intent, route, action, mutation disposition, or workflow outcome
- runner, verifier, seed data, or guard fabricates a missing semantic decision instead of checking trace or structured agent output
- capability and regression evals are mixed into one pass/fail claim
- a judge prompt is treated as truth without calibration
- evals optimize a happy path while hiding tool, guard, or handoff failures
- repeated eval passes make a guard, repair loop, or scaffold look necessary without testing holdout cases, model tiers, and harness confounders
- a live or full-suite failure is used as the only source for prompt, schema, contract, or product semantic hardening
- hardening lacks a legal-flow, representability, or holdout anti-overfit check

## Verification

Before claiming an agentic eval is useful, name the evidence: trace sample, dataset source, grader type, rubric, deterministic oracle, human calibration, regression seed, or explicit product-truth rationale.

## Handoffs

- Use `application-security-red-teaming` for adversarial discovery and white-hat attack-family selection.
- Use `llm-deterministic-boundary` when a discovered issue is really about semantic ownership rather than replay design.
