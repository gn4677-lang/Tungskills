---
name: reduce-agent-friction
description: "Use when improving agent interaction friction: heavy onboarding, too many questions, slow flows, unclear progress, blocked states, correction paths, first-value path, streaming/progress cues, surface choice, or 使用很卡. Trigger on agent feels slow, asks too much, loses prior work, unclear state, or user experience friction."
---

# Reduce Agent Friction

## Action Protocol

Use this as an interaction protocol. Start from the friction symptom, choose the smallest progress/correction/surface fix, and define how the improvement will be measured.

Use this skill when the agent feels heavy, slow, uncertain, or overly form-driven.

## Operating mode

Use this as an interaction redesign workflow, not a UX note dump. Start from the user's effort, remove unnecessary steps, and then add agentic behavior only where it reduces work.

Positive default: deliver first value with the least necessary interruption, then expose progress, blocked states, and correction paths where uncertainty remains.

Before reading references, write down:

- the moment where the user feels blocked, unsure, or slowed down
- the information the system already has
- the minimum input needed for first value
- the surface where the user already is

## Default Output

```text
Current friction: ...
Why users feel it: ...
What stays deterministic: ...
What becomes more agentic: ...
Surface and interaction change: ...
Instrumentation after launch: ...
First-value path: ...
Correction path: ...
Handoff block: optional
Decision: proceed | narrow | stop
```

## Workflow

1. Classify the friction as one of:
   - heavy onboarding
   - premature clarification
   - no progress cues
   - wrong surface
   - expensive correction
   - slow perceived latency
   - unclear capability boundary
2. Choose the interaction fix:
   - infer from available context
   - delay clarification until needed
   - expose progress or blocked state
   - move the action to the user's current surface
   - preserve work through correction
   - add measurement before redesigning deeper runtime layers
3. Read [references/claude-code-patterns.md](references/claude-code-patterns.md) for progress, context preparation, and continuity-protecting failure handling.
4. Read [references/openclaw-patterns.md](references/openclaw-patterns.md) for onboarding, typing/presence, channel-first design, and delivery routing.
5. Read [references/human-ai-product-patterns.md](references/human-ai-product-patterns.md) when expectation-setting, trust, correction, or UX measurement is part of the problem.
6. Read [references/wave2-patterns.md](references/wave2-patterns.md) when post-launch instrumentation or operator cues are part of the problem.
7. Read [references/wave4-patterns.md](references/wave4-patterns.md) when streaming, progress cues, blocked-state design, correction paths, first-value time, or post-launch measurement matter.
8. Read [references/translation.md](references/translation.md) only after choosing the interaction fix.
9. Return the Default Output, using [../route-agent-runtime-design/references/handoff-schema.md](../route-agent-runtime-design/references/handoff-schema.md) when a handoff is needed.

## Rules

- Remove unnecessary user effort before adding more intelligence.
- Prefer delayed clarification over front-loading forms.
- Expose progress and life signs while work is happening.
- Route through the surface the user already occupies when possible.
- Do not ask a setup question if a reversible default can produce first value.
- Preserve user work across interruption, correction, retry, and handoff.
- Slow or uncertain flows must expose a progress cue, blocked state, correction path, and measurement.
- Measure time to first value, clarification turns, abandonment, correction success, and user takeover before claiming the design is improved.
- If the core complaint is forgetting, search, or outages, route to the specialized runtime skill instead.

## Stop Signals

Stop or narrow when:

- the flow asks setup questions before checking what the system already knows
- a slow or uncertain flow has no progress cue, blocked state, correction path, or measurement
- the redesign hides a runtime failure, memory issue, or retrieval issue that belongs to another skill
- "frictionless" is used to justify irreversible automation without approval or undo

## Verification

Before claiming the interaction is smoother, name the evidence: first-value path, delayed-clarification decision, progress or blocked state, correction path, measurement plan, and any runtime handoff.
