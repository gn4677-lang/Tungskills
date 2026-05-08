# Wave 1 Patterns

Use this file for the first serious expansion beyond `cc-haha-main` and `openclaw-main`.

## Accepted sources

### `openai-agents-python-main.zip`

- Confidence:
  - `doc-confirmed`
- Repo thesis:
  - multi-agent orchestration, tracing, sessions, guardrails, and human approval as first-class runtime surfaces
- Strongest runtime layers:
  - orchestration choices
  - tracing-first execution
  - session persistence
  - guarded or interruptible runs
- Primary owner skills:
  - `route-agent-runtime-design`
  - `design-agent-fallbacks`
  - selective reinforcement for `design-proactive-agents`
- Genuinely new versus anchor sources:
  - explicit `handoffs` versus `agents as tools`
  - traces and spans as a designed runtime substrate
  - guardrails and human-in-the-loop as run-control surfaces
- Keep out of other skills:
  - do not let it replace Claude Code on deep memory, compaction, or consolidation

### `langfuse-main.zip`

- Confidence:
  - `doc-confirmed`
- Repo thesis:
  - observability, prompt management, datasets, and evals are part of the agent runtime, not separate tooling
- Strongest runtime layers:
  - trace/session grouping
  - eval datasets
  - feedback and prompt iteration loops
- Primary owner skills:
  - `design-agent-fallbacks`
  - secondary support for `route-agent-runtime-design`
- Genuinely new versus anchor sources:
  - continuous eval loop vocabulary is much stronger here than in the anchor repos
- Keep out of other skills:
  - do not let generic observability language leak into context or retrieval ownership

### `graphrag-main.zip`

- Confidence:
  - `doc-confirmed`
- Repo thesis:
  - retrieval is an indexing and query architecture over transformed knowledge, not just vector lookup
- Strongest runtime layers:
  - indexing pipeline framing
  - local search
  - global search
  - DRIFT search
- Primary owner skills:
  - `design-agent-retrieval`
- Genuinely new versus anchor sources:
  - gives retrieval a real query-mode vocabulary that the current skill set lacked

### `letta-main.zip`

- Confidence:
  - `doc-confirmed`
- Repo thesis:
  - stateful agents with advanced memory that can learn and improve over time
- Strongest runtime layers:
  - persistent agent memory framing
  - stateful API posture
  - long-lived agent vocabulary
- Primary owner skills:
  - `design-agent-context`
  - `design-agent-durability`
- Genuinely new versus anchor sources:
  - stronger public framing for long-lived stateful agents than the anchor repos expose directly
- Keep out of other skills:
  - not a primary authority for gateway routing or channel/session ownership

### `mem0-main.zip`

- Confidence:
  - `doc-confirmed`
- Repo thesis:
  - memory should behave like a product layer with search, CRUD, history, feedback, and organizational scopes
- Strongest runtime layers:
  - memory search and feedback
  - memory history
  - org and project memory surfaces
- Primary owner skills:
  - `design-agent-context`
  - `design-agent-retrieval`
  - `design-agent-durability`
- Genuinely new versus anchor sources:
  - memory as an inspectable and operable product surface, not just a hidden file or prompt trick
- Keep out of other skills:
  - do not collapse the whole architecture into “just add a memory API”

## Deferred sources

### `pydantic-ai-main.zip`

- Confidence:
  - `doc-confirmed`
- Keep for Wave 2:
  - strongest for API contract discipline and public interface hygiene

### `llama_index-main.zip`

- Confidence:
  - mixed until targeted docs are pulled
- Keep for Wave 2:
  - likely useful for retrieval taxonomy reinforcement after GraphRAG

## Low-authority or optional sources

- `langgraph-main.zip`
  - treat current local bundle as low authority because the bundled examples are archival and point elsewhere
- `smolagents-main.zip`
  - useful only as lightweight ergonomics reinforcement unless a unique runtime pattern is verified
- `dify-main.zip`
  - strong product/platform surface, weak runtime source-of-truth for this skill set
- `claw-code-main.zip`
  - reject by default unless it shows distinct runtime patterns not already covered by the anchors
