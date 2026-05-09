---
name: run-slice-direction-challenge-subagent
description: "Use when the root/controller should run a contrarian direction-review subagent before choosing what to build next, opening a new slice after merge/PR, approving mainline vs detour, or checking product-goal fit, current blocker, source of truth, best-practice basis, over-engineering, overfit, future-wave risk, and smallest safe scope. Trigger on subagent direction challenge, contrarian reviewer, next slice, why now, strategic sequencing, 做歪, 新 slice, 最小安全範圍."
---

# Run Slice Direction Challenge Subagent

## Action Protocol

Use this as a contrarian subagent protocol. Challenge direction before planning or implementation, and require a controller-owned subagent for risky slice decisions when available.

Core principle: challenge direction before optimizing execution.

## Operating Mode

- High-risk mode: the root/controller agent MUST dispatch a fresh contrarian subagent for medium/high-risk slice decisions.
- Inline mode is acceptable only for small, obviously bounded, low-reversibility-cost decisions.
- This skill does not approve implementation details; it approves, narrows, splits, or holds slice direction.
- A repo bootstrap checklist, planning YAML, or mainline/detour declaration is not a substitute for this skill when the slice direction itself is under question.

## When to Use

Use this when the main question is:

- what should we build next
- why now
- is this the smallest safe slice
- is this mainline or future-wave
- is this over-engineered, too broad, or too early
- what source of truth or best-practice basis justifies this direction

Use `superpowers:brainstorming` when the product concept itself is still broad or ambiguous.

Use `sequence-capability-work` when the slice is already accepted and the main question is sequencing among accepted capabilities.

## Dispatch Rule

If subagents are available and any of these are true, the root/controller agent dispatches a fresh contrarian subagent before giving a verdict:

- you are opening the next slice after merge or PR
- you are producing or approving a non-trivial `mainline_slice`, detour classification, or strategic sequencing decision
- there are multiple candidate slices
- mainline vs future-wave is unclear
- the proposal is cross-cutting, stateful, platform-shaped, or architecture-heavy
- the user explicitly worries about over-engineering, overfit, scope drift, or doing the wrong thing
- the source of truth or best-practice basis is not already explicit

Use `./contrarian-reviewer-prompt.md` for that dispatch.

This follows the same controller-owned pattern as `superpowers:subagent-driven-development`: the root/controller reads this skill, fills the prompt template, and dispatches the reviewer. Do not ask an already-dispatched child subagent to spawn another subagent. If a child subagent discovers the slice is not accepted, it should report `NEEDS_DIRECTION_CHALLENGE` with the blocker and candidate slice.

If a required contrarian subagent is not run, the controller must say so explicitly in the output with `Direction challenge subagent: skipped` and a concrete reason such as `low-risk tiny slice`, `subagents unavailable`, or `user asked for inline answer only`.

## Read First

- Read `references/research-basis.md` when the direction basis or process rationale is disputed.
- Read `references/contrarian-question-bank.md` when you need sharper challenge questions.
- Read `references/smallest-safe-slice-patterns.md` when a proposal feels too large, too coupled, or too eager.

## Workflow

1. State the product goal and the current mainline blocker in plain language.
2. Restate the proposed slice as a falsifiable hypothesis, not a commitment.
3. Challenge the slice from three directions: smaller, later, and different.
4. Name the source of truth and the best-practice basis. If either is missing, do not proceed casually.
5. Decide whether the slice is mainline, future-wave, guard-only, contract-only, offline-only, or should be held.
6. If the verdict is `proceed`, define the exact implementation boundary and explicit do-not-cross lines.
7. Hand off to planning or sequencing only after the boundary is accepted.

For medium/high-risk cases, spawn a fresh subagent with only:

- product goal
- current blocker
- proposed slice
- the few source-of-truth artifacts needed to challenge it

Do not pass the intended answer or a preferred verdict. The subagent should challenge the proposal, not justify it.

If you are already inside a child subagent and do not have native subagent dispatch, stop and return:

```text
Status: NEEDS_DIRECTION_CHALLENGE
Product goal:
Current blocker:
Proposed slice:
Reason controller challenge is required:
```

Use `./contrarian-reviewer-prompt.md` as the dispatch template. Use `references/contrarian-question-bank.md` when you need sharper lenses than smaller/later/different.

## Default Output

Keep the answer compact:

```text
Direction challenge subagent: run | skipped | not_available
Skip reason, if any:
Product goal:
Current mainline blocker:
Proposed slice:
Direct link to blocker:
Why now:
Source of truth:
Best-practice basis:
Dependency preconditions:
Smallest safe slice:
Smaller alternative rejected:
Defer/hold alternative:
Different-shape alternative:
Boundary / ownership risks:
Over-engineering risk:
Future-wave or mainline:
Questions that must be answered:
Verdict: proceed | narrow | split | hold
If proceed, exact implementation boundary:
Do-not-cross lines:
Handoff skills:
```

## Stop Signals

Do not approve the proposed slice when:

- the product goal or current blocker cannot be stated clearly
- the proposal starts with a solution before proving the problem
- a repo or project checklist has been filled but no direction challenge was run or explicitly skipped for a non-trivial slice
- there is no source of truth for the claimed blocker or scope
- there is no best-practice basis for an architecture, runtime, or workflow change
- a clearly smaller or more reversible slice exists and has not been rebutted
- future-wave or speculative work is being framed as immediate mainline necessity
- "green CI", "done branch", or "we already built most of it" is used as direction evidence
- the answer depends on implementation convenience rather than product or capability need

## Verification

Before claiming the slice is right, name:

- the exact blocker
- the source-of-truth artifact
- the best-practice basis
- why smaller/later/different alternatives were rejected

If the verdict is `proceed`, the next plan or spec should preserve the `Current mainline blocker`, `Exact implementation boundary`, and `Do-not-cross lines` verbatim or explain why they changed.

## Handoffs

- Use `superpowers:brainstorming` when the idea is still broad and needs full design exploration.
- Use `sequence-capability-work` when the slice is accepted and the next question is sequencing or dependency order.
- Use `check-architecture-boundaries` when the main risk is API, ownership, data-model, or runtime boundary crossing.
- Use `gate-delivery-readiness` when the main risk is PR readiness, merge posture, stale base, or queue eligibility.
- Use `gate-agent-activation` when the slice changes shadow/live/user-facing/mutation authority posture.
- Use `narrow-evidence-claims` before claiming a slice is justified, safe, ready, or clearly aligned.
- Use `superpowers:writing-plans` only after the slice boundary is accepted.
