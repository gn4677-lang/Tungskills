---
name: sequence-capability-work
description: "Use when accepted direction needs build order, capability dependencies, bounded context, PRD/issue slicing, parent dependencies, pre-PR readiness, trunk-safe slices, over-split PR trains, wrapper/evidence wiring, contract-first work, harness bootstrap, product truth, invariants, golden flows, fake pass prevention, parallel sequencing, 先做哪個, 開 PR 前檢查, or 過細切片."
---

# Sequence Capability Work

## Action Protocol

Use this as a sequencing protocol after direction is accepted. Decide build order from capability dependency and trunk safety, not local file convenience or PR age.

## Overview

Use this to decide what to build next from capability dependencies, not from class names or local implementation convenience.

Core principle: business capability first, capability dependency second, bounded context third, OOD responsibility and dependency direction fourth.

Positive default: pick the next right-sized slice that directly advances user/operator capability or removes the blocker preventing that capability.

## Default Output

Keep the answer compact:

```text
Business capability: ...
Domain / bounded context: ...
Direction accepted by: inline | run-slice-direction-challenge-subagent | user | not_applicable
Capability dependency: ...
Slice kind: product_capability | vertical_proof | contract_guard | ops_test_stability | wrapper_evidence_wiring
Progress priority: blocker_removal | product_capability | decision_unlock | risk_reduction | maintenance_only
Slice grain: right_sized | too_large | over_split | wrapper_only
Consolidation candidate: yes | no
Capability invariant: ...
Invariant evidence surface: ...
OOD responsibility owner: ...
Dependency direction: ...
Build next: ...
Do not build yet: ...
Evidence to advance: ...
```

If the task is small and already inside one stable interface, state only `Build next`, `Do not build yet`, and `Evidence to advance`.

## Decision Order

1. Name the business capability or domain outcome.
2. Name the blocker that prevents that capability from working or being safely accepted.
3. Name the capability invariant that the slice must preserve or prove.
4. Identify which capability must exist before another capability can work.
5. Prefer `blocker_removal` and `product_capability` before `decision_unlock`, then `risk_reduction`, then `maintenance_only`, unless the user explicitly chooses otherwise.
6. Place the work in one bounded context; do not mix domain language or ownership.
7. Assign behavior to the object/module with the needed information and responsibility.
8. Point dependencies toward stable policy, abstractions, or domain behavior; avoid cycles.
9. Build the right-sized capability slice that unblocks the next capability.
10. For parallel capability or domain work, classify each slice as current mainline, future-wave, guard/contract, or dependency bump before deciding build order or merge posture.
11. Before a contributor or agent opens a PR, identify the required report fields, parent dependency, targeted tests, invariants, and boundary checks for that slice.
12. Right-size the PR grain: split only when each PR has independent review, rollback, and blocker value; consolidate when several slices only wire the same evidence chain or closeout gate.
13. Classify proof-only or ops/test-stability work honestly; do not count it as product capability unless it directly changes user/operator capability.

Use `check-architecture-boundaries` when the sequence crosses ownership, public APIs, data models, runtime boundaries, or subagent responsibilities.

Use `assign-decision-ownership` when the next slice depends on whether an LLM, prompt, validator, guard, or deterministic rule should own a product decision.

Use `run-slice-direction-challenge-subagent` before this skill when the main question is not sequencing among accepted slices, but whether a proposed slice should exist now, why now, whether it is too large, or whether it belongs to the current mainline at all.

If the work is non-trivial and direction has not been accepted by the user, a controller note, or `run-slice-direction-challenge-subagent`, stop and obtain that acceptance before sequencing capabilities.

Use `review-code-excellence` when the build order question is whether to pay down readability, unnecessary abstraction, hot-path, algorithm, or data-structure debt before adding more product behavior.

Use `gate-delivery-readiness` when the primary question is PR readiness, merge queue eligibility, CI/check status, stale base, base drift, deploy readiness, or merge readiness rather than capability sequencing.

Read `references/domain-language-and-product-slicing.md` when capability order depends on domain glossary terms, `CONTEXT.md`, ADRs, PRD shape, vertical issue slicing, HITL/AFK labels, or issue-publishing approval boundaries.

Read `references/slice-kind-taxonomy.md` when deciding whether a PR/slice is product capability, vertical proof, contract guard, ops/test stability, or wrapper/evidence wiring.

Read `references/ai-development-blueprint-harness.md` when starting or auditing a new repo, product, major capability, or AI-assisted implementation harness that needs product truth, workflow map, target architecture, invariants, golden flows, evidence matrix, completion standard, or fake-pass prevention before build order is trusted.

## Build-Order Heuristics

| If you see | Prefer |
| --- | --- |
| Proposed shared utility/platform/service | Wait for two real consumers or one strong boundary need. |
| UI or infrastructure before domain behavior | Testable domain behavior first when possible. |
| Future capability appears before MVP dependency is stable | Merge only guard/contract/no-runtime-effect slices; keep implementation draft or shadow. |
| Multiple agents build adjacent capabilities | Define track ownership and trunk-safe boundaries before implementation order. |
| Several slices only connect reports/artifacts for the same blocker | Consolidate into one evidence-wiring slice or explicit short train. |
| Pointer, CLI root path, smoke inclusion, report lineage, or candidate-bundle field only | Treat as `ops_test_stability` or `wrapper_evidence_wiring`, not product capability. |

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
- a capability slice has no invariant or state/output condition that would prove it actually advanced the capability
- capability sequencing is used to justify a slice whose direction, mainline status, or right-sized scope has not been accepted
- issue slicing creates many wrapper-only PRs whose value is only status projection, report plumbing, artifact copying, or closeout visibility
- "small PR" is used to justify splitting one coherent vertical path into fragments that cannot be reviewed or rolled back independently

## Verification

Before claiming the order is correct, name the evidence: capability dependency map, capability invariant, user-flow trace, test slice, bounded-context note, parent dependency, required report, interface contract, architecture rule, or explicit manual ordering rationale.

## Handoffs

- Use `gate-delivery-readiness` when the primary question is PR readiness, merge queue eligibility, CI/check status, base drift, deploy readiness, or merge readiness.
- Use `check-architecture-boundaries` when sequencing crosses ownership, public APIs, data models, runtime boundaries, or subagent responsibilities.
- Use `narrow-evidence-claims` before claiming a slice is ready, unblocked, safe, or complete.
