# Wave 2 Patterns

Use this file after Wave 1 is integrated.

## `pydantic-ai-main.zip`

- Confidence:
  - `doc-confirmed`
- Repo thesis:
  - public API design, compatibility discipline, and stable interface boundaries are part of runtime quality
- Strongest runtime layers:
  - public versus private surface control
  - backward compatibility discipline
  - stable parameter and naming conventions
- Primary owner skills:
  - `agent-runtime-architecture`
  - secondary reinforcement for `agent-fallback-eval`
- Genuinely new versus earlier waves:
  - sharper language for what should remain stable even while internals evolve
  - clearer distinction between implementation detail and runtime contract
- Keep out of other skills:
  - do not let API-style guidance replace retrieval, memory, or proactive behavior design

## `llama_index-main.zip`

- Confidence:
  - `doc-confirmed` for broad retrieval taxonomy and API-layer decomposition
- Repo thesis:
  - retrieval is a composable stack of indices, retrievers, query engines, routers, and evaluation surfaces
- Strongest runtime layers:
  - retrieval taxonomy reinforcement
  - query engine vocabulary
  - retriever and router layering
- Primary owner skills:
  - `agent-retrieval-architecture`
  - secondary support for `agent-runtime-architecture`
- Genuinely new versus Wave 1:
  - broad retrieval component vocabulary that complements GraphRAG's stronger query-mode framing
- Keep out of other skills:
  - do not treat framework breadth as architecture authority outside retrieval design
