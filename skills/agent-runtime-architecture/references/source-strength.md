# Source Strength

Use this file when you need to know how hard a statement can be made.

## Claude Code

Current confidence: stronger for core runtime patterns, weaker for repo-wide claims.

Primary source for this round:
- `C:\Users\User\Desktop\cc-haha-main.zip`

Code-confirmed from targeted source reads inside that zip:
- `src/query.ts`
  - main loop orchestration, context pressure handling, compact/collapse hooks
- `src/constants/prompts.ts`
  - explicit static/dynamic system prompt boundary
- `src/services/api/withRetry.ts`
  - retry, 529 handling, persistent retry, fallback trigger points
- `src/memdir/memdir.ts`
  - typed memory prompt shaping, entrypoint constraints, and what not to store guidance
- `src/memdir/paths.ts`
  - auto-memory gating, trusted path overrides, and KAIROS daily-log path model
- `src/memdir/memoryAge.ts`
  - natural-language freshness rendering (`today`, `yesterday`, `N days ago`) and stale-memory warning text
- `src/memdir/findRelevantMemories.ts`
  - bounded relevant-memory selection with tool-aware filtering
- `src/services/SessionMemory/sessionMemory.ts`
  - background session memory extraction, initialization threshold, and update thresholds
- `src/services/SessionMemory/sessionMemoryUtils.ts`
  - explicit token/tool-call thresholds and stale-extraction waiting rules
- `src/services/compact/sessionMemoryCompact.ts`
  - session-memory-aware compaction with preserved-boundary logic for tool/API invariants
- `src/services/extractMemories/extractMemories.ts`
  - durable memory extraction in a forked/background flow with narrow tool permissions
- `src/services/autoDream/autoDream.ts`
  - background consolidation with time/session gates
- `src/services/autoDream/consolidationLock.ts`
  - consolidation lock, stale-holder recovery, and rollback behavior
- `src/services/autoDream/consolidationPrompt.ts`
  - orient/gather/consolidate/prune workflow and absolute-date normalization guidance
- `src/services/teamMemorySync/index.ts`
  - server-backed team memory sync, pull/push semantics, ETag conflict handling, and non-propagating deletions
- `src/services/teamMemorySync/watcher.ts`
  - initial pull plus file-watcher-driven sync and suppression behavior
- `src/tools/AgentTool/agentMemory.ts`
  - agent-specific persistent memory scopes (`user`, `project`, `local`)
- `src/tools/AgentTool/agentMemorySnapshot.ts`
  - project snapshots for agent-memory bootstrap and replacement flow

Use second-hand material only as navigation:
- desktop Claude Code tutorial notes
- any video/script analysis

Do not overstate:
- exact counts of tools, hooks, or event types unless re-counted from source
- any feature not checked against source or official docs
- KAIROS nightly dream scheduling details unless the relevant scheduler path is checked, even though daily-log prompting and `/dream` hooks are present in source

## OpenClaw

Current confidence: mixed, but improving.

Doc-confirmed from local Desktop `openclaw-main.zip` docs:
- session routing and isolation model
- cron and proactive job model
- typing indicators and presence concepts
- model failover and retry strategy
- skill loading and precedence

Code-confirmed from targeted source scan inside the same zip:
- `src/config/sessions.ts`
  - session subsystem surface exists and is decomposed into store, transcript, paths, reset, disk budget
- `src/infra/retry-policy.ts`
  - provider-aware retry helpers and per-request retry semantics exist
- `src/agents/pi-embedded-runner/run/failover-policy.ts`
  - failover is an explicit decision system, not just generic retries
- `src/infra/system-presence.ts` and `src/gateway/server/presence-events.ts`
  - presence is an explicit runtime subsystem with TTL and broadcast behavior
- `src/auto-reply/reply/typing-policy.ts` and `src/channels/typing.ts`
  - typing has policy resolution, keepalive, and TTL safety

Do not overstate:
- any behavior not yet checked against source
- full-repo guarantees; this is targeted architectural verification, not a total audit

## Wave 1 repo intake

Use these as the next high-value sources after Claude Code and OpenClaw.

### `openai-agents-python-main.zip`

Current confidence: `doc-confirmed` for orchestration, tracing, sessions, guardrails, and human-in-the-loop surfaces.

Promote confidently for:
- `handoffs` versus `agents as tools` as explicit orchestration choices
- built-in tracing with traces, spans, workflow naming, and grouping
- sessions as a runtime surface
- guardrails and approval checkpoints around a run

Do not overstate:
- deep memory quality
- compaction strategy
- long-term consolidation behavior

### `langfuse-main.zip`

Current confidence: `doc-confirmed` for observability, traces, prompt management, evals, datasets, and feedback loops.

Promote confidently for:
- traces and spans as operator-facing runtime evidence
- session grouping for debugging
- eval and dataset loops tied back to runtime behavior
- prompt iteration as a measurable operational practice

Do not overstate:
- request-path failover semantics unless checked from source
- agent-memory architecture

### `graphrag-main.zip`

Current confidence: `doc-confirmed` for indexing architecture and query-mode distinctions.

Promote confidently for:
- retrieval as an indexed query engine
- local search, global search, and DRIFT search as distinct modes
- indexing workflow as part of retrieval architecture

Do not overstate:
- framework-specific operational claims not verified from source

### `letta-main.zip`

Current confidence: `doc-confirmed` for long-lived stateful-agent and advanced-memory framing.

Promote confidently for:
- stateful agent posture
- long-lived memory design language
- continual learning or self-improving memory framing

Do not overstate:
- gateway routing
- channel ownership
- production failover

### `mem0-main.zip`

Current confidence: `doc-confirmed` for memory CRUD, search, history, feedback, and organizational memory surfaces.

Promote confidently for:
- inspectable and correctable memory product surfaces
- search over memory scopes
- project and organization memory boundaries

Do not overstate:
- complete runtime architecture beyond memory surfaces

## Deferred or low-authority sources

- `pydantic-ai-main.zip`
  - moved into Wave 2 as a selective source for contract discipline; not a primary runtime philosophy source
- `llama_index-main.zip`
  - moved into Wave 2 as a selective source for retrieval taxonomy reinforcement
- `langgraph-main.zip`
  - current local bundle is low authority because the bundled examples are archival
- `smolagents-main.zip`
  - supplementary only unless a unique runtime pattern is verified
- `dify-main.zip`
  - platform inspiration, not core runtime source-of-truth
- `claw-code-main.zip`
  - reject by default unless it contributes a distinct pattern not already covered better elsewhere

## Wave 2 repo intake

Use these only as selective reinforcements after Wave 1 is already integrated.

### `pydantic-ai-main.zip`

Current confidence: `doc-confirmed` for public API design, compatibility policy, and stable interface discipline.

Promote confidently for:
- separating stable public interfaces from internal implementation details
- backward compatibility habits such as aliases and keyword-only evolution
- minimizing accidental public surface expansion

Do not overstate:
- provider failover
- memory architecture
- retrieval philosophy

### `llama_index-main.zip`

Current confidence: `doc-confirmed` for broad retrieval taxonomy and API-layer decomposition.

Promote confidently for:
- indices, retrievers, query engines, routers, and evaluation surfaces as distinct retrieval layers
- retrieval pipeline vocabulary and composition
- ingestion and storage as named parts of retrieval architecture

Do not overstate:
- broad framework coverage as proof that every component pattern should exist in a smaller runtime
- framework-specific class choices as universal best practice

### `smolagents-main.zip`

Current confidence: `doc-confirmed` for run inspection and telemetry guidance, but only as a selective source.

Promote confidently for:
- why multi-step agent runs need inspectable traces instead of console logs alone
- OpenTelemetry-based run inspection as an operator-facing surface
- post-launch debugging and monitoring for agent runs

Do not overstate:
- general runtime architecture
- orchestration philosophy
- user-facing channel or onboarding design
