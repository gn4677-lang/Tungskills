# Slice Kind Taxonomy

Use this when classifying a proposed PR, issue, or agent slice before sequencing or queueing it.

## Core Rule

Do not count every green PR as product progress. Classify what the slice actually changes, then decide whether it belongs in the current train.

## Kinds

| Slice kind | Owns | Merge posture |
| --- | --- | --- |
| `product_capability` | User/operator-visible behavior, accepted runtime behavior, or a real domain capability | Merge when it directly removes the current blocker and gates pass. |
| `vertical_proof` | End-to-end proof that an existing capability works through a real path | Merge when it unlocks a named gate, closeout decision, or risk reduction. Prefer one coherent proof over many projection PRs. |
| `contract_guard` | Schema, guard, boundary, required report, or no-runtime-effect constraint | Merge when it prevents a known class of drift or enables safe parallel work. |
| `ops_test_stability` | CLI root paths, runner stability, environment setup, CI/test reliability, smoke inclusion needed for repeatability | Merge when it unblocks repeatable development or CI. Do not call it product capability. |
| `wrapper_evidence_wiring` | Connecting existing tests, artifacts, reports, bundles, runners, or closeout chains so evidence becomes visible | Merge only when it makes already-existing capability evidence visible to an existing gate or decision. Consolidate repeated wiring. |

## Classification Heuristics

- Pointer/test-only, CLI root path, smoke-test inclusion, report lineage, candidate-bundle field, or status projection is usually `ops_test_stability` or `wrapper_evidence_wiring`.
- One user journey or runtime path proven across layers is usually `vertical_proof`.
- A new guard, schema, activation flag, or no-runtime-effect boundary is usually `contract_guard`.
- New user/operator behavior, accepted runtime behavior, or a domain capability is `product_capability`.
- If a slice only exists so the next slice can be useful, it is not automatically wrong, but it needs a named blocker, gate, or train exit condition.

## Consolidation Triggers

Prefer one coherent PR or a declared short train when:

- several slices serve the same blocker
- several slices feed the same closeout gate or decision pack
- each slice is only status projection, report plumbing, artifact copying, or test inclusion
- none of the slices has independent rollback or review value

## Output Shape

```text
Slice kind:
Current blocker removed:
Evidence or capability advanced:
Independent review value:
Independent rollback value:
Consolidation candidate:
Recommended train shape:
```
