# Wave 2 Patterns

Use this file after GraphRAG and Mem0 have already shaped the retrieval answer.

## `llama_index-main.zip`

- Confidence:
  - `doc-confirmed` for broad retrieval and query taxonomy
- Keep:
  - indices, retrievers, query engines, routers, and evaluation surfaces as distinct layers
  - retriever-router composition rather than one giant retrieval path
  - ingestion and index storage as named parts of retrieval architecture
- Use it to answer:
  - how to describe retrieval stacks with clearer component boundaries
  - when retrieval needs routing between multiple retrievers or query engines
  - how indexing, retrieval, and synthesis should stay conceptually separate
- Do not overstate:
  - framework-specific component choices as universal best practice

## Boundary reminder

- `graphrag-main.zip` remains stronger for:
  - local versus global versus DRIFT query-mode distinctions
- `llama_index-main.zip` is mainly reinforcement for:
  - retrieval pipeline taxonomy
  - component vocabulary
  - router-style retrieval composition
