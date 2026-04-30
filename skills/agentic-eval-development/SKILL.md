---
name: agentic-eval-development
description: Use when designing or revising evals for agentic products, Eval Driven Development, 評測驅動開發, manager agents, multi-agent systems, tool orchestration, guardrails, handoffs, traces, graders/rubrics, product-truth validation, capability evals, regression seeds, benchmark replay governance, fixture-shape drift, strict eval overfitting, path-specific grading, or scaffold overfitting. Use when Codex encounters eval dataset, trace replay, regression case, B2 strict cases, or product truth vs fixture truth.
---

# Agentic Eval Development

## Overview

Use this to design evals that validate agentic product behavior without letting fixtures, benchmarks, or runner payloads become product truth.

Core principle: eval assets validate product truth; they do not define architecture, manager contracts, tool semantics, or user-visible behavior.

## Default Output

Keep the answer compact:

```text
Product truth: ...
Agent behavior under eval: ...
Trace surface: ...
Grader type: deterministic | model | human | hybrid
Capability or regression: ...
Regression seed provenance: ...
Rubric calibration / acceptance threshold: ...
Fixture-shape risk: ...
Decision: proceed | narrow | stop
```

## Decision Rules

1. Start from intended user-visible behavior and truth ownership.
2. Name the agent behavior being evaluated: manager decision, tool call, handoff, guard, state transition, final response, or multi-agent coordination.
3. Define the trace surface before choosing graders.
4. Separate capability evals from regression evals.
5. Prefer deterministic graders where possible; use model or human graders for subjective behavior and calibrate them.
6. Treat a green fixture with wrong product behavior as incomplete or misaligned eval evidence.
7. Use `agent-fallback-eval` instead when the primary problem is retry, failover, degraded mode, runtime failure class, or failure regression.
8. Use `llm-deterministic-boundary` when an eval failure exposes a truth-owner conflict between LLM judgment, prompt behavior, deterministic code, validators, or guards.
9. Use `agent-runtime-activation-ladder` when the primary question is whether an evaluated capability may run live, user-facing, canary, shadow, or mutation-bearing.
10. When converting trace replay into regression seeds, name seed provenance, replay selection criteria, rubric calibration, and the acceptance threshold.
11. Do not let strict cases, path-specific pass criteria, repair success, or three-round stability define product architecture; include outcome-based grading, negative/holdout cases, and model-tier comparison when scaffold overfitting is a risk.

## Heuristics

| If you see | Prefer |
| --- | --- |
| Benchmark payload shaping a manager contract | Stop; resolve product truth first. |
| Multi-agent split because the task feels complex | Narrow; require eval-backed reason for added orchestration. |
| Final answer looks good | Check tool, handoff, guard, state, and manager traces. |
| One SKU or one case fixed by a prompt | Check the broader failure family before patching. |
| Provider timeout, rate limit, or failover issue | Route to `agent-fallback-eval`. |
| Subjective quality claim | Add rubric plus human calibration or sampling. |
| Strict eval checks exact steps instead of useful outcomes | Prefer outcome grading, partial credit, and negative cases that catch overtriggering. |

## Stop Signals

Do not proceed when:

- fixtures, runner fields, or benchmark vocabulary define product architecture
- no trace can show the agent behavior under eval
- capability and regression evals are mixed into one pass/fail claim
- a judge prompt is treated as truth without calibration
- evals optimize a happy path while hiding tool, guard, or handoff failures
- strict evals make a guard, repair loop, or scaffold look necessary without testing whether stronger models need it

## Verification

Before claiming an agentic eval is useful, name the evidence: trace sample, dataset source, grader type, rubric, deterministic oracle, human calibration, regression seed, or explicit product-truth rationale.
