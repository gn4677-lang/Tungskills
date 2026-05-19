---
name: review-rendered-uiux
description: "Use when reviewing, verifying, QAing, or improving rendered UI/UX with screenshots, browser checks, Playwright, independent evaluator evidence, motion feedback, transition meaning, microinteractions, accessibility, responsive behavior, interaction states, visual polish, SaaS landing page contracts, product proof, CTA/navigation hierarchy, AI-slop patterns, layout overlap, or viewport/state evidence. Trigger on UI review, visual QA, screenshot review, accessibility, responsive check, product proof review, landing page review, or rendered design quality."
---

# Review Rendered UI/UX

## Action Protocol

Use this as a rendered-review protocol. Inspect real UI evidence across states/viewports and distinguish what was verified from what was only inferred.

## Overview

Use this skill to reject objectively weak UI before relying on human taste. Separate what can be checked from what still needs product, brand, or aesthetic judgment.

Positive default: make the rendered experience coherent, usable, responsive, accessible, and specific to the product task before judging subjective polish.

## Core Rule

Never claim a UI is "good", "polished", "ready", or "well designed" from code inspection alone. Verify the rendered surface when possible, then report:

- Objective checks passed.
- Must-fix failures.
- Should-fix risks.
- Human judgment needed.

If no screenshot, URL, prototype, local app, Storybook, or source files are available, say the review is blocked by missing rendered artifact. Ask for the minimum useful artifact first; do not invent findings.

## Workflow

1. Gather the design intent. If the goal is unclear, use `define-uiux-intent` first.
2. Inspect the rendered UI when possible: browser, screenshots, local app, Storybook, prototype, or supplied images. If none exists, stop with the missing-artifact response.
3. Review desktop and mobile viewports for layout stability, text fit, hierarchy, and task clarity.
4. Name the `Must not break` conditions before judging polish.
5. Exercise important states: default, hover, focus, active, disabled, loading, empty, error, success, and reduced motion where relevant.
6. For important actions, verify the feedback loop: the action is acknowledged, the state change is visible, and any motion explains status, causality, continuity, hierarchy, or affordance.
7. For user-facing workflow claims, exercise the real interaction path with browser/Playwright when available; do not accept screenshot-only evidence for "works" claims.
8. Run available automated checks without overstating them: axe, Lighthouse, Playwright screenshots, visual regression, keyboard smoke tests.
9. Apply only the relevant rubric:
   - baseline rendered review: `references/objective-quality-checklist.md`
   - generic AI-looking UI: `references/ai-slop-rejection-checklist.md`
   - SaaS/product landing pages: `references/saas-landing-rendered-contract-review.md`
   - stateful/async/agent UI: `references/interaction-truthfulness-check.md`
   - motion/transition feedback: `references/motion-feedback-contract.md`
   - live/local implementation review: `references/rendered-ui-review-protocol.md`
   - source-only warning signs: `references/code-smell-to-ui-failure-map.md`
   - visual contrast examples: `references/ai-slop-example-gallery.md` or `references/visual-example-index.md`
   - subjective scoring: `references/heuristic-review-rubric.md`
10. Load at most one or two reference files unless the review is explicitly broad.
11. Report issues by severity and tie each issue to a user impact.

## Default Output

```text
Rendered artifact: screenshot | browser | local app | prototype | missing
Interaction evidence: clicked | typed | navigated | state_checked | not_run
Motion feedback contract: pass | fail | not_applicable | not_run
Objective checks passed: ...
AI slop signals: ...
Contract failures: ...
Must not break: ...
Must-fix failures: ...
Should-fix risks: ...
Human judgment needed: ...
Evidence not run: ...
Decision: ready | narrow | stop
```

## Review Categories

Use these categories unless the user requests a different format:

- `must fix`: broken task completion, unreadable content, misleading state, accessibility blocker, layout overlap, clipped controls, fake product proof, or motion that prevents use.
- `should fix`: weak hierarchy, avoidable cognitive load, generic AI styling, repeated template sections, weak product proof, domain mismatch, unclear copy, inconsistent spacing, incomplete states, missing action feedback, or questionable interaction timing.
- `human judgment needed`: brand tone, taste, novelty, emotional feel, market positioning, and whether the design is distinctive enough.

## Objective Rejection Rules

Reject the design as not ready when any of these are true:

- The first screen does not make clear what the product is, who it is for, and why it matters.
- Primary user path is hidden, ambiguous, or visually deprioritized.
- Text overlaps, clips, wraps badly, or becomes unreadable at common viewport sizes.
- UI state lies about system state or progress.
- The review claims a workflow works from screenshots without exercising the real interaction path.
- Important user actions have no visible feedback, or the only feedback is inaccessible motion.
- Animation direction, origin, easing, or timing contradicts the state change, navigation hierarchy, or user action.
- Motion steals attention without clarifying what changed.
- The interface looks like a generic AI template with no intentional brand or product fit.
- Major interactive elements cannot be reached or understood by keyboard and visible focus.
- Screenshots, charts, demos, or operational data look fake, low-fidelity, or unrelated to the core task.
- A SaaS/product landing page cannot identify product proof, section purpose, CTA hierarchy, interaction completeness, and motion purpose from rendered evidence.

## Stop Signals

Stop or narrow when:

- no rendered artifact is available for a rendered-UI readiness claim
- code inspection is used as the only evidence for polished, ready, or well-designed UI
- screenshot-only evidence is used to claim buttons, forms, routes, or agent workflows actually work
- major viewports, interaction states, keyboard access, or loading/error/empty states are untested
- motion is judged from static screenshots when the claim depends on transition meaning or feedback timing
- objective failures are being reframed as taste preferences instead of must-fix issues
- the review ignores obvious AI-slop signals because the pixels look "modern"
- `Must not break` conditions are missing for a readiness or polish claim

## Common Mistakes

- Treating accessibility scores as complete UX review.
- Reviewing screenshots without checking interaction states.
- Treating animation as polish instead of feedback, causality, continuity, hierarchy, or status.
- Calling something "clean" when it is merely empty.
- Accepting purple gradients, dramatic shadows, or template SaaS cards as a substitute for design intent.
- Treating code smell as final proof instead of an early warning that still needs rendered verification.
- Using pixel-diff visual regression as taste evaluation; it only detects changes.

## Verification

Before claiming a UI is polished, ready, works, or improved, name the evidence: rendered artifact, `Must not break` conditions, desktop/mobile viewport checks, real interactions exercised, motion feedback contract when relevant, accessibility or keyboard result, console/network status when available, AI slop signals reviewed, objective rejection criteria, must-fix issues, should-fix risks, human judgment still needed, and explicit not-run status.

## Handoffs

- Use `define-uiux-intent` when the product purpose, audience, system concept, or interaction intent is unclear.
- Use `check-architecture-boundaries` when "interface" means module/API/type/method shape rather than rendered user-facing UI.
- Use `narrow-evidence-claims` before claiming visual polish, readiness, or accessibility from partial checks.
