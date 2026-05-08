# OpenClaw Patterns For Frictionless Design

Use this file for channel-first assistant experience patterns from `openclaw-main.zip`.

## Pattern: explicit onboarding path

- Confidence: `doc-confirmed`
- Source area:
  - `README.md`
  - onboarding docs referenced there
- Why it matters:
  - friction drops when setup has a preferred guided path
  - first-run experience is a runtime concern, not only docs

## Pattern: typing and presence are confidence cues

- Confidence: `doc-confirmed`, partially `code-confirmed`
- Source area:
  - docs: `docs/concepts/typing-indicators.md`, `docs/concepts/presence.md`
  - code surface: `src/auto-reply/reply/typing-policy.ts`, `src/channels/typing.ts`, `src/infra/system-presence.ts`
- Why it matters:
  - visible life signs reduce uncertainty while the agent thinks or waits
  - confidence cues should be policy-driven, not improvised per channel

## Pattern: channel-first assistant design

- Confidence: `doc-confirmed`
- Source area:
  - `README.md`
  - `docs/concepts/architecture.md`
  - `docs/channels/channel-routing.md`
- Why it matters:
  - the assistant should meet users in the surfaces they already occupy
  - unnecessary surface switching creates avoidable friction

## Pattern: typing policy should depend on what the user can actually perceive

- Confidence: `doc-confirmed`
- Source area: `docs/concepts/typing-indicators.md`
- Why it matters:
  - instant, thinking, and message-triggered typing are different UX promises
  - channel life signs should match real progress, not leak silent housekeeping or fake activity

## Pattern: delivery routing should stay deterministic

- Confidence: `doc-confirmed`
- Source area: `docs/channels/channel-routing.md`
- Why it matters:
  - users should not wonder where a reply will appear
  - routing belongs to host configuration, not model improvisation
