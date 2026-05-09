# Contrarian Question Bank

Use 5-8 of these questions per review. Do not dump the full list unless the proposal is genuinely high-risk.

## Goal

- What exact product or user outcome are we trying to change?
- If this slice succeeds, what becomes easier, safer, or unblocked?
- If this slice ships and nothing else changes, what value did we actually create?

## Blocker

- What is blocked right now, specifically?
- Is that blocker real, or inferred from implementation discomfort?
- What evidence says this blocker is more urgent than the alternatives?

## Scope

- What is the smallest safe slice that still changes the real outcome?
- What can be removed without losing the mainline value?
- Is this one slice, or multiple slices wearing one name?

## Alternatives

- What is the smaller alternative?
- What is the defer/hold alternative?
- What is the different-shape alternative that keeps the goal but reduces coupling?
- Why is the current proposal better than those alternatives right now?

## Mainline vs Future-Wave

- Does this belong on the current mainline, or is it a future capability?
- Are we merging a dependency/contract/guard slice, or are we sneaking in implementation early?
- If this stayed draft/shadow/offline, what would actually break?

## Source of Truth

- What document, user-flow trace, ADR, issue, or runbook makes this proposal legitimate?
- If two source-of-truth artifacts disagree, which one wins and why?
- Are we inventing new language because the domain is unclear?

## Best-Practice Basis

- What external best practice or internal rule supports this direction?
- Are we applying a best practice, or cargo-culting a pattern out of context?
- Is the cited best practice about goals, implementation details, or operations? Are we mixing those levels?

## Boundary and Ownership

- Which owner is supposed to hold this behavior?
- Are we solving this by crossing a boundary because the correct owner is inconvenient?
- Are we creating platform/shared work without proven consumers?

## Reversibility

- If this direction is wrong, how expensive is it to undo?
- What boundary or artifact will make this decision sticky?
- Can we validate the hypothesis with a more reversible slice first?
