---
name: sequence-capability-work
description: "Use when direction is accepted and the task is deciding build order, capability dependencies, bounded context, PRD/issue slicing, parent dependencies, pre-PR readiness, trunk-safe slices, contract-first work, or parallel capability sequencing. Trigger on 先做哪個, 開 PR 前檢查, issue slicing, PRD slicing, capability order, domain glossary, or build next."
---

# Sequence Capability Work

## Action Protocol

Use this as a sequencing protocol after direction is accepted. Decide build order from capability dependency and trunk safety, not local file convenience or PR age.

## Overview

Use this to decide what to build next from capability dependencies, not from class names or local implementation convenience.

Core principle: business capability first, capability dependency second, bounded context third, OOD responsibility and dependency direction fourth.

## Default Output

Keep the answer compact:

```text
Business capability: ...
Domain / bounded context: ...
Direction accepted by: inline | run-slice-direction-challenge-subagent | user | not_applicable
Capability dependency: ...
OOD responsibility owner: ...
Dependency direction: ...
Build next: ...
Do not build yet: ...
Evidence to advance: ...
```

If the task is small and already inside one stable interface, state only `Build next`, `Do not build yet`, and `Evidence to advance`.

## Decision Order

1. Name the business capability or domain outcome.
2. Identify which capability must exist before another capability can work.
3. Place the work in one bounded context; do not mix domain language or ownership.
4. Assign behavior to the object/module with the needed information and responsibility.
5. Point dependencies toward stable policy, abstractions, or domain behavior; avoid cycles.
6. Build the smallest capability that unblocks the next capability.
7. For parallel capability or domain work, classify each slice as current mainline, future-wave, guard/contract, or dependency bump before deciding build order or merge posture.
8. Before a contributor or agent opens a PR, identify the required report fields, parent dependency, targeted tests, and boundary checks for that slice.

Use `check-architecture-boundaries` when the sequence crosses ownership, public APIs, data models, runtime boundaries, or subagent responsibilities.

Use `assign-decision-ownership` when the next slice depends on whether an LLM, prompt, validator, guard, or deterministic rule should own a product decision.

Use `run-slice-direction-challenge-subagent` before this skill when the main question is not sequencing among accepted slices, but whether a proposed slice should exist now, why now, whether it is too large, or whether it belongs to the current mainline at all.

If the work is non-trivial and direction has not been accepted by the user, a controller note, or `run-slice-direction-challenge-subagent`, stop and obtain that acceptance before sequencing capabilities.

Use `review-code-excellence` when the build order question is whether to pay down readability, unnecessary abstraction, hot-path, algorithm, or data-structure debt before adding more product behavior.

Use `gate-delivery-readiness` when the primary question is PR readiness, merge queue eligibility, CI/check status, stale base, base drift, deploy readiness, or merge readiness rather than capability sequencing.

Read `references/domain-language-and-product-slicing.md` when capability order depends on domain glossary terms, `CONTEXT.md`, ADRs, PRD shape, vertical issue slicing, HITL/AFK labels, or issue-publishing approval boundaries.

## Build-Order Heuristics

| If you see | Prefer |
| --- | --- |
| User flow spans payments, inventory, checkout, fulfillment | Capability dependency map before classes. |
| Proposed shared utility, platform, framework, or service | Wait for two real consumers or one strong boundary need. |
| UI or infrastructure before domain behavior | Testable domain behavior first when possible. |
| Cross-context data access | Explicit integration contract, event, API, or adapter. |
| Circular domain dependency | Split responsibility, invert dependency, or introduce a stable contract. |
| Future capability appears before MVP dependency is stable | Merge only guard/contract/no-runtime-effect slices; keep implementation draft or shadow. |
| Multiple agents build adjacent capabilities | Define track ownership and trunk-safe slice boundaries before implementation order. |
| Quality cleanup competes with feature work | Baseline/gate first; then target hot-path or responsibility-bound refactors. |
| Builder wants to open PR but track, parent, report, or boundary evidence is unclear | Define slice readiness before implementation or queue work. |

## Stop Signals

Do not proceed with the proposed order when:

- classes are named before capability/domain is clear
- shared/platform work appears before a consuming capability
- abstractions are created without real variability
- one module owns multiple business meanings
- dependencies point from stable domain policy to volatile infrastructure
- subagent tasks are split by file count instead of capability ownership
- future-wave implementation is treated as mergeable before its contract, guard, or activation boundary exists
- parallel branches are sequenced by PR age instead of capability dependency and trunk integration safety
- a PR is opened before track, parent dependency, required report, or boundary evidence is clear
- capability sequencing is used to justify a slice whose direction, mainline status, or smallest safe scope has not been accepted

## Verification

Before claiming the order is correct, name the evidence: capability dependency map, user-flow trace, test slice, bounded-context note, parent dependency, required report, interface contract, architecture rule, or explicit manual ordering rationale.

## Handoffs

- Use `gate-delivery-readiness` when the primary question is PR readiness, merge queue eligibility, CI/check status, base drift, deploy readiness, or merge readiness.
- Use `check-architecture-boundaries` when sequencing crosses ownership, public APIs, data models, runtime boundaries, or subagent responsibilities.
- Use `narrow-evidence-claims` before claiming a slice is ready, unblocked, safe, or complete.
