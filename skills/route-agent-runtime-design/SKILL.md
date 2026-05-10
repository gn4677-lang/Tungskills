---
name: route-agent-runtime-design
description: "Use when an AI agent runtime problem needs routing before design, especially mixed issues involving agent memory/context, retrieval/RAG, background jobs, proactive behavior, retry/fallback, activation, or interaction friction. Trigger on agent runtime architecture, runtime skill selection, cross-skill handoff, agent 記憶/搜尋/背景任務/主動提醒/失敗恢復/使用很卡, or uncertainty about which runtime owner applies."
---

# Route Agent Runtime Design

## Action Protocol

Use this as a routing protocol. Pick one primary runtime owner, name rejected neighboring owners, and hand off instead of answering as one giant runtime architecture bundle.

Do not solve the whole runtime architecture here. The job is to choose the owner, name why adjacent owners were rejected, and hand off with the minimum context needed.

Positive default: route to the one runtime owner most likely to remove the current bottleneck, then preserve clean handoff context instead of expanding into a general architecture answer.

## Classification

Choose one primary capability:

- `design-agent-context`
  - session routing, identity linking, durable memory, context assembly, compaction
- `design-agent-retrieval`
  - deterministic state, retrieval boundaries, search, doc-read fallback, RAG scope
- `design-agent-durability`
  - background maintenance, team memory sync, recovery, snapshots, budget and quota guards
- `design-proactive-agents`
  - wake triggers, recurring work, autonomy tiers, approvals
- `design-agent-fallbacks`
  - retry, model/provider failover, degraded modes, traces, evaluation loops
- `reduce-agent-friction`
  - onboarding, clarification burden, typing/progress, surface choice, latency masking
- `gate-agent-activation`
  - live diagnostic, shadow, canary, user-facing rollout, mutation authority, activation readiness
- `assign-decision-ownership`
  - LLM vs deterministic vs guard vs human ownership when runtime truth or semantic authority is unclear

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
- rollout authorization or merge/deploy readiness

## Default Output

```text
Runtime bottleneck: ...
Chosen capability skill: ...
Primary layer rationale: ...
Rejected neighboring skills: ...
Deterministic boundary: ...
Reference read: none | ...
Next artifact: ...
Handoff block: optional
Decision: proceed | narrow | stop
```

## Workflow

1. Restate the user-visible runtime symptom in one sentence.
2. Choose one primary capability from `Classification`.
3. Name one or two neighboring skills that look plausible but are not primary.
4. Read at most one reference from `Reference Selector` only if routing remains ambiguous.
5. Return the Default Output and hand off instead of expanding into a full design.

## Reference Selector

- `references/skill-map.md` - routing is unclear after reading `Classification`.
- `references/handoff-schema.md` - the answer will hand off to a capability skill.
- `references/final-acceptance-and-usage-readiness.md` - checking readiness or cross-skill routing quality.
- `references/source-coverage-matrix.md` - auditing source coverage for the runtime skill family.
- `references/skill-design-and-framework-research.md` - updating the skills themselves.
- `references/wave3-framework-candidates.md` - promoting new framework sources.
- `references/source-strength.md` or `references/source-hierarchy.md` - source confidence or source conflict matters.
- `references/repo-intake-rubric.md` - deciding whether a new repo should reshape a skill.
- `references/wave1-patterns.md` or `references/wave2-patterns.md` - historical expansion context is explicitly requested.

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
- activation, rollout, canary, or mutation authority is discussed without routing to `gate-agent-activation`

## Verification

Before claiming routing quality, name the evidence: user symptom, chosen primary skill, rejected neighboring skills, deterministic boundary, required output fields, and any handoff block.
