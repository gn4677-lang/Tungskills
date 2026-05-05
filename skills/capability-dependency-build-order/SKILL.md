---
name: capability-dependency-build-order
description: Use before planning or editing when the agent may choose files, tests, classes, modules, services, eval fixes, local next steps, issue slices, PRD slices, HITL/AFK work, shared/platform work, implementation order, parallel capability work, MVP mainline vs future-wave scope, contract-first slices, trunk-safe slices, or 先做哪個 before deciding real capability dependency, domain glossary, bounded context, product slicing, dependency order, or capability sequencing.
---

# Capability Dependency Build Order

## Overview

Use this to decide what to build next from capability dependencies, not from class names or local implementation convenience.

Core principle: business capability first, capability dependency second, bounded context third, OOD responsibility and dependency direction fourth.

## Default Output

Keep the answer compact:

```text
Business capability: ...
Domain / bounded context: ...
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

Use `architecture-boundary-governance` when the sequence crosses ownership, public APIs, data models, runtime boundaries, or subagent responsibilities.

Use `llm-deterministic-boundary` when the next slice depends on whether an LLM, prompt, validator, guard, or deterministic rule should own a product decision.

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

## Verification

Before claiming the order is correct, name the evidence: dependency map, test slice, use-case trace, bounded-context note, interface contract, architecture rule, or explicit manual ordering rationale.
