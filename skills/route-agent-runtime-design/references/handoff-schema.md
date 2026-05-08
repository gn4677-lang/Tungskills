# Handoff Schema

Use this schema only when a skill output should hand the problem to another runtime skill.

Keep it light. This is not an error-code system.

## Optional handoff block

- `primary_diagnosis`
  - short phrase naming the current bottleneck
- `confidence`
  - `high`, `medium`, or `low`
- `handoff_signal`
  - short phrase explaining why another skill may need to take over
- `next_skill_if_blocked`
  - one runtime skill name, or `none`

## Example

- `primary_diagnosis`: retrieval source classes are underspecified
- `confidence`: high
- `handoff_signal`: if search remains low-confidence after source-class cleanup, evaluate degraded fallback behavior
- `next_skill_if_blocked`: `design-agent-fallbacks`

## Rules

- Use at most one handoff target.
- Do not invent machine-readable `ERR_*` codes unless a real API needs them.
- Leave the block out when no handoff is needed.
- Prefer plain language that another skill can act on immediately.
