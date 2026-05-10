# Semantic Support And Keyword Scaffold

Use this reference when deterministic code, validators, guards, runners, fixtures, regexes, dictionaries, or keyword lists may be promoted into semantic proof.

## Core Rule

Keyword scaffolds can help detect risk. They do not prove semantic truth.

```text
lexical hit != semantic support
term-list pass != groundedness
fixture label != product truth
validator report != rewritten truth
```

## Preferred Ownership Split

```text
LLM / human / approved semantic tool:
  proposes semantic support
  cites evidence span or source region
  assigns support_state when judgment is needed

deterministic code:
  validates schema and enum legality
  verifies source IDs and evidence region IDs exist
  verifies cited span is inside the cited source region
  routes unsupported or partial support to review
  emits warnings, negative guards, or smoke-test diagnostics

deterministic code must not:
  infer semantic support from keyword hits
  promote reviewable support into accepted truth
  rewrite semantic fields because a term list matched
  replace evidence-span reasoning with dictionary coverage
```

## Generic Support Shape

Use a structure like this when semantic support must be carried across layers:

```json
{
  "claim_or_axis": "...",
  "support_state": "supported | partial | unsupported | unobservable",
  "evidence_region_ids": ["..."],
  "supporting_span": "...",
  "rationale": "...",
  "review_needed": true
}
```

The field names can differ by project. The invariant is the same: semantic support needs a state, provenance, cited evidence, and a review path.

## Legitimate Uses Of Keyword Scaffolds

| Use | Allowed role |
| --- | --- |
| Cheap warning | Flag low confidence or review-needed cases. |
| Negative guard | Catch known false positives such as phrase collisions or wrong entity type. |
| Smoke regression | Ensure a previously observed lexical hazard still triggers review. |
| Prioritization | Rank cases for human or model review. |

Do not use these as the primary proof that a semantic category, axis, intent, route, or claim is supported.

## Failure Patterns

| Failure | Symptom |
| --- | --- |
| Keyword scaffold promoted to proof | A term hit becomes `supported=true`. |
| Validator as semantic oracle | The validator decides meaning instead of reporting shape/provenance problems. |
| Fixture-shaped truth | Test labels become product categories. |
| Lexical drift | Each exception adds another term instead of improving evidence support. |
| Language bias | One language, dialect, or phrasing dominates support detection. |
| False positive support | A word appears in a different sense and passes. |
| False negative support | Real support is phrased without the expected term. |

## Review Test Seeds

For any semantic support mechanism, include cases for:

- paraphrase or synonym support without the keyword
- keyword present but unsupported
- multilingual or oral phrasing
- ambiguous mention requiring `partial` or `review_needed`
- cited span outside the claimed source region
- unsupported support state routed to review instead of accepted truth
