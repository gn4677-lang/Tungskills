---
name: run-slice-direction-challenge-subagent
description: "Use when deciding whether a proposed slice should exist now before planning or implementation, especially after merge/PR, before a new slice, or when worried about mainline fit, current blocker, opportunity cost, detour, future-wave work, over-engineering, overfit, over-split PRs, wrapper/evidence wiring, closeout/report sprawl, 做歪, 下一個 slice, or why now."
---

# Run Slice Direction Challenge Subagent

## Action Protocol

Use this as a strategic direction-review protocol. Challenge direction before optimizing execution.

Primary question: should this slice exist now?

Positive default: prefer the slice that most directly removes the current blocker, creates the next user/operator-visible capability, or unlocks a real decision.

Secondary question: if yes, what is the right-sized shape? Small is useful only when the split has independent blocker, review, or rollback value.

## Operating Mode

- High-risk mode: the root/controller agent MUST dispatch a fresh contrarian subagent for medium/high-risk slice decisions.
- Inline mode is acceptable only for small, obviously bounded, low-reversibility-cost decisions.
- This skill does not approve implementation details; it approves, right-sizes, splits, holds, or returns slice direction to the mainline.
- A repo bootstrap checklist, planning YAML, or mainline/detour declaration is not a substitute for this skill when the slice direction itself is under question.

## When to Use

Use this when the main question is what to build next, why now, what blocker it removes, what mainline work it displaces, whether the slice is right-sized, and whether it is mainline, future-wave, over-engineered, too broad, too fragmented, or too early.

Use `superpowers:brainstorming` when the product concept itself is still broad or ambiguous. Use `sequence-capability-work` when direction is already accepted and the remaining question is build order.

## Dispatch Rule

If subagents are available and any of these are true, the root/controller dispatches a fresh contrarian subagent before giving a verdict:

- you are opening the next slice after merge or PR
- you are producing or approving a non-trivial mainline/detour/future-wave decision
- there are multiple candidate slices
- the proposal is an `allowed_detour`, future-wave bridge, diagnostic sidecar, or offline-only slice
- the proposal is justified mainly by "small", "safe", "already started", "nearly done", or "low risk"
- no competing mainline-first alternative has been named
- mainline vs future-wave is unclear
- the proposal is cross-cutting, stateful, platform-shaped, or architecture-heavy
- the user explicitly worries about over-engineering, overfit, scope drift, or doing the wrong thing
- the source of truth or best-practice basis is not already explicit

Use `./contrarian-reviewer-prompt.md` for that dispatch.

This follows the same controller-owned pattern as `superpowers:subagent-driven-development`: the root/controller reads this skill, fills the prompt template, and dispatches the reviewer. Do not ask an already-dispatched child subagent to spawn another subagent. If a child subagent discovers direction is not accepted, it should report `NEEDS_DIRECTION_CHALLENGE`.

If a required contrarian subagent is not run, the controller must say so explicitly in the output with `Direction challenge subagent: skipped` and a concrete reason such as `low-risk tiny slice`, `subagents unavailable`, or `user asked for inline answer only`.

## Read First

- Read `references/research-basis.md` when the direction basis or process rationale is disputed.
- Read `references/contrarian-question-bank.md` when you need sharper challenge questions.
- Read `references/right-sized-slice-patterns.md` when a proposal feels too large, too coupled, too eager, or fragmented into too many tiny coordination slices.
- Read `references/strategic-direction-review-basis.md` when the question is opportunity cost, mainline vs detour, Shape Up-style bet/appetite, small batches, or whether a safe slice should be done now.

## Workflow

1. State the product goal, current mainline, and current mainline blocker in plain language.
2. Restate the proposed slice as a falsifiable hypothesis, not a commitment.
3. Name the competing mainline-first alternative before evaluating the proposed slice.
4. Compare the proposed slice against the competing alternative: blocker removal, product capability gain, decision unlock, opportunity cost, why-now, and what breaks if we do not do it now.
5. Challenge the slice from five directions: more coherent, smaller, later, different, and return-to-mainline.
6. Name the source of truth and the best-practice basis. If either is missing, do not proceed casually.
7. Decide whether the slice is mainline, future-wave, guard-only, contract-only, offline-only, detour, distraction, or should be held.
8. If the verdict is `proceed` or `right_size`, define the exact implementation boundary, exit gate, and explicit do-not-cross lines.
9. Hand off to planning or sequencing only after the boundary is accepted.

For medium/high-risk cases, spawn a fresh subagent with only:

- product goal
- current mainline
- current blocker
- proposed slice
- competing mainline-first alternative if known
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

Use `./contrarian-reviewer-prompt.md` as the dispatch template. Use `references/contrarian-question-bank.md` only when the basic more-coherent/smaller/later/different lenses are not enough.

## Default Output

Keep the answer compact:

```text
Direction challenge subagent: run | skipped | not_available
Skip reason, if any:
Product goal:
Current mainline blocker:
Proposed slice:
Positive progress type: blocker_removal | product_capability | decision_unlock | risk_reduction | none
Product/operator capability advanced:
Right-sized slice check:
Wrapper/evidence wiring role:
Competing mainline slice:
Why this beats mainline work:
What breaks if we do not do this now:
Opportunity cost:
Direct link to blocker:
Why now:
Source of truth:
Best-practice basis:
Dependency preconditions:
Right-sized slice:
Right-sizing alternatives:
- more coherent:
- smaller:
- later / hold:
- different shape:
- return_to_mainline:
Detour classification:
Detour exit gate:
Return-to-mainline condition:
Boundary / ownership risks:
Over-engineering risk:
Future-wave or mainline:
Questions that must be answered:
Verdict: proceed | right_size | split | hold | return_to_mainline
If proceed, exact implementation boundary:
Do-not-cross lines:
Handoff skills:
```

## Verdict Rules

- `safe_to_proceed_now` is not the same as `should_proceed_now`.
- Prefer `blocker_removal`, `product_capability`, or `decision_unlock` over proof-only, status-only, readiness-only, or wrapper/evidence wiring work.
- If two slices are both safe, choose the one that more directly changes what the user/operator can do or removes the current blocker.
- A small slice is not automatically a good slice; small but unrelated work is `hold` or `return_to_mainline`.
- A verdict of `proceed` or `right_size` requires a named competing mainline slice and a reason the proposed slice beats it now.
- If no competing mainline-first alternative is named, the verdict cannot be `proceed`; use `right_size`, `hold`, or `return_to_mainline`.
- "Already built", "nearly done", "low risk", "small bridge", "CI green", and "easy to merge" are not direction evidence.
- The right-sized slice is not necessarily the smallest possible PR; it must independently remove a blocker, deliver a user/operator-visible capability, or unlock a named decision.
- Do not split a coherent vertical slice merely to make PRs smaller when the split adds coordination debt, stale-base risk, or review confusion.
- A verdict of `right_size` means "adjust to the right boundary"; it may make the slice smaller, larger, or more coherent.
- Wrapper/evidence wiring is acceptable only when it connects an already-built capability to an existing gate, closeout chain, or decision that currently cannot see the evidence.
- If several wrapper/evidence wiring PRs share the same blocker, same gate, and no independent rollback or review value, consolidate them.

## Stop Signals

Do not approve the proposed slice when:

- the product goal, current blocker, source of truth, or competing mainline slice is missing
- the answer proves only that the slice is safe, not that it should happen now
- opportunity cost or detour exit is omitted when relevant
- diagnostic/offline work creates another artifact or report family without naming the decision it unlocks
- wrapper/evidence wiring only copies status between artifacts, reports, bundles, runners, or closeout steps
- tiny PRs repeatedly update the same closeout, bundle, report, runner, smoke inclusion, or status projection chain
- a coherent vertical capability is split into fragments with no independent review or rollback value
- the reviewer forces smaller PRs without naming the risk reduced by the split
- future-wave or speculative work is framed as immediate mainline necessity
- "green CI", "done branch", or "we already built most of it" is used as direction evidence

## Verification

Before claiming the slice is right, name:

- the exact blocker
- the competing mainline alternative
- why this slice beats mainline work now
- the opportunity cost and detour exit gate when relevant
- the source-of-truth artifact
- the best-practice basis
- why more-coherent/smaller/later/different/return-to-mainline alternatives were rejected

If the verdict is `proceed`, the next plan or spec should preserve the `Current mainline blocker`, `Exact implementation boundary`, and `Do-not-cross lines` verbatim or explain why they changed.

## Handoffs

- Use `superpowers:brainstorming` when the idea is still broad and needs full design exploration.
- Use `sequence-capability-work` when the slice is accepted and the next question is sequencing or dependency order.
- Use `check-architecture-boundaries` when the main risk is API, ownership, data-model, or runtime boundary crossing.
- Use `gate-delivery-readiness` when the main risk is PR readiness, merge posture, stale base, or queue eligibility.
- Use `gate-agent-activation` when the slice changes shadow/live/user-facing/mutation authority posture.
- Use `narrow-evidence-claims` before claiming a slice is justified, safe, ready, or clearly aligned.
- Use `superpowers:writing-plans` only after the slice boundary is accepted.
