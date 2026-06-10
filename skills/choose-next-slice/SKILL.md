---
name: choose-next-slice
description: "Use when deciding what product or architecture work should happen next: proposal fixation, wrong-layer work, fake progress, over-engineering, capability order, blocker removal, vertical slice sizing, or whether to build mechanism before more tests/docs."
---

# Choose Next Slice

## Core

Use this to decide the next real work item before planning or implementation.

Primary owner: opportunity cost, direction challenge, product capability sequencing, blocker removal, vertical slice size.

Does not own: detailed implementation plans, code edits, delivery readiness, or runtime ownership boundaries.

## Workflow

1. Name the proposed work in one sentence.
2. List 2-4 credible alternatives, including "fix the mechanism first" and "do nothing yet" when plausible.
3. Ask which option increases product capability the most with the least detour risk.
4. Reject slices that only add wrappers, reports, fixtures, tests, docs, or evidence when the executable mechanism is still missing.
5. Choose the smallest vertical slice that proves the intended capability through real behavior.
6. Hand off to `superpowers:writing-plans` only after the direction is accepted.

## Decision Test

Prefer the slice that:

- removes a current blocker instead of decorating around it
- proves real user-visible behavior
- reduces fake-pass risk
- keeps activation/merge-back boundaries intact
- can be verified without a new broad harness

## Stop Signals

Stop and challenge direction when:

- the proposal fixes the latest failing case one by one
- the product still feels fake despite passing tests
- the next task is another golden set before the mechanism exists
- the work adds a report, packet, or dashboard without runtime consumption
- the chosen slice depends on unbuilt memory/context/state

## Verification

Before claiming the next slice is right, state:

- chosen slice
- rejected alternatives
- product capability advanced
- blocker removed
- first verification case
- handoff owner

Keep this concise. Do not write a planning document unless the user asks or the slice is accepted.
