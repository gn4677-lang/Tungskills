# Wave 2 Patterns

Use this file only for post-launch instrumentation and operator cues.

## `langfuse-main.zip`

- Confidence:
  - `doc-confirmed`
- Keep:
  - inspect and debug complex logs and user sessions
  - prompt iteration tied directly to traced failures
  - prompt management with strong caching so iteration does not add latency to the product surface
  - manual labeling and feedback collection as part of improvement loops
- Use it to answer:
  - what instrumentation should exist after launch so teams can reduce friction instead of guessing
  - how operators move from a bad run to a concrete prompt or configuration fix quickly
- Do not use it to answer:
  - retry policy
  - provider failover
  - broad analytics strategy unrelated to agent interaction quality

## `smolagents-main.zip`

- Confidence:
  - `doc-confirmed`
- Keep:
  - multi-step runs are hard to inspect from console logs alone
  - instrumentation is necessary in production for later inspection and monitoring
  - OpenTelemetry-based run inspection as a practical operator surface
- Use it to answer:
  - why multi-step agents need inspectable run replays instead of raw console output
  - what operator-facing run surfaces reduce ambiguity when users report "it felt stuck" or "it went weird"
- Do not use it to answer:
  - general orchestration philosophy
  - code-vs-tools agent selection as the main UX story

## Rejected for this skill

### `dify-main.zip`

- Status:
  - `marketing-only / discard` for this specific skill target
- Reason:
  - useful as a product platform reference, but too broad and platform-shaped to serve as a clean source for low-friction runtime interaction patterns
