---
name: review-code-excellence
description: "Use when reviewing or planning code for readability, maintainability, cognitive complexity, algorithm/data-structure fit, hot-path efficiency, unnecessary abstraction, no-behavior refactor safety, profiling evidence, or senior-engineer code quality. Trigger on AI code feels gross, over-abstracted, slow, hard to read, messy, inefficient, or code excellence review."
---

# Review Code Excellence

## Action Protocol

Use this as a code-quality review protocol. Distinguish readability, deep-module design, DSA fit, hot-path evidence, and behavior-preserving refactor claims.

## Overview

Use this to keep AI-assisted code clear, efficient, reviewable, and easy to own across repositories.

Core principle: code quality is not terseness; it is the smallest understandable design that preserves behavior, uses fitting data structures, and can be verified.

Read `references/code-excellence-rubric.md` when the review involves AI-generated code quality, algorithm/data-structure tradeoffs, hot paths, profiling, broad refactors, quality baselines, or senior-engineer readability.

## Default Output

```text
Review target: ...
Behavior boundary: no behavior change | behavior change | unclear
Readability risk: ...
Algorithm / DSA risk: ...
Hot-path / profiling status: ...
Abstraction verdict: keep | simplify | delete | split | defer
Simpler alternative: ...
Evidence required: ...
PR slice: baseline | targeted refactor | hot-path optimization | hold
Handoff skills: ...
Decision: proceed | narrow | stop
```

## Decision Rules

1. Do not open a whole-repo cleanup PR unless the task is explicitly a baseline report with no product behavior change.
2. Prefer small, reviewable changes: baseline/gate first, targeted refactor second, measured hot-path optimization third.
3. For algorithmic or lookup-heavy code, state the data structure, expected operation count, and Big-O only where it affects product behavior, scale, or hot-path cost.
4. For performance work, require profiling, query counts, benchmark output, or operation-count evidence before claiming an optimization.
5. Remove shallow wrappers, speculative flexibility, and one-use abstractions unless they protect a real boundary or hide meaningful complexity behind a stable interface.
6. Do not mix no-behavior refactors with behavior changes unless the risk is explicitly accepted and tests cover the changed behavior.
7. Style/lint/test green is not enough to claim code is clean, maintainable, or efficient.

## Heuristics

| If you see | Prefer |
| --- | --- |
| Many layers for one caller | Inline, delete, or wait for a real second consumer. |
| A hot path repeatedly scans, parses, opens files, queries DB, or creates clients | Measure first, then cache, index, batch, pool, or move work out of the request path. |
| Dense branching or nested conditionals | Name the decision, split by responsibility, or use a table only if it clarifies behavior. |
| Algorithm core with no complexity note | Add a short note on data shape and dominant operation. |
| Comments explaining what obvious code does | Simplify the code or rename instead. |
| Comments explaining why a non-obvious tradeoff exists | Keep or improve them. |
| Refactor touches public API, persistence, runtime route, or ownership | Handoff to `check-architecture-boundaries`. |

## Stop Signals

Stop or narrow when:

- the proposed cleanup changes behavior without saying so
- the code is made more abstract for hypothetical future needs
- a reviewer says code is clean based only on lint or tests
- an optimization lacks before/after evidence
- a large PR mixes formatting, refactor, feature work, and performance changes
- the change makes the call graph harder to explain than the original

## Verification

Before claiming code is clean, maintainable, readable, or efficient, name the evidence: behavior boundary, targeted tests, lint/type result, complexity or size signal, profiling/benchmark/query-count result, before/after operation count, or explicit not-run status.

## Handoffs

- Use `check-architecture-boundaries` when module ownership, public API, data model, runtime boundary, or deep-module placement is the primary risk.
- Use `sequence-capability-work` when the issue is premature platform/shared work before a consuming capability exists.
- Use `narrow-evidence-claims` before claiming clean, maintainable, efficient, all fixed, or ready.
- Use `gate-delivery-readiness` when quality gates, PR size, merge readiness, or CI enforcement are the main question.
