# Mechanism-First EDD

Use this reference only when green tests do not match real product behavior, Golden Sets keep expanding, or a long EDD loop keeps moving failures between cases.

## Gate Before More Cases

Before changing prompts, schemas, guards, or Golden Sets for a high-impact agentic failure, write the smallest mechanism note:

```text
Product capability:
Failure family:
Code references inspected:
Real entrypoint inspected:
Semantic owner:
Deterministic boundary:
Invariants:
Targeted E2E plan:
Holdout family:
```

If these fields cannot be named, the next action is diagnosis, not another case.

## Golden Set Pairing

Use two paired artifacts for important capability families:

- Golden Set: representative product behaviors and expected outcomes.
- Mechanism map: code path, owner, trace fields, invariants, targeted E2E, implementation references, and holdout family that make the behavior real.

Do not require a mechanism map for every small regression. Require it when the user-facing capability, semantic owner, or architecture mechanism is still disputed.

## Implementation References

Use official docs for normative rules. Use mature repo/framework examples for mechanism shape: code path, tests, trace surfaces, failure handling, state boundaries, and owner separation.

Implementation references are not product truth. They are evidence that the proposed mechanism is plausible and not only a local patch to a benchmark.

## Fake-Pass Signals

Stop patching the eval and inspect the mechanism when:

- manual use feels fake despite green tests
- a browser or route gate passes but the real entrypoint does not exercise the intended owner
- final text is templated while the claim is natural assistant behavior
- the suite passes by fixtures, shell navigation, persistence, or read-model behavior only
- cases are repeatedly added but failures move between examples
- a keyword list, fixture label, or runner field becomes semantic proof

## Minimum Useful Fix

Prefer one named failure family, one mechanism adjustment, one targeted E2E, and a few holdouts. Avoid building a new framework unless the same fake-pass class recurs across capabilities.
