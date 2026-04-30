# Claude Code Patterns For Retrieval

Use this file for retrieval-relevant patterns confirmed from `cc-haha-main.zip`.

## Pattern: targeted read over giant preload

- Confidence: `code-confirmed`
- Source area:
  - `src/query.ts`
  - `src/constants/prompts.ts`
- Why it matters:
  - the runtime is built around assembling the current turn, not stuffing a giant static corpus into every prompt
  - search and file reads support the loop instead of replacing it

## Pattern: bounded relevant-memory selection

- Confidence: `code-confirmed`
- Source area:
  - `src/memdir/findRelevantMemories.ts`
- Why it matters:
  - retrieval should return a small number of clearly relevant items
  - bounded retrieval improves precision and controls context cost

## Pattern: tool-aware retrieval suppression

- Confidence: `code-confirmed`
- Source area:
  - `src/memdir/findRelevantMemories.ts`
- Why it matters:
  - retrieval logic can avoid surfacing tool documentation that the agent is already actively using
  - this reduces noise and keeps recall focused on warnings, gotchas, and genuinely helpful context

## Pattern: retrieval is downstream of context pressure controls

- Confidence: `code-confirmed`
- Source area:
  - `src/query.ts`
  - `src/memdir/memdir.ts`
- Why it matters:
  - compaction, memory entrypoint limits, and token budgeting exist before brute-force retrieval
  - this is evidence against making RAG the primary solution to poor context engineering

## Pattern: memory index over full-file preload

- Confidence: `code-confirmed`
- Source area:
  - `src/memdir/memdir.ts`
- Why it matters:
  - an indexed memory entrypoint with per-file topic memories is a retrieval structure, not a giant always-loaded notebook
  - this supports selective recall better than loading every memory file into every turn

## Pattern: freshness is rendered for the model, not left as raw timestamps

- Confidence: `code-confirmed`
- Source area:
  - `src/memdir/memoryAge.ts`
  - `src/memdir/memoryScan.ts`
- Why it matters:
  - memory scanning tracks modification time, and freshness helpers convert it into model-friendly age strings like `today`, `yesterday`, and `N days ago`
  - stale memories can carry an explicit warning that they are point-in-time observations and may need revalidation
