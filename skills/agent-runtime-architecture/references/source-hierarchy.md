# Source Hierarchy

Use this file when two sources seem to disagree or when a skill needs a primary authority.

This is a tie-break map, not a command to copy one repo literally.

## Primary authorities by topic

- memory quality, compaction, consolidation, and long-loop reasoning
  - primary: `cc-haha-main`
  - secondary: `letta-main`, `mem0-main`

- session ownership, channel routing, presence, and production delivery surfaces
  - primary: `openclaw-main`
  - secondary: none unless a later source is verified more strongly

- retrieval query modes and indexed search architecture
  - primary: `graphrag-main`
  - secondary: `llama_index-main`

- retrieval stack vocabulary such as indices, retrievers, query engines, and routers
  - primary: `llama_index-main`
  - secondary: `graphrag-main`

- observability, eval loops, datasets, and prompt iteration
  - primary: `langfuse-main`
  - secondary: `openai-agents-python-main`

- orchestration choices, guardrails, approval checkpoints, and run tracing surfaces
  - primary: `openai-agents-python-main`
  - secondary: `openclaw-main`

- public interface discipline and compatibility language
  - primary: `pydantic-ai-main`

- long-lived memory product surfaces, history, feedback, and scoped memory CRUD
  - primary: `mem0-main`
  - secondary: `letta-main`

- product-side human-AI trust, expectation setting, and correction design
  - primary: Microsoft HAI guidance
  - secondary: Baymard for friction heuristics

- product-side success measurement
  - primary: Google HEART
  - secondary: Langfuse instrumentation

- trigger timing and low-friction next-step design
  - primary: Fogg Behavior Model
  - secondary: Microsoft HAI guidance

## Conflict rule

When sources conflict:

1. prefer `code-confirmed` over `doc-confirmed`
2. prefer the source that is primary for that topic
3. prefer the narrower source over the broader platform source
4. prefer runtime sources for runtime decisions and product-design sources for trust or UX decisions

## Guardrails

- Do not let memory-product sources override session-routing sources.
- Do not let broad framework sources force unnecessary component complexity.
- Do not let product-design frameworks override safety or runtime constraints.
