# Interaction Feedback Map

Use this for async actions, AI agents, motion, complex workflows, destructive actions, or anything where the user needs confidence that the system understood them.

## Map Format

| User action | System response | Feedback shown | Timing | Failure state | Reduced-motion fallback | Purpose |
| --- | --- | --- | --- | --- | --- | --- |
|  |  |  |  |  |  |  |

## Feedback Types

- Direct manipulation: the object follows the user's action.
- State confirmation: selected, saved, submitted, queued, running, blocked, done.
- Progress: determinate or indeterminate, with honest scope.
- Causality: show what changed because of the action.
- Spatial continuity: preserve where the user came from and where they are going.
- Recovery: undo, cancel, retry, edit, inspect, or roll back.

## AI Agent Feedback

For AI work, show:

- Goal or instruction being pursued.
- Current phase or step.
- Evidence of work, not fake activity.
- User intervention points.
- Review moment and diff/outcome.
- Confidence or uncertainty in human terms when relevant.

Do not present probabilistic or incomplete AI output as final truth.
