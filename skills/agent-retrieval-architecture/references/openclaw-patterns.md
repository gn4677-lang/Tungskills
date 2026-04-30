# OpenClaw Patterns For Retrieval

Use this file for retrieval-adjacent patterns from `openclaw-main.zip`.

## Pattern: scoped retrieval surfaces

- Confidence: `doc-confirmed`, partially `code-confirmed`
- Source area:
  - docs: `docs/concepts/session.md`, `docs/reference/session-management-compaction.md`
  - code surface: `src/config/sessions.ts`
- Why it matters:
  - retrieval candidates should be scoped by session, channel, or run type instead of one global pool

## Pattern: skill and resource precedence

- Confidence: `doc-confirmed`
- Source area: `docs/tools/skills.md`
- Why it matters:
  - not all knowledge sources are equal
  - precedence and visibility rules are a retrieval architecture concern, not only a packaging concern

## Pattern: long-lived transcript layers as retrieval sources

- Confidence: `doc-confirmed`
- Source area: `docs/reference/session-management-compaction.md`
- Why it matters:
  - summaries, transcripts, and session metadata can each act as different retrieval classes
  - retrieval quality improves when sources are typed and lifecycle-managed
