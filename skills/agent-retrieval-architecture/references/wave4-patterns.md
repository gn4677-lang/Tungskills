# Wave 4 Patterns

Use this file when retrieval design needs query-mode selection, source-class routing, deterministic pipeline boundaries, retrieval evaluation, or full-document fallback.

## Sources promoted

- LlamaIndex: indices, retrievers, query engines, query-engine tools, and router retrievers.
  - Source: https://docs.llamaindex.ai/en/stable/examples/retrievers/router_retriever/
- Haystack: components, pipelines, document stores, conditional routers, and agents inside retrieval pipelines.
  - Source: https://docs.haystack.deepset.ai/docs/pipelines
- Microsoft GraphRAG: local, global, and DRIFT search modes for graph-grounded corpus retrieval.
  - Source: https://microsoft.github.io/graphrag/
- Ragas: retrieval, RAG, and agent/tool-use metrics.
  - Source: https://docs.ragas.io/en/stable/concepts/metrics/
- TruLens: feedback functions for groundedness, relevance, moderation, and custom metrics.
  - Source: https://www.trulens.org/component_guides/evaluation/
- Langfuse and Arize Phoenix: trace-backed retrieval and answer evaluation.
  - Sources: https://langfuse.com/docs/observability/overview and https://arize.com/docs/phoenix/evaluation/llm-evals/evaluator-traces

## Query-mode selector

| Question shape | Prefer | Why | Do not do |
| --- | --- | --- | --- |
| Known key or current operational state | deterministic state read | exact, cheap, auditable | vector search over state |
| Known corpus with metadata scope | metadata or keyword filter before semantic ranking | avoids cross-scope recall | unfiltered embedding search |
| Ambiguous semantic recall | scoped retriever | handles language variance | skip permission and freshness filters |
| Source-grounded answer | retriever plus answer synthesis | grounds answer in source set | answer without evidence trace |
| Multiple corpora with different semantics | source-class router | chooses retriever/query engine by source class | one global index for everything |
| Corpus-level synthesis | graph or multi-hop query mode | captures global themes and entity links | use GraphRAG for small exact lookups |
| Failed or uncertain retrieval | full-document fallback | validates source manually | keep retrying the same weak query |

## Source-class router checklist

Define these before choosing vector search or RAG:

- source class: deterministic state, session memory, durable memory, docs, tickets, code, external web, logs
- permission boundary
- freshness requirement
- citation or quote requirement
- answer format
- ranking signal
- fallback document-read trigger
- refusal or clarification condition

Use a router when source classes differ in semantics, permissions, freshness, or answer format.

## Pipeline-before-agent rule

Prefer deterministic retrieval pipelines before open-ended agent search when the flow is stable:

- parse or classify query
- enforce scope and permission filters
- retrieve/rank candidates
- synthesize answer with citations
- fall back to document read when confidence or coverage is insufficient

Use an agentic retrieval loop only when the query requires tool choice, iterative decomposition, or multi-source investigation that cannot be expressed as a stable pipeline.

## Retrieval eval split

Evaluate these separately:

- source selection: did the system choose the right corpus or source class?
- retrieval ranking: were relevant items present near the top?
- answer grounding: did the answer use retrieved evidence faithfully?
- citation/freshness: did the answer expose source and recency correctly?
- fallback behavior: did it read the full document, refuse, or ask for scope when retrieval was insufficient?

Do not treat a good final answer as proof that retrieval is healthy. Do not treat high retrieval score as proof that synthesis is grounded.

## Full-document fallback triggers

Read the full document or source artifact when:

- the answer requires precise wording, quote, legal/policy language, or line-level evidence
- retrieved chunks disagree
- top results are stale, low-confidence, or missing required sections
- the user asks to inspect a specific file, page, doc, or artifact
- a negative case says retrieval should refuse or ask for source scope

## Regression cases

- Exact state versus RAG: current account tier is in deterministic state; vector search returns stale docs.
- Multi-corpus router: support docs, code docs, and policy docs all contain "rate limit" but require different answer formats.
- Fallback document read: retrieved chunks mention a policy but omit the exception clause needed for the answer.
