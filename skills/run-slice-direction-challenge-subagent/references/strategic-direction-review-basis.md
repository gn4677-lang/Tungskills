# Strategic Direction Review Basis

Use this reference when a proposed slice is safe or small but may still be the wrong thing to do now.

## Core Distinction

`run-slice-direction-challenge-subagent` is not an execution reviewer. It answers:

```text
Should this work exist now?
```

It does not primarily answer:

```text
Can this be implemented safely?
```

That second question belongs to planning, architecture, delivery, and code-review skills after direction is accepted.

## Best-Practice Basis

- Google Engineering Practices favors small CLs because they are easier to review, easier to improve, less likely to block, and easier to roll back. This supports small slices, but only after the slice direction is justified.
- DORA treats working in small batches as a way to shorten feedback loops, test hypotheses, and reduce AI-accelerated delivery instability. Small batches are not a license for small busywork.
- Continuous integration and trunk-based practices favor frequent integration of small changes so teams can detect drift and recover quickly. This supports short-lived slices tied to a real integration point.
- Shape Up frames product work as bets, not backlog grooming. A slice should compete against other shaped options; useful-later work is not automatically worth doing now.
- Product discovery practice separates outcomes, opportunities, and solutions. A proposed implementation slice should link to an outcome or blocker, not only to a plausible solution.

## Reviewer Questions

Ask these before approving direction:

```text
What is the current mainline?
What is the current blocker?
What competing mainline-first slice are we not doing?
Why does this slice beat that alternative now?
What breaks if we do not do this now?
What progress does this unlock if we do it now?
What is the opportunity cost?
If this is a detour, what is the exit gate?
What condition returns work to the mainline?
```

## Detour Rules

An `allowed_detour` can proceed only when at least one is true:

- it removes a named current-mainline blocker
- it creates a necessary near-term learning artifact
- it prevents imminent drift, waste, or integration damage
- it is a guard/contract slice needed before safe mainline work can continue

Otherwise prefer `hold` or `return_to_mainline`.

## Common False Positives

| Argument | Why it is insufficient |
| --- | --- |
| It is small. | Small unrelated work still consumes attention and integration capacity. |
| It is safe. | Safety does not prove priority. |
| It is already built. | Sunk cost is not direction evidence. |
| CI is green. | Delivery evidence is not product-direction evidence. |
| It is future useful. | Useful later does not mean useful now. |
| It is diagnostic-only. | Diagnostic work still needs a decision it unlocks. |
| It avoids crossing boundaries. | Boundary safety does not prove mainline value. |

## Verdict Defaults

- If the blocker is vague, use `hold`.
- If the competing mainline alternative is stronger, use `return_to_mainline`.
- If the direction is right but the shape is too broad, use `narrow` or `split`.
- If the detour lacks an exit gate, use `hold`.
- If the slice is directly tied to the blocker and beats the alternative, use `proceed` with explicit do-not-cross lines.
