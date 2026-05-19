# Interaction Feedback Map

Use this for async actions, AI agents, motion, complex workflows, destructive actions, or anything where the user needs confidence that the system understood them.

## Map Format

| User action | System response | Feedback shown | Motion meaning | Physical model | Timing | Failure state | Reduced-motion fallback | Purpose |
| --- | --- | --- | --- | --- | --- | --- | --- | --- |
|  |  |  |  |  |  |  |  |  |

## Feedback Types

- Direct manipulation: the object follows the user's action.
- State confirmation: selected, saved, submitted, queued, running, blocked, done.
- Progress: determinate or indeterminate, with honest scope.
- Causality: show what changed because of the action.
- Spatial continuity: preserve where the user came from and where they are going.
- Recovery: undo, cancel, retry, edit, inspect, or roll back.

## Motion Meaning

Use motion only when it communicates at least one of:

- Feedback: the system received the action.
- Causality: this action caused that state or object to change.
- Continuity: the user can track source, destination, or preserved object identity.
- Hierarchy: parent-child, modal, drawer, detail, or same-level navigation relationship.
- Status: pending, success, error, blocked, saved, queued, running, or cancelled.
- Affordance: draggable, expandable, selectable, dismissible, or reversible.

## Physical Coherence

- Presses should respond immediately.
- Created surfaces should originate from the trigger point or selected object when that helps comprehension.
- Parent-to-child transitions can expand/lift; sibling transitions should not imply a false hierarchy.
- Completion should settle; errors should be noticeable without feeling like success.
- Frequent actions should stay brief and interruptible.
- Important information must remain understandable without motion.

## AI Agent Feedback

For AI work, show:

- Goal or instruction being pursued.
- Current phase or step.
- Evidence of work, not fake activity.
- User intervention points.
- Review moment and diff/outcome.
- Confidence or uncertainty in human terms when relevant.

Do not present probabilistic or incomplete AI output as final truth.
