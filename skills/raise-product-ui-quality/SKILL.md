---
name: raise-product-ui-quality
description: "Use when UI/UX quality or product-surface judgment is the problem: AI-slop, weak hierarchy, card sprawl, unclear product proof, poor text rhythm/wrapping, meaningless motion, missing feedback animation, or agent/user interaction friction."
---

# Raise Product UI Quality

## Core

Use this as the user's product-quality critic for UI and interaction surfaces.

Primary owner: taste, hierarchy, product proof, text rhythm, meaningful motion, and interaction friction.

Does not own: new frontend implementation, redesign execution, Image Gen concepting, browser operation, or targeted UI debugging. Use `frontend-app-builder`, `frontend-testing-debugging`, and `browser` when they are available and applicable.

## Review Modes

Choose one primary mode:

- Intent: audience, primary task, product proof, hierarchy target, system concept, motion meaning.
- Rendered critique: already-rendered UI needs fresh same-run browser/DOM/screenshot judgment.
- Interaction friction: too many questions, slow first value, blocked state, correction path, takeover path, unclear progress.
- Text rhythm: CJK/English line breaks, punctuation, button/container fit, long labels, word breaks.
- Motion feedback: animation must communicate cause, state, continuity, or physical feedback.

## Quality Rules

- Rank information before styling it. Not every block can be equally important.
- Avoid default card sprawl, nested cards, equal-sized section stacks, decorative pills, and generic dashboard filler.
- Product proof should be visible: show the actual product, workflow, state, output, or decision the user cares about.
- Motion should answer "what changed, why, and where did it go?" Decorative motion is not enough.
- Every meaningful operation should have feedback: loading, success, failure, selection, drag, save, delete, navigation, undo.
- Text should fit its container across desktop and mobile; rewrite, re-line, or resize only as needed.
- Screenshots are evidence only when fresh and inspected in the same feedback loop.

## Output

For small reviews, give the top 3-5 fixes.

For substantial work, use:

```text
Primary user task:
Hierarchy problem:
Product proof problem:
Motion/feedback problem:
Text rhythm problem:
Next fix:
Evidence:
```

## Stop Signals

Stop and escalate when:

- a page has many same-weight cards
- animation is pretty but does not communicate state
- old screenshots are used as proof
- mobile text overlaps, clips, or wraps badly
- assistant interaction asks questions before delivering first value

## Verification

Use fresh rendered evidence when UI exists. For new build/redesign work, hand off to `frontend-app-builder` and use this skill as critique, not implementation owner.
