# OpenClaw Patterns For Context

Use this file for long-lived assistant context patterns from `openclaw-main.zip`.

## Pattern: session routing by surface and scope

- Confidence: `doc-confirmed`, partially `code-confirmed`
- Source area:
  - docs: `docs/concepts/session.md`, `docs/reference/session-management-compaction.md`
  - code surface: `src/config/sessions.ts`
- Why it matters:
  - DMs, groups, rooms, cron jobs, and hooks should not share one undifferentiated context bucket
  - routing is a first-class context decision

## Pattern: DM isolation must be explicit in multi-user setups

- Confidence: `doc-confirmed`
- Source area: `docs/concepts/session.md`
- Why it matters:
  - a shared main DM session is acceptable for one operator but unsafe for multi-user deployments
  - context isolation should come from config, not from hoping users stay separated

## Pattern: identity linking across channels

- Confidence: `doc-confirmed`
- Source area: `docs/concepts/session.md`
- Why it matters:
  - the same person may appear through multiple surfaces
  - identity continuity should be deterministic, not inferred from free text

## Pattern: gateway-owned sessions and transcripts

- Confidence: `doc-confirmed`, partially `code-confirmed`
- Source area:
  - docs: `docs/concepts/session.md`, `docs/reference/session-management-compaction.md`
  - code surface: `src/config/sessions.ts`
- Why it matters:
  - UI is not the source of truth for context
  - persistent session and transcript layers enable long-lived assistant behavior

## Pattern: session lifecycle maintenance

- Confidence: `doc-confirmed`
- Source area: `docs/reference/session-management-compaction.md`
- Why it matters:
  - pruning, reset, cleanup, and compaction are lifecycle controls
  - context quality depends on explicit maintenance, not infinite accumulation

## Pattern: session reset policy is part of context design

- Confidence: `doc-confirmed`
- Source area:
  - docs: `docs/concepts/session.md`, `docs/reference/session-management-compaction.md`
- Why it matters:
  - daily reset, idle reset, manual reset, and thread forking all change what continuity means
  - a context design is incomplete if it ignores when a session should intentionally stop inheriting history
