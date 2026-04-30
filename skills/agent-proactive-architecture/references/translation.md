# Translation

Use this file to extract product capabilities from proactive runtime patterns.

## Capability: deliberate wakeups

- Runtime pattern:
  - explicit cron or event-based wake triggers
- Product capability:
  - the agent can follow up, review, and recover without waiting for a user prompt
- Surface shape:
  - wakeups should map to clear run surfaces such as heartbeat, cron, hook, or webhook
- Keep deterministic:
  - wake conditions
  - quiet hours
  - opt-in policy
- Make agentic:
  - what action is most useful once woken
- Failure mode if missing:
  - "proactive" behavior is really just reactive prompting

## Capability: tiered autonomy

- Runtime pattern:
  - read-only, draft, and act tiers
- Product capability:
  - the assistant can do more on the user's behalf without becoming unsafe or unpredictable
- Surface shape:
  - users should be able to tell whether the system will draft, notify, or actually act
- Keep deterministic:
  - approval boundary
  - hard blocks
- Make agentic:
  - deciding between remind, summarize, ask, or draft
- Failure mode if missing:
  - either total passivity or over-automation

## Capability: background continuity

- Runtime pattern:
  - isolated, reused, or named proactive sessions
- Product capability:
  - recurring work can build on prior runs instead of starting from zero every time
- Surface shape:
  - recurring work should have an explicit delivery surface and session style, not hidden reuse
- Keep deterministic:
  - session style for each job type
- Make agentic:
  - what prior context to carry into the next run
- Failure mode if missing:
  - recurring jobs feel stateless or noisy

## Capability: delivery-aware proactivity

- Runtime pattern:
  - proactive runs choose between silent, announced, direct-channel, or webhook delivery
- Product capability:
  - the same proactive engine can support reminders, private chores, and broadcast updates without becoming intrusive
- Surface shape:
  - delivery policy is a product decision tied to interruption cost
- Keep deterministic:
  - delivery target
  - visibility policy
- Make agentic:
  - whether a completed run deserves immediate delivery or can wait for the next operator touchpoint
- Failure mode if missing:
  - proactive behavior feels spammy, invisible, or contextually wrong

## Capability: context-timed intervention

- Runtime pattern:
  - proactive actions are triggered not only by schedule or event, but by whether the user is likely ready for them
- Product capability:
  - reminders and follow-ups arrive when they are most likely to help rather than merely satisfy the system's timer
- Surface shape:
  - the reason for acting now should be legible in the notification or follow-up itself
- Keep deterministic:
  - trigger classes
  - quiet hours
  - escalation rules
- Make agentic:
  - whether to remind now, delay, summarize later, or stay silent
- Failure mode if missing:
  - proactive behavior feels nagging, random, or interruptive

## Capability: dismissible autonomy

- Runtime pattern:
  - every proactive suggestion or action has a cheap dismiss, snooze, or undo path
- Product capability:
  - users can tolerate more proactive help because the control cost stays low
- Surface shape:
  - dismissal and rollback affordances should live next to the proactive action, not in a distant settings screen
- Keep deterministic:
  - snooze policy
  - opt-out controls
  - rollback semantics
- Make agentic:
  - what lower-intensity fallback to offer after a dismissal
- Failure mode if missing:
  - users disable proactive features entirely after one annoying or wrong intervention

## Capability: measured proactivity

- Runtime pattern:
  - proactive features are judged by acceptance, dismissal, return, and completion outcomes rather than mere send volume
- Product capability:
  - teams can tell whether proactive behavior is actually useful or just noisy
- Surface shape:
  - operator dashboards should separate delivered suggestions from accepted, snoozed, undone, and completed outcomes
- Keep deterministic:
  - metric definitions
  - attribution rules
  - opt-in state
- Make agentic:
  - almost nothing; this is measurement discipline
- Failure mode if missing:
  - teams optimize for activity instead of helpfulness
