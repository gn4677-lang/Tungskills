---
name: architecture-boundary-governance
description: Use before planning or editing when a local fix, file choice, shared helper, eval fix, import/provider/tool/runtime change, protected legacy touch, active-code ownership change, subagent split, module/API interface design, parallel PR split, future-wave implementation, truth-owner change, or local-vs-global optimization may cross 架構邊界, ownership, dependency direction, public API, data model, runtime, capability, or responsibility boundaries. Route user-facing UI interface design elsewhere.
---

# Architecture Boundary Governance

## Overview

Use this as a lightweight guardrail before architecture-sensitive work. Keep output short; escalate only when a local change can damage system structure.

Core principle: name the global boundary before optimizing locally.

For agent runtime, prompt, provider adapter, composition/application orchestration, shared utility, cross-domain import, or fat composition-layer risk, read `references/runtime-composition-boundaries.md` before choosing placement.

For module/API interface shape, deep-module review, deletion tests, or exploratory architecture improvement, read `references/interface-and-deep-module-patterns.md` before proposing interfaces or refactors.

## Default Check

For ordinary work, emit at most this five-line note, then continue:

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
- If "interface" means module/API/type/method/caller contract, keep it in architecture; if it means user-facing UI or interaction surface, route to `uiux-intent-designer`.
- If the contested decision is whether prompt/LLM output or deterministic code owns product truth, route to `llm-deterministic-boundary` before choosing placement.
- In parallel PR trains, treat active routes, manager/orchestration assembly, schedulers, DB migrations, truth-owner changes, and public contracts as high-risk boundaries; route merge readiness to `delivery-pipeline-governance` and activation risk to `agent-runtime-activation-ladder`.
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

## Verification

Before claiming boundary safety, name the evidence: test, build, lint, architecture rule, dependency graph, schema check, reviewer checklist, no-op rationale, or manual boundary check.
