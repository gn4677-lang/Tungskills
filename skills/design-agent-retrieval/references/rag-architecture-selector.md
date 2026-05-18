# RAG Architecture Selector

Use this reference after the main skill has named the question family and truth owner. Do not start here.

## Select By Question Family

| Question family | Prefer | Add only if needed | Avoid |
| --- | --- | --- | --- |
| `exact_state` | deterministic state read | freshness check | vector or graph search |
| `source_span` | metadata/keyword/full-doc region read | vector or hybrid candidate search | answer without exact span |
| `semantic_recall` | metadata + vector or hybrid | query rewrite, rerank | unbounded corpus search |
| `relation` | graph-local or relation-aware hybrid | path evidence, source-span verifier | graph edge as truth |
| `global_synthesis` | graph-global, hierarchical summaries, full-doc sampling | map-reduce, community reports | local chunks only |
| `contradiction` | retrieve competing evidence | relevance grading, review state | single-source answer |
| `freshness` | time-aware source routing | live lookup or recency filters | stale index as current truth |

## Agentic Step Selector

Use agentic behavior to handle failure modes, not to make retrieval look advanced.

| Agentic step | Use when | Required guard |
| --- | --- | --- |
| `retrieval_needed` | many requests are greetings, deterministic state reads, or simple follow-ups | trace when retrieval was skipped |
| `query_rewrite` | user wording is vague, multilingual, colloquial, or uses aliases | preserve original intent and log rewritten query |
| `subquestions` | the answer needs multiple evidence families or multi-hop support | cap subquestions and tie each to a source class |
| `relevance_grade` | bad chunks frequently pass through | grade retrieved evidence, not final answer only |
| `corrective_retry` | low-quality retrieval can be fixed cheaply | retry budget and fallback policy |
| `evidence_verify` | claims must be source-backed | claim-to-span or claim-to-path mapping |

## Architecture Notes

- GraphRAG-style local search is useful for entity, relation, and path questions.
- GraphRAG-style global search is useful for corpus-wide themes and dataset-level synthesis.
- DRIFT/community-informed search is useful when local search needs broader context before returning to specific evidence.
- LightRAG-style graph + vector retrieval is useful when flat chunks lose relationship context and incremental updates matter.
- RAPTOR-style hierarchical retrieval is useful when long documents need both local detail and higher-level summaries.
- Adaptive-RAG-style routing is useful when some queries need no retrieval, some need one pass, and some need iterative retrieval.
- Corrective RAG is useful when the main risk is bad retrieved evidence.
- Self-reflective RAG is useful when the main risk is unsupported answer claims, but reflection is a verifier, not product truth.

## Compiler Or Extraction Systems

For compilers, extraction pipelines, teaching-material systems, or domain knowledge builders:

- retrieval proposes candidate evidence
- source spans carry provenance
- graph edges or summaries are hypotheses until source-backed
- deterministic code validates schema, source region, span existence, ownership, and review state
- unsupported or partial evidence becomes reviewable state, not silent truth

## Minimum Eval Pack

Every non-trivial retrieval design needs:

- one source-selection pass case
- one ranking or rerank case
- one grounding/span case
- one fallback/full-doc case
- one negative or refusal case
- one final-answer case that proves retrieval quality and answer quality are not the same claim

## Source Basis

- Microsoft GraphRAG query modes: https://microsoft.github.io/graphrag/query/overview/
- LightRAG paper: https://arxiv.org/abs/2410.05779
- GraphRAG survey: https://arxiv.org/abs/2501.00309
- LangChain RAG and agentic RAG tradeoffs: https://docs.langchain.com/oss/python/langchain/rag
- LlamaIndex agentic strategies: https://docs.llamaindex.ai/en/stable/optimizing/agentic_strategies/agentic_strategies/
- Self-RAG: https://arxiv.org/abs/2310.11511
- Corrective RAG: https://arxiv.org/abs/2401.15884
- RAPTOR: https://arxiv.org/abs/2401.18059
