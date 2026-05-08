# Human-AI Product Patterns

Use this file when proactive behavior must feel helpful rather than intrusive.

These sources are product-design guidance, not runtime source-of-truth:

- Microsoft Research, *Guidelines for Human-AI Interaction*
- Fogg Behavior Model
- Google HEART framework

## Microsoft HAI guidance

Use these principles as the main product policy for proactive behavior:

- time services to the current context
- make clear why the agent is acting now
- support efficient dismissal
- support correction after an unwanted or wrong suggestion
- learn from explicit and implicit feedback over time
- preserve user control when confidence is low

What this changes in agentic products:

- proactive actions need a reason, not just a trigger
- every intervention should have an easy dismiss, snooze, or undo path
- when uncertain, draft or suggest before acting

## Fogg for proactive prompts

Use Fogg narrowly to design reminders, nudges, and approvals:

- prompt only when motivation and ability are likely to be present
- if users ignore a flow, first lower effort instead of increasing prompt frequency
- the next step should be tiny enough to complete immediately

What this changes in agentic products:

- approval requests should be one action, not a mini workflow
- reminders should land at the moment of likely readiness, not merely on a schedule
- proactive flows should optimize for low-friction acceptance or dismissal

## Google HEART for proactive measurement

Use HEART to measure whether proactive behavior helps or annoys:

- Happiness:
  - perceived helpfulness of reminders and follow-ups
- Engagement:
  - accepted proactive suggestions
- Adoption:
  - users enabling proactive features
- Retention:
  - users keeping proactive features on over time
- Task success:
  - completion after a proactive wakeup
  - dismiss rate
  - snooze rate
  - undo rate

Translate HEART into proactive metrics:

- suggestion acceptance rate
- snooze-to-complete rate
- dismiss-without-return rate
- auto-act rollback rate
- opt-out rate after repeated interventions
