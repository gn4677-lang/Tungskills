---
name: agent-proactive-architecture
description: Use when the main problem is proactive agent behavior, especially agent 主動提醒, scheduled work, reminders, follow-ups, wake triggers, cron/event/state threshold signals, autonomy tiers, approval/dismiss/undo surfaces, or false-positive silence. Trigger on decisions about when to wake, remind, stay silent, ask approval, allow dismissal, or undo proactive actions. Do not use as primary for provider failure, retry, or fallback policy.
---

# Agent Proactive Architecture

Use this skill when the product should act before the user asks and still remain controlled and trustworthy.

## Operating mode

Use this as a proactive behavior design workflow, not a reminder catalog. Start by proving why the agent should wake, what it may do, and how the user can stop or correct it.

Before reading references, write down:

- the event, schedule, or state change that wakes the agent
- the user's expected benefit at that moment
- the highest-risk action the agent might take
- the available approval, snooze, dismiss, and undo surfaces

## Workflow

1. Classify the proactive behavior as one of:
   - reminder
   - follow-up
   - background draft
   - approval request
   - auto-action
   - escalation
2. Choose the autonomy tier:
   - observe only
   - draft
   - suggest
   - ask to approve
   - auto-act with undo
3. Read [references/claude-code-patterns.md](references/claude-code-patterns.md) for narrow background worker and hidden maintenance patterns.
4. Read [references/openclaw-patterns.md](references/openclaw-patterns.md) for wake triggers, heartbeats, cron, delivery, and autonomy tiers.
5. Read [references/human-ai-product-patterns.md](references/human-ai-product-patterns.md) when timing, dismissal, or proactive trust is the main issue.
6. Read [references/wave1-patterns.md](references/wave1-patterns.md) when human approval, interruption, or delegation boundaries need sharper runtime framing.
7. Read [references/wave4-patterns.md](references/wave4-patterns.md) when wake-trigger control planes, autonomy-tier decisions, approval/dismiss/undo surfaces, or false-positive silence cases matter.
8. Read [references/translation.md](references/translation.md) only after choosing the autonomy tier.
9. Return:
   - wake trigger
   - autonomy tier
   - approval boundary
   - runtime surface
   - fallback path
   - observability requirement
   - dismissal and undo path
   - proactivity metric
   - optional handoff block using [../agent-runtime-architecture/references/handoff-schema.md](../agent-runtime-architecture/references/handoff-schema.md)

## Rules

- Define the wake mechanism explicitly.
- Define what the system may do without approval.
- Separate draft, suggest, and auto-act behaviors.
- Treat background work as a traced runtime surface.
- A schedule is not enough; state the user-relevant reason for acting now.
- Prefer the lowest autonomy tier that creates user value.
- Every proactive action must specify wake source, autonomy tier, approval boundary, and dismiss/snooze/undo or rollback surface.
- Every proactive surface needs an easy dismiss, snooze, correction, or rollback path.
- Include at least one false-positive case where the agent should stay silent.
- When the agent stays silent for a false-positive risk, specify the next signal, threshold, or time window that would justify surfacing later.
- If the core complaint is outage handling or degraded response behavior, route to `agent-fallback-eval`.
