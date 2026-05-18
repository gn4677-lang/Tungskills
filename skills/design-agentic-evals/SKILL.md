---
name: design-agentic-evals
description: "Use when designing or revising agentic evals, EDD, Golden Sets, trace replay, graders, holdouts, mechanism-first checks, implementation-reference passes, fake pass prevention, capability realism, browser-green-but-product-fake, template response risk, harness leakage, eval overfitting, fixture-shaped evals, runner-inferred semantics, lexical oracle risk, evidence-span support, or tests passing while real AI behavior is missing."
---

# Design Agentic Evals

## Action Protocol

Use this as an eval design protocol. Separate agent decision, deterministic validation, product truth, trace evidence, regression seeds, and holdouts before adding or trusting a gate.

## Overview

Use this to design evals that validate agentic product behavior without letting fixtures, benchmarks, or runner payloads become product truth.

Core principle: eval assets validate product truth; they do not define architecture, manager contracts, tool semantics, or user-visible behavior.

Positive default: build evals that expose real product regressions, preserve decision ownership, and give future agents replayable evidence without shaping the product around the harness.

Hard stop: do not use eval, fixture, runner, or live-failure evidence as the only source for product semantics or contract hardening.

## Read First

- Read `references/semantic-ownership-and-harness-leakage.md` when evals, runners, fixtures, guards, or verifiers may infer semantic decisions from raw input, dataset wording, or test convenience.
- Read `references/mechanism-first-edd.md` when Golden Sets grow without a named mechanism, manual product use contradicts green tests, or a long EDD loop keeps moving failures between cases.

## Workflow

1. Name the product truth and the agent behavior under eval.
2. For fake-pass or capability-realism failures, classify the failure family and inspect the real code/trace path before changing Golden Sets or adding cases.
3. Name the core invariants that must hold regardless of implementation path.
4. Separate agent/model decision, deterministic validation, and state/output correctness.
5. Choose trace fields before grader type.
6. Identify leakage risks from fixtures, runners, seeds, guards, and replay selection.
7. Identify whether any keyword scaffold, term list, regex, dictionary, or fixture label is being used as semantic proof.
8. When mechanism quality is unclear, separate normative basis from implementation references: official docs explain the rule; mature GitHub/code examples show mechanism shape; repo truth remains the product source.
9. Add targeted E2E and negative/holdout coverage before using eval results to change prompts, schemas, or contracts.

## Default Output

Keep the answer compact:

```text
Product truth: ...
Agent behavior under eval: ...
Failure family: ...
Mechanism under test: ...
Golden Set capability mapping: ...
Mechanism map status: present | needed | not_needed
Core invariants: ...
Invariant evidence surface: DB | trace | artifact | UI | response | log | none
Decision under test: ...
Trace surface: ...
Grader type: deterministic | model | human | hybrid
Capability realism check: ...
Code references inspected: ...
Normative basis: ...
Implementation references inspected: ...
Deterministic validation boundary: ...
Capability or regression: ...
Regression seed provenance: ...
Rubric calibration / acceptance threshold: ...
Fixture-shape risk: ...
Keyword scaffold risk: ...
Semantic support evidence: evidence span | product oracle | lexical smoke | missing
Harness leakage risk: ...
Contract change source: product rule | trace attribution | eval failure only | unknown
Representability / legal-flow coverage: ...
Negative / holdout coverage: ...
Targeted E2E plan: ...
Decision: proceed | narrow | stop
```
## Decision Rules

1. Start from intended user-visible behavior and truth ownership.
2. Name the behavior under eval: manager decision, tool call, handoff, guard, state transition, final response, or multi-agent coordination.
3. Define trace fields before choosing graders.
4. Separate model decision, deterministic validation, and final state/output correctness.
5. Include invariants for high-impact evals; scenario pass does not prove invariant pass.
6. Do not let runners, fixtures, dataset labels, raw keywords, or seed data infer product semantics.
7. Separate capability evals from regression evals.
8. Prefer deterministic graders where possible; calibrate model or human graders when judgment is subjective.
9. Treat a green fixture with wrong product behavior as incomplete eval evidence.
10. Treat live or full-suite failures as attribution and holdout evidence, not direct contract-hardening authority.
11. For user-facing AI capability claims, the real entrypoint must exercise the intended owner, trace the decision path, and verify final user-visible output.
12. For semantic support, groundedness, or axis support, evaluate cited evidence spans, not only keyword or term-list hits.
13. Before patching a high-impact Golden Set, run the mechanism-first gate and add a mechanism map only for capability families that need it.

## Heuristics

| If you see | Prefer |
| --- | --- |
| Benchmark payload shapes product contract | Stop; resolve product truth first. |
| Final answer looks good | Check tool, handoff, guard, state, and manager traces. |
| Live failure triggers schema/prompt hardening | Require attribution, product source, representability, and holdouts first. |
| Browser or route gate passes but manual use feels fake | Check entrypoint, owner trace, output source, and user-perceived behavior. |
| Golden Set grows but mechanism is unnamed | Run the mechanism-first gate before adding cases. |
| Fixture label or term list is the semantic oracle | Move proof to cited evidence span, product oracle, calibrated judge, or reviewable state. |

## Stop Signals

Do not proceed when:

- fixtures, runner fields, raw keywords, or benchmark vocabulary define product architecture
- no trace can show the agent behavior under eval
- no invariant evidence surface exists for a high-impact capability claim
- harness logic fabricates a missing semantic decision instead of checking trace or structured output
- capability and regression evals are mixed into one pass/fail claim
- a judge prompt is treated as truth without calibration
- a pass claim rests on shell navigation, fixtures, deterministic renderer text, or read-model persistence while claiming user-perceived AI behavior
- "manager-style" or "agentic" is claimed without evidence that semantic owner, tool path, and final-response owner ran in the real entrypoint
- Golden Sets or browser suites are patched before failure family, code references, mechanism under test, and targeted E2E plan are named
- a long EDD loop moves failures between cases instead of shrinking one named failure family
- "best practice" is cited for a mechanism change using only official docs while implementation shape remains unclear

## Verification

Before claiming an agentic eval is useful, name the evidence: trace sample, invariant observation, mechanism map, inspected code references, implementation references, dataset source, grader type, rubric, deterministic oracle, human calibration, regression seed, targeted E2E result, or explicit product-truth rationale.

## Handoffs

- Use `red-team-application-security` for adversarial discovery and white-hat attack-family selection.
- Use `assign-decision-ownership` when a discovered issue is really about semantic ownership rather than replay design.
