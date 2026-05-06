---
name: agent-runtime-architecture
description: Use when unsure which runtime skill should own an AI agent problem, or when a request spans agent 記憶, 搜尋/RAG, 背景任務, 主動提醒/喚醒, 失敗恢復/降級, or 使用摩擦 and needs high-level routing before context, retrieval, durability, proactive, fallback, or frictionless design. Trigger on mixed runtime complaints, cross-skill routing uncertainty, or runtime skill readiness checks.
---

# Agent Runtime Architecture

Use this as the umbrella runtime skill.
It should classify the user's problem first, then narrow the work to the relevant runtime capability instead of answering with one giant architecture blob.

## Classification

Choose one primary capability:

- `agent-context-architecture`
  - session routing, identity linking, durable memory, context assembly, compaction
- `agent-retrieval-architecture`
  - deterministic state, retrieval boundaries, search, doc-read fallback, RAG scope
- `agent-durability-ops`
  - background maintenance, team memory sync, recovery, snapshots, budget and quota guards
- `agent-proactive-architecture`
  - wake triggers, recurring work, autonomy tiers, approvals
- `agent-fallback-eval`
  - retry, model/provider failover, degraded modes, traces, evaluation loops
- `agent-frictionless-design`
  - onboarding, clarification burden, typing/progress, surface choice, latency masking

If the request spans multiple areas, start from the current bottleneck instead of redesigning the whole product.

## Ownership

This skill owns:
- broad runtime diagnosis
- capability routing
- high-level architecture framing

This skill does not own:
- detailed memory schema design
- detailed RAG or search design
- durability subsystem internals
- retry tables or failover policy
- onboarding or interaction rewrites

## Default Router Output

```text
Runtime bottleneck: ...
Chosen capability skill: ...
Primary layer rationale: ...
Deterministic boundary: ...
Next artifact: ...
Handoff block: optional
Decision: proceed | narrow | stop
```

## Workflow

First classify one primary capability, then read only the smallest reference needed to resolve the current routing gap.

1. Read [references/skill-map.md](references/skill-map.md).
2. Read [references/source-strength.md](references/source-strength.md) if source confidence matters.
3. Read [references/source-hierarchy.md](references/source-hierarchy.md) when multiple sources compete.
4. Read [references/handoff-schema.md](references/handoff-schema.md) when the answer may hand off to another runtime skill.
5. Read [references/repo-intake-rubric.md](references/repo-intake-rubric.md) when deciding whether a new repo should reshape a skill.
6. Read [references/source-coverage-matrix.md](references/source-coverage-matrix.md) when checking whether the six capability skills have enough source coverage.
7. Read [references/final-acceptance-and-usage-readiness.md](references/final-acceptance-and-usage-readiness.md) when checking whether the six runtime skills are ready, doing final acceptance, or applying a cross-skill routing quality gate.
8. Read [references/skill-design-and-framework-research.md](references/skill-design-and-framework-research.md) when updating the skills themselves or comparing current open-source agent framework patterns.
9. Read [references/wave3-framework-candidates.md](references/wave3-framework-candidates.md) when collecting additional framework sources before promoting them into a capability skill.
10. Read [references/wave1-patterns.md](references/wave1-patterns.md) when the question involves the current repo-intake expansion.
11. Read [references/wave2-patterns.md](references/wave2-patterns.md) when contract discipline or retrieval taxonomy refinement is part of the question.
12. Read the matching capability references only as needed.
13. Return the Default Router Output, using [references/handoff-schema.md](references/handoff-schema.md) when a handoff is needed.

## Rules

- Do not mix repo migration advice into the core runtime answer.
- Do not treat Claude Code or OpenClaw as products to copy literally.
- Treat code-confirmed and doc-confirmed patterns differently.
- Do not use second-hand videos as source-of-truth.
- Keep capability skills procedural: intake, decision, action, output contract, and verification.
- Do not treat a future research queue as a promotion trigger; start another promotion pass only after a real usage failure, new source, or explicit user request.

## Stop Signals

Stop or narrow when:

- the answer starts redesigning memory, retrieval, durability, proactive behavior, fallback, and UX all at once
- no single primary runtime capability is named
- a handoff skill is needed but omitted
- implementation advice appears before the runtime bottleneck and deterministic boundary are named

## Verification

Before claiming routing quality, name the evidence: user symptom, chosen primary skill, rejected neighboring skills, deterministic boundary, required output fields, and any handoff block.
