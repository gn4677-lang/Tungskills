---
name: uiux-intent-designer
description: Use when Codex is asked to design, redesign, build, modify, or critique user-facing UI/UX and must clarify user intent, product purpose, system concept, interaction behavior, animation purpose, visual direction, anti-goals, or human alignment before implementation. Trigger on user-facing UI/UX, visual direction, interaction concept work, or complaints that AI-generated UI looks generic, samey, template-like, fake, card-heavy, overly purple, unclear, or like AI slop. If interface means module/API/type/method shape, route to architecture-boundary-governance.
---

# UI/UX Intent Designer

## Overview

Use this skill to make UI/UX work purpose-driven before building. The output should connect each design decision to user intent, system behavior, and explicit human alignment instead of relying on vague taste words like "modern" or "clean."

## Core Rule

Do not start visual or interaction implementation until the design intent is strong enough to explain:

- Who the interface serves.
- What task the user is trying to complete.
- What system concept organizes the experience.
- What each major region helps the user understand, decide, trust, or do.
- Which decisions still need human judgment.

If the user explicitly wants speed, proceed with clear assumptions and list them before or with the design.

## Alignment Decision Rule

- Stop and ask when a missing answer would change the audience, system model, primary task, autonomy level, trust posture, or core layout.
- If "interface" means module/API/type/method shape rather than user-facing UI or interaction, route to `architecture-boundary-governance`.
- Proceed with assumptions when the user explicitly asks for implementation, the risk is low, or one conservative product-appropriate default is clear.
- When proceeding, state the selected direction as a recommendation and list assumptions. Do not imply the user approved unresolved taste, brand, or product-strategy choices.
- For early concept work, keep the purpose trace at the region/component-group level. Expand it to states and controls after a direction is chosen or implementation begins.
- Produce an interaction feedback map only when the surface includes motion, async work, AI agents, multi-step workflows, destructive actions, or interactive demos. A static landing page does not need one unless it contains an animated/product demo.

## Workflow

1. Inspect existing product context first when available: screenshots, code, copy, design system, prior pages, or app behavior.
2. Build a concise intent brief. Use `references/intent-brief-template.md` when the task is broad or ambiguous.
3. Add a system-first pass. Use `references/system-first-brief.md` for products with many features, AI agents, editors, dashboards, or workflows.
4. When generic AI output is a risk, add anti-slop constraints before visual exploration: unique product signal, literal proof, density target, and tropes to avoid. Use `references/anti-slop-design-brief.md` and `references/anti-slop-direction-examples.md` when you need concrete contrast, and use `../uiux-objective-review/references/visual-example-index.md` when a paired visual example would help.
5. Ask only high-impact questions that cannot be answered from available context. Prefer 1-3 concrete choices and recommend a default.
6. Propose 2-3 design directions that differ by system model or user flow, not only visual style.
7. Create a purpose trace: every major layout region, component group, CTA, state, and motion choice must have a user-facing reason.
8. For motion, AI agents, async work, or complex interactions, produce an interaction feedback map. Use `references/interaction-feedback-map.md`.
9. Align with the user at the appropriate gate before locking major direction. Use `references/human-alignment-gates.md`.
10. When implementation is allowed, prefer a real runnable surface, browser screenshot, or prototype state over static description.

## Default Output

```text
Intent brief: ...
Assumptions or questions: ...
Recommended direction: ...
Anti-slop constraints: ...
Purpose trace: ...
Interaction feedback map: needed | not needed | ...
Human judgment still needed: ...
Handoff skills: ...
Decision: proceed | align first | stop
```

## Ryo Lu-Informed Principles

- Design systems, not feature piles. If several features overlap, look for fewer primitives or modes that make the product easier to understand.
- Build real things, not static opinions. Use runnable UI, screenshots, and prototype states to shorten the feedback loop.
- Center tasks over objects. Ask whether the UI is organized around what users are trying to accomplish or merely around files, data, screens, or internal modules.
- Use playgrounds for complex interaction. Isolate the interaction feel before forcing it into production complexity.
- Make motion serve attention. Motion must explain state, continuity, causality, feedback, spatial relationship, or brand tone; otherwise avoid it.

## Output Shape

For design generation, produce:

- Intent brief.
- Assumptions or questions.
- 2-3 directions with tradeoffs and a recommendation.
- Anti-slop constraints when the surface risks generic AI output.
- Purpose trace for the selected direction.
- Interaction feedback map when relevant.
- Human judgment items that remain unresolved.

## Common Mistakes

- Starting with layout before knowing the task.
- Asking broad questions instead of choosing a reasonable default.
- Treating "minimal" as empty or "premium" as more animation.
- Adding features instead of unifying concepts.
- Describing a UI as good without explaining what user outcome it supports.
- Letting the model fill missing intent with generic SaaS tropes, fake charts, unrelated hero sections, or decorative gradients.
- Using Ryo Lu references as style imitation instead of system-thinking guidance.

## Stop Signals

Stop or narrow when:

- the audience, primary task, system concept, or trust posture would materially change the design but remains unknown
- "interface" means module/API/type/method shape rather than user-facing UI or interaction
- implementation starts before the design intent can explain each major region's user purpose
- animation, AI autonomy, destructive action, or async work has no feedback or correction map
- anti-goals are missing while the surface is at high risk of generic AI output

## Verification

Before claiming the design direction is ready, name the evidence: existing product context, user task, selected assumptions, anti-slop constraints when relevant, purpose trace, human alignment gate, rendered/prototype artifact if available, and unresolved judgment items.
