---
name: agentic-eval-development
description: Use when designing or revising evals for agentic products, Eval Driven Development, 評測驅動開發, manager agents, multi-agent systems, tool orchestration, guardrails, handoffs, traces, graders/rubrics, product-truth validation, capability evals, regression seeds, benchmark replay governance, fixture-shape drift, eval/test-set overfitting, path-specific grading, harness/scaffold confounders, raw prompt to route, fixture-shaped eval, oracle leakage, dataset leakage, runner inferred semantics, self-fulfilling harness, live failure shaping contract, contract hardening from eval failure, full-suite false green, holdout anti-overfit, legal-flow matrix, provider-specific hardening, or product truth vs fixture truth.
---

# Agentic Eval Development

## Overview

Use this to design evals that validate agentic product behavior without letting fixtures, benchmarks, or runner payloads become product truth.

Core principle: eval assets validate product truth; they do not define architecture, manager contracts, tool semantics, or user-visible behavior.

## Read First

- Read `references/semantic-ownership-and-harness-leakage.md` when evals, runners, fixtures, guards, or verifiers may infer semantic decisions from raw input, dataset wording, or test convenience.

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

## Heuristics

| If you see | Prefer |
| --- | --- |
| Benchmark payload shaping a manager contract | Stop; resolve product truth first. |
| Multi-agent split because the task feels complex | Narrow; require eval-backed reason for added orchestration. |
| Final answer looks good | Check tool, handoff, guard, state, and manager traces. |
| One SKU or one case fixed by a prompt | Check the broader failure family before patching. |
| Live failure triggers schema or prompt hardening | Stop; require attribution, product semantic source, representability coverage, and holdout cases first. |
| Full-suite pass after hardening | Narrow; check whether the pass is scaffold/provider-specific before upgrading claims. |
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
