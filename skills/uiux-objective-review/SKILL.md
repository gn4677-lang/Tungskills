---
name: uiux-objective-review
description: Use when Codex needs to review, verify, QA, or improve rendered UI/UX with screenshots, accessibility, responsive checks, interaction states, visual hierarchy, heuristic review, AI slop detection, objective rejection criteria, or design readiness before claiming a UI is polished/ready. Trigger on rendered-UI defects such as layout overlap, mobile/responsive breakage, screenshot QA findings, accessibility issues, generic AI styling, fake-looking demos, or readiness claims about visual quality.
---

# UI/UX Objective Review

## Overview

Use this skill to reject objectively weak UI before relying on human taste. Separate what can be checked from what still needs product, brand, or aesthetic judgment.

## Core Rule

Never claim a UI is "good", "polished", "ready", or "well designed" from code inspection alone. Verify the rendered surface when possible, then report:

- Objective checks passed.
- Must-fix failures.
- Should-fix risks.
- Human judgment needed.

If no screenshot, URL, prototype, local app, Storybook, or source files are available, say the review is blocked by missing rendered artifact. Ask for the minimum useful artifact first; do not invent findings.

## Workflow

1. Gather the design intent. If the goal is unclear, use `uiux-intent-designer` first.
2. Inspect the rendered UI when possible: browser, screenshots, local app, Storybook, prototype, or supplied images. If none exists, stop with the missing-artifact response.
3. Review desktop and mobile viewports for layout stability, text fit, hierarchy, and task clarity.
4. Exercise important states: default, hover, focus, active, disabled, loading, empty, error, success, and reduced motion where relevant.
5. Run available automated checks without overstating them: axe, Lighthouse, Playwright screenshots, visual regression, keyboard smoke tests.
6. Apply objective rubrics:
   - `references/objective-quality-checklist.md`
   - `references/ai-slop-rejection-checklist.md`
   - `references/ai-slop-example-gallery.md`
   - `references/visual-example-index.md`
   - `references/code-smell-to-ui-failure-map.md`
   - `references/interaction-truthfulness-check.md`
   - `references/heuristic-review-rubric.md`
7. If reviewing a live or local implementation, follow `references/rendered-ui-review-protocol.md`.
8. Report issues by severity and tie each issue to a user impact.

## Default Output

```text
Rendered artifact: screenshot | browser | local app | prototype | missing
Objective checks passed: ...
AI slop signals: ...
Must-fix failures: ...
Should-fix risks: ...
Human judgment needed: ...
Evidence not run: ...
Decision: ready | narrow | stop
```

## Review Categories

Use these categories unless the user requests a different format:

- `must fix`: broken task completion, unreadable content, misleading state, accessibility blocker, layout overlap, clipped controls, fake product proof, or motion that prevents use.
- `should fix`: weak hierarchy, avoidable cognitive load, generic AI styling, domain mismatch, unclear copy, inconsistent spacing, incomplete states, or questionable interaction timing.
- `human judgment needed`: brand tone, taste, novelty, emotional feel, market positioning, and whether the design is distinctive enough.

## Objective Rejection Rules

Reject the design as not ready when any of these are true:

- The first screen does not make clear what the product is, who it is for, and why it matters.
- Primary user path is hidden, ambiguous, or visually deprioritized.
- Text overlaps, clips, wraps badly, or becomes unreadable at common viewport sizes.
- UI state lies about system state or progress.
- Motion steals attention without clarifying what changed.
- The interface looks like a generic AI template with no intentional brand or product fit.
- Major interactive elements cannot be reached or understood by keyboard and visible focus.
- Screenshots, charts, demos, or operational data look fake, low-fidelity, or unrelated to the core task.

## Stop Signals

Stop or narrow when:

- no rendered artifact is available for a rendered-UI readiness claim
- code inspection is used as the only evidence for polished, ready, or well-designed UI
- major viewports, interaction states, keyboard access, or loading/error/empty states are untested
- objective failures are being reframed as taste preferences instead of must-fix issues
- the review ignores obvious AI-slop signals because the pixels look "modern"

## Common Mistakes

- Treating accessibility scores as complete UX review.
- Reviewing screenshots without checking interaction states.
- Calling something "clean" when it is merely empty.
- Accepting purple gradients, dramatic shadows, or template SaaS cards as a substitute for design intent.
- Treating code smell as final proof instead of an early warning that still needs rendered verification.
- Using pixel-diff visual regression as taste evaluation; it only detects changes.

## Verification

Before claiming a UI is polished, ready, or improved, name the evidence: rendered artifact, desktop/mobile viewport checks, interaction states exercised, accessibility or keyboard result, AI slop signals reviewed, objective rejection criteria, must-fix issues, should-fix risks, human judgment still needed, and explicit not-run status.

## Handoffs

- Use `uiux-intent-designer` when the product purpose, audience, system concept, or interaction intent is unclear.
- Use `architecture-boundary-governance` when "interface" means module/API/type/method shape rather than rendered user-facing UI.
- Use `evidence-claim-integrity` before claiming visual polish, readiness, or accessibility from partial checks.
