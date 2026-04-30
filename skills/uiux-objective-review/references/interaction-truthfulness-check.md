# Interaction Truthfulness Check

Use this when UI state, progress, AI work, or animation could mislead the user.

## Checks

- Loading indicators correspond to real pending work.
- Progress bars are determinate only when progress is measurable.
- Success messages appear only after the operation succeeds.
- Disabled controls have a clear reason or nearby context.
- Agent activity shows real goal, phase, or evidence of work.
- Diffs, previews, and generated outputs match what will be applied.
- Hover and focus states do not imply unavailable actions are clickable.
- Motion reflects the actual relationship between source and destination.

## AI-Specific Risks

- Fake typing or fake reasoning can reduce trust if it does not reflect real work.
- Overconfident language hides uncertainty.
- Showing only final output removes the review moment humans need.
- Multiple agents or tasks need clear names, goals, states, and ownership.

## Repair Moves

- Replace fake progress with phase labels.
- Show reviewable artifacts or diffs.
- Use "queued", "running", "needs review", "blocked", and "done" precisely.
- Add cancel, pause, retry, or inspect controls where user control matters.
- Keep important feedback understandable without animation.
