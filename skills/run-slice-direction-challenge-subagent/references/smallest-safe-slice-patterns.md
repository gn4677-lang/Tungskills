# Smallest Safe Slice Patterns

Use this reference when a proposal feels too broad, too integrated, too eager, or fragmented into too many tiny coordination slices.

## Prefer These Slice Shapes First

| Pattern | Use when | Why it is smaller/safer |
| --- | --- | --- |
| Guard-only | You need to stop harm or block invalid states | Adds protection without committing to a full capability. |
| Contract/schema-only | Multiple teams or slices need a stable interface | Locks integration shape before implementation breadth. |
| Read-only / observe-only | You need visibility before mutation or automation | Lets you learn from real data without activating writes. |
| Offline sidecar | Capability is useful for analysis but not mainline runtime | Preserves learning without changing live truth. |
| Shadow / no-mutation | You need runtime evidence before authority | Validates behavior before user-facing or state-changing rollout. |
| Instrumentation-first | The blocker may be poorly measured | Gets evidence before redesign. |
| Single vertical path | Feature spans multiple layers | Provides one end-to-end path instead of broad horizontal prep. |
| Extract-only integration | Future-wave work has one useful guard/contract piece | Brings in the stable piece without merging the whole capability. |

## Smells That Mean the Slice Is Too Big

- "while we're here" additions
- new shared utility before two real consumers exist
- framework/platform work before product pressure proves the need
- runtime authority bundled with first-pass logic
- broad abstraction for one current call site
- future reporting, settings, admin, or analytics bundled into core delivery

## Smells That Mean the Slice Is Too Small

Small PRs are a delivery tactic, not the goal. A slice can be too small when it creates coordination overhead without independently reducing product, runtime, or integration risk.

Watch for:

- wrapper-only changes that copy status between artifacts, reports, bundles, runners, or closeout steps
- evidence wiring that makes an existing test/report visible but does not unlock a named gate or decision
- several PRs that all serve the same blocker, same evidence chain, or same closeout gate
- PRs whose main value is "the next PR can use this"
- smoke-test inclusion, candidate-bundle fields, report projection, or handoff mapping split from the capability that makes them meaningful
- no independent rollback value, no independent review value, and no direct user/operator capability

## Wrapper / Evidence Wiring Rule

Wrapper/evidence wiring is legitimate when an already-built capability has evidence but an existing gate, closeout chain, or decision cannot see it.

It is suspect when the capability is not done yet, the wiring creates a new report family, or the PR only moves evidence from one artifact to another without naming the decision it unlocks.

Use this test:

```text
If this PR merged alone and work paused, what blocker would be removed?
What user/operator capability would now work?
What existing gate or decision can now see evidence it could not see before?
If the answer is "none", consolidate or hold.
```

## Reduction Moves

- Split mutation from observation.
- Split contract from implementation.
- Split guard from capability.
- Split one vertical path from the full matrix of cases.
- Split MVP mainline from future-wave improvements.
- Split "must work" from "nice to operate."
- Merge wrapper-only leaf PRs back into the capability slice when they share the same blocker and have no independent rollback value.
- Turn repeated evidence-wiring repairs into one explicit short train with an exit gate, not an open-ended stream of leaf PRs.

## Reversibility Test

Prefer the slice that:

- can be rolled back without touching many adjacent capabilities
- does not create authoritative runtime truth too early
- does not require other branches or PRs to change in lockstep
- keeps the system understandable if work pauses after this slice
- still has independent value if the next planned PR never happens

## Output Reminder

If you say a larger slice is still correct, explain:

- what smaller slice was considered
- why it was insufficient
- what new risk the larger slice adds
- why that risk is justified now

If you say a tiny wrapper/evidence slice is still correct, explain:

- the existing gate or decision it unlocks
- the already-built capability whose evidence was invisible
- why it should not be consolidated with adjacent work
- the exit condition that stops further wiring PRs
