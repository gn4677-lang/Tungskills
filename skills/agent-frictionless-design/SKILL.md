---
name: agent-frictionless-design
description: Use when the main problem is interaction friction, especially 使用很卡, heavy onboarding, too many clarifying questions, weak progress cues, blocked state, poor surface choice, slow-feeling interaction, or correction without losing work. Trigger on UX symptoms such as repeated clarification, invisible progress, poor first-value path, missing correction path, or slow-feeling agent flow. Do not use as primary for memory, retrieval, or failover policy.
---

# Agent Frictionless Design

Use this skill when the agent feels heavy, slow, uncertain, or overly form-driven.

## Operating mode

Use this as an interaction redesign workflow, not a UX note dump. Start from the user's effort, remove unnecessary steps, and then add agentic behavior only where it reduces work.

Before reading references, write down:

- the moment where the user feels blocked, unsure, or slowed down
- the information the system already has
- the minimum input needed for first value
- the surface where the user already is

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
9. Return:
   - current friction
   - why users feel it
   - what stays deterministic
   - what should become more agentic
   - surface and interaction change
   - instrumentation after launch
   - first-value path
   - correction path
   - optional handoff block using [../agent-runtime-architecture/references/handoff-schema.md](../agent-runtime-architecture/references/handoff-schema.md)

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
