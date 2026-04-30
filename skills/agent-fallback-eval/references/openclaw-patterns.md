# OpenClaw Patterns For Fallback And Eval

Use this file for long-lived assistant reliability patterns from `openclaw-main.zip`.

## Pattern: retry per request, not per whole workflow

- Confidence: `doc-confirmed`, partially `code-confirmed`
- Source area:
  - docs: `docs/concepts/retry.md`
  - code surface: `src/infra/retry-policy.ts`
- Why it matters:
  - retries should preserve ordering and avoid duplicating completed work

## Pattern: auth profile rotation before model fallback

- Confidence: `doc-confirmed`, partially `code-confirmed`
- Source area:
  - docs: `docs/concepts/model-failover.md`
  - code surface: `src/agents/pi-embedded-runner/run/failover-policy.ts`
- Why it matters:
  - fallback should be staged, not a single panic switch
  - auth, provider, and model are different failure layers and should not collapse into one rule

## Pattern: session stickiness and cooldowns shape failover quality

- Confidence: `doc-confirmed`
- Source area: `docs/concepts/model-failover.md`
- Why it matters:
  - keeping one profile warm within a session improves cache locality and stability
  - cooldowns, disabled states, and overloaded fast-switch rules prevent retry storms and credential thrash

## Pattern: operational visibility for background systems

- Confidence: `doc-confirmed`, partially `code-confirmed`
- Source area:
  - docs: `docs/concepts/presence.md`, `docs/automation/cron-jobs.md`
  - code surface: `src/infra/system-presence.ts`, `src/gateway/server/presence-events.ts`
- Why it matters:
  - long-lived agents need operator signals, run traces, and session visibility

## Pattern: failure class should determine escalation path

- Confidence: `doc-confirmed`
- Source area: `docs/concepts/model-failover.md`
- Why it matters:
  - billing, auth, overloaded, timeout, and malformed-request failures should not all trigger the same next action
  - precise error classification produces safer failover and better eval signals
