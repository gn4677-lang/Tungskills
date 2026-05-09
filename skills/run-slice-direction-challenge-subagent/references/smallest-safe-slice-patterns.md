# Smallest Safe Slice Patterns

Use this reference when a proposal feels too broad, too integrated, or too eager.

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

## Reduction Moves

- Split mutation from observation.
- Split contract from implementation.
- Split guard from capability.
- Split one vertical path from the full matrix of cases.
- Split MVP mainline from future-wave improvements.
- Split "must work" from "nice to operate."

## Reversibility Test

Prefer the slice that:

- can be rolled back without touching many adjacent capabilities
- does not create authoritative runtime truth too early
- does not require other branches or PRs to change in lockstep
- keeps the system understandable if work pauses after this slice

## Output Reminder

If you say a larger slice is still correct, explain:

- what smaller slice was considered
- why it was insufficient
- what new risk the larger slice adds
- why that risk is justified now
