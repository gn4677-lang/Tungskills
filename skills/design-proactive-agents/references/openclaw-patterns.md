# OpenClaw Patterns For Proactive Work

Use this file for proactive assistant patterns from `openclaw-main.zip`.

## Pattern: explicit wake triggers and run surfaces

- Confidence: `doc-confirmed`, partially `code-confirmed`
- Source area:
  - docs: `docs/automation/index.md`, `docs/automation/cron-jobs.md`, `docs/automation/hooks.md`
  - code surface: `src/cli/cron-cli.ts`, `src/cron/*`, `src/hooks/*`
- Why it matters:
  - proactive behavior needs explicit wake mechanisms
  - different session styles imply different continuity and safety tradeoffs

## Pattern: heartbeat and cron are different products

- Confidence: `doc-confirmed`
- Source area:
  - docs: `docs/automation/index.md`, `docs/automation/cron-jobs.md`
- Why it matters:
  - heartbeat is approximate, context-rich, and main-session-native
  - cron is precise, task-backed, and can run isolated or deliver to a separate surface

## Pattern: autonomy tiers

- Confidence: `doc-confirmed`
- Source area: `docs/concepts/delegate-architecture.md`
- Why it matters:
  - not all proactive behavior should have the same authority
  - draft, send, and autonomous execution need explicit separation

## Pattern: delivery can be internal, announced, or webhooked

- Confidence: `doc-confirmed`
- Source area: `docs/automation/cron-jobs.md`
- Why it matters:
  - proactive output is a product-surface decision, not just an agent decision
  - delivery policy determines how visible and interruptive the behavior is

## Pattern: standing orders are not schedulers

- Confidence: `doc-confirmed`
- Source area:
  - docs: `docs/automation/index.md`, `docs/automation/standing-orders.md`
- Why it matters:
  - persistent instructions and wake triggers are different control layers
  - a proactive system should separate "what the agent is always supposed to do" from "when it wakes up"
