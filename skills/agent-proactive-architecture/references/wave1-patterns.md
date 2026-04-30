# Wave 1 Patterns

Use this file sparingly. OpenClaw remains the primary source for wake surfaces and delivery policy.

## `openai-agents-python-main.zip`

- Confidence:
  - `doc-confirmed`
- Keep:
  - human-in-the-loop as a runtime control surface
  - orchestration choices that affect delegation and interruption boundaries
  - session-aware runs that can be inspected and resumed
- Use it to answer:
  - when proactive flows should pause for approval
  - how handoffs and agents-as-tools alter the control boundary
- Do not use it to answer:
  - cron versus heartbeat wake design
  - channel-native delivery behavior
  - presence or typing policy
