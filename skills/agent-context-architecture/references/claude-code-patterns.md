# Claude Code Patterns For Context

Use this file for code-confirmed context-engineering patterns from `cc-haha-main.zip`.

## Pattern: explicit static vs dynamic context

- Confidence: `code-confirmed`
- Source area: `src/constants/prompts.ts`
- Why it matters:
  - the runtime distinguishes reusable prompt prefix from dynamic session/user content
  - context architecture starts with assembly boundaries, not just token trimming

## Pattern: layered memory, not one blob

- Confidence: `code-confirmed`
- Source area:
  - `src/memdir/memdir.ts`
  - `src/memdir/findRelevantMemories.ts`
  - `src/services/SessionMemory/sessionMemory.ts`
- Why it matters:
  - durable memory, relevant-memory retrieval, and session memory are separate concerns
  - this supports both continuity and bounded context size

## Pattern: typed memory discipline

- Confidence: `code-confirmed`
- Source area:
  - `src/memdir/memdir.ts`
- Why it matters:
  - the memory system distinguishes what should be saved, how it should be indexed, and what should not be stored in memory at all
  - this prevents memory from turning into an unbounded duplicate of code, tasks, or current-turn plans

## Pattern: compaction is part of normal runtime flow

- Confidence: `code-confirmed`
- Source area:
  - `src/query.ts`
  - `src/services/compact/*` references visible from `query.ts`
- Why it matters:
  - long-running sessions need preplanned compaction hooks
  - context quality degrades if compression is treated only as emergency recovery

## Pattern: background memory maintenance

- Confidence: `code-confirmed`
- Source area:
  - `src/services/SessionMemory/sessionMemory.ts`
  - `src/services/extractMemories/extractMemories.ts`
- Why it matters:
  - memory maintenance can run beside the main loop with narrower responsibilities
  - context quality improves when summarization and memory extraction are not forced into the foreground turn

## Pattern: thresholded session memory updates

- Confidence: `code-confirmed`
- Source area:
  - `src/services/SessionMemory/sessionMemory.ts`
  - `src/services/SessionMemory/sessionMemoryUtils.ts`
- Why it matters:
  - session notes are not rewritten every turn
  - initialization and update thresholds reduce noise and keep session memory tied to meaningful growth

## Pattern: session-memory-aware compaction

- Confidence: `code-confirmed`
- Source area:
  - `src/services/compact/sessionMemoryCompact.ts`
- Why it matters:
  - compaction can reuse a maintained session notebook rather than producing a one-shot summary from scratch
  - preserved-message boundaries must respect tool_use/tool_result pairs and message integrity constraints

## Pattern: periodic memory consolidation

- Confidence: `code-confirmed`
- Source area:
  - `src/services/autoDream/autoDream.ts`
  - `src/services/autoDream/consolidationPrompt.ts`
  - `src/services/autoDream/consolidationLock.ts`
- Why it matters:
  - memory quality can improve through periodic consolidation, not only per-turn extraction
  - consolidation is gated, locked, and rollback-aware, so it behaves like a real runtime subsystem

## Pattern: team memory is a synced subsystem, not just a shared folder

- Confidence: `code-confirmed`
- Source area:
  - `src/memdir/teamMemPaths.ts`
  - `src/services/teamMemorySync/index.ts`
  - `src/services/teamMemorySync/watcher.ts`
- Why it matters:
  - shared memory has explicit sync semantics, path-safety checks, and watcher behavior
  - server-wins pull, delta push, and non-propagating deletion are deliberate collaboration rules, not incidental file behavior

## Pattern: agent memory is scoped by role

- Confidence: `code-confirmed`
- Source area:
  - `src/tools/AgentTool/agentMemory.ts`
  - `src/tools/AgentTool/agentMemorySnapshot.ts`
- Why it matters:
  - persistent memory can be separated by agent type and scope instead of forcing one blended memory surface for all subagents
  - snapshot bootstrapping gives a controlled way to seed new agent instances without making all memory globally shared

## Pattern: long-lived sessions can switch to append-only memory capture

- Confidence: `code-confirmed`
- Source area:
  - `src/memdir/memdir.ts`
  - `src/memdir/paths.ts`
  - `src/skills/bundled/index.ts`
- Why it matters:
  - perpetual assistant sessions need a different write pattern than constantly mutating `MEMORY.md`
  - append-only daily logs plus later distillation reduce write conflicts and preserve chronology in long-lived runs

## Pattern: memory refresh is explicit, not hot-reloaded

- Confidence: `code-confirmed`
- Source area:
  - `src/context.ts`
  - `src/utils/claudemd.ts`
  - `src/commands/clear/caches.ts`
- Why it matters:
  - memory and context are memoized across a session and deliberately invalidated at known boundaries
  - predictable cache clearing avoids mid-turn instruction drift and makes runtime behavior more stable
