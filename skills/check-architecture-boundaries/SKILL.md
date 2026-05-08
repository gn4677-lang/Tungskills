---
name: check-architecture-boundaries
description: "Use before planning or editing when a change may cross architecture, ownership, public API, module responsibility, dependency direction, data model, runtime, provider/tool, prompt, eval, subagent, or protected legacy boundaries. Trigger on shared helper, interface as API, ownership, module boundary, architecture drift, or 架構邊界."
---

# Check Architecture Boundaries

## Action Protocol

Use this as a boundary review protocol. Classify risk, state the ownership boundary, and stop when a local fix would silently change public contracts or truth owners.

## Overview

Use this as a lightweight guardrail before architecture-sensitive work. Keep output short; escalate only when a local change can damage system structure.

Core principle: name the global boundary before optimizing locally.

For agent runtime, prompt, provider adapter, composition/application orchestration, shared utility, cross-domain import, or fat composition-layer risk, read `references/runtime-composition-boundaries.md` before choosing placement.

For module/API interface shape, deep-module review, deletion tests, or exploratory architecture improvement, read `references/interface-and-deep-module-patterns.md` before proposing interfaces or refactors.

## Default Output

For ordinary work, emit at most this five-line note as the output contract, then continue:

```text
Boundary touched: <none | domain | data | API | runtime | ownership | dependency | capability | active-code | freeze-growth>
Risk level: <low | elevated | high>
Do not cross: <one boundary or "none">
Minimum check: <one concrete check>
Escalate only if: <specific trigger or "not needed">
```

For purely cosmetic, copy-only, or local work inside an existing interface, either skip the note or set `Risk level: low`.

## Risk Levels

| Risk | Use when | Required behavior |
| --- | --- | --- |
| low | Text, styling, small local code, tests inside existing boundaries | Skip or use the five-line note. |
| elevated | Moving logic, sharing utilities, changing imports, module ownership, protected legacy growth, freeze-growth file touch, or new abstraction | Name the boundary and check dependency direction. |
| high | Public API, data model, persistence, auth, runtime ownership, cross-component behavior, subagent split, capability build order, or new responsibility added to a protected/fat file | Require one escalation action first. |

## Escalation Actions

Choose the smallest action that controls the risk:

- ADR/update recommendation for public contracts, ownership models, or long-lived direction.
- Architecture fitness check for tests, dependency rules, lint, schemas, or CI.
- Dependency direction check for domain/application/infrastructure or caller/callee inversion risk.
- Ownership split before subagent dispatch across modules, domains, or responsibility owners.
- Owner-module check or smallest extraction when a protected legacy, fat, freeze-growth, or active-code boundary would absorb new responsibility.

Do not require diagrams, full inventories, or ADRs for low-risk work.

## Heuristics

- Information hiding: hide change-prone decisions behind stable interfaces.
- If "interface" means module/API/type/method/caller contract, keep it in architecture; if it means user-facing UI or interaction surface, route to `define-uiux-intent`.
- If the contested decision is whether prompt/LLM output or deterministic code owns product truth, route to `assign-decision-ownership` before choosing placement.
- In parallel PR trains, treat active routes, manager/orchestration assembly, schedulers, DB migrations, truth-owner changes, and public contracts as high-risk boundaries; route merge readiness to `gate-delivery-readiness` and activation risk to `gate-agent-activation`.
- If the primary problem is readability, cognitive complexity, algorithm/data-structure fit, hot-path efficiency, no-behavior refactor hygiene, or unnecessary abstraction that does not change ownership boundaries, route to `review-code-excellence`.
- Ports and adapters: keep core/domain independent of UI, database, network, framework, and tool adapters.
- C4 level check: do not solve a system/container problem only at component/code level.
- Team/API ownership: one module, task, or subagent should have one primary responsibility.
- Capability order: build the smallest stable capability that unlocks the next step.
- Freeze-growth: do not let protected legacy or fat files absorb new ownership because it is locally faster.

## Mistakes

| Mistake | Correction |
| --- | --- |
| Architecture essay for a small task | Use the five-line note or skip it. |
| Shared utilities before ownership is clear | Treat as elevated risk. |
| Subagents split by file count only | Split by responsibility boundaries. |
| ADRs for every small edit | Reserve ADRs for high-risk decisions. |
| Quick fix creates reverse dependency | Check dependency direction first. |
| Helper added to a protected/fat file because it is faster | Find the owner module or extract the smallest responsibility boundary. |

## Stop Signals

Stop or narrow when:

- the change touches public API, persistence, auth, runtime behavior, or truth ownership without naming the owner boundary
- a shared helper, adapter, or abstraction appears before a real consumer or stable boundary exists
- subagent or PR split follows file count rather than responsibility ownership
- a local cleanup changes dependency direction, module responsibility, or active-code ownership

## Verification

Before claiming boundary safety, name the evidence: test, build, lint, architecture rule, dependency graph, schema check, reviewer checklist, no-op rationale, or manual boundary check.

## Handoffs

- Use `challenge-slice-direction` when the question is whether the slice should exist now, not where the boundary sits.
- Use `sequence-capability-work` when the boundary depends on capability dependency order.
- Use `assign-decision-ownership` when prompt, LLM output, guard, validator, or deterministic code may own product truth.
- Use `review-code-excellence` when the issue is readability, DSA fit, hot-path efficiency, or unnecessary abstraction without ownership change.
- Use `gate-delivery-readiness` when the boundary decision affects PR, queue, merge, or deploy readiness.
