---
name: design-agent-retrieval
description: "Use when designing or fixing search, source lookup, RAG, GraphRAG, LightRAG, agentic RAG, retrieval routing, source attribution, evidence spans, query rewrite, multi-hop retrieval, corpus routing, graph retrieval, full-document fallback, or answer quality caused by bad source selection."
---

# Design Agent Retrieval

## Action Protocol

Use this as a retrieval architecture selector. Start from the user-visible failure, separate truth from evidence, choose the smallest retrieval mode that can support the answer, then return an implementable contract.

Use this skill when search is weak, RAG is overused, retrieved context is being treated as truth, or an agent needs graph/agentic retrieval without turning retrieval into a black box.

## Operating Mode

Retrieval design workflow, not a RAG glossary.

Positive default: get the needed truth from the simplest reliable source path, add graph or agentic retrieval only when the question shape requires it, and verify source selection separately from final answer quality.

Before reading references, write down:

- the question the product must answer
- the source classes and permissions
- the truth owner: deterministic state, source document, compiled state, human review, or model judgment
- the cost of wrong, stale, missing, or over-broad retrieval

## Default Output

```text
User-visible failure: ...
Question family: exact_state | source_span | semantic_recall | relation | global_synthesis | contradiction | freshness | unknown
Truth owner: deterministic_state | source_document | compiled_state | human_review | model_judgment | hybrid
Deterministic state path: ...
Retrieval sources: ...
Retrieval mode: none | metadata | keyword | vector | hybrid | graph_local | graph_global | hierarchical | full_doc | agentic_loop
Agentic step: none | retrieval_needed | query_rewrite | subquestions | relevance_grade | corrective_retry | evidence_verify
Routing and ranking rule: ...
Evidence requirement: citation | source_region | exact_span | relation_path | freshness | none
Fallback path: ...
Failure modes covered: ...
Retrieval eval: source_selection | ranking | grounding | fallback | final_answer
Telemetry: query | source_ids | ranker | fallback | evidence_span | latency_cost
Decision: proceed | narrow | stop
```

## Workflow

1. Classify the user-visible retrieval failure:
   - no source found
   - wrong source selected
   - stale source selected
   - answer overclaims retrieved context
   - relation or multi-hop evidence is missing
   - global corpus pattern is needed
   - retrieval is too slow or expensive
2. Classify the question family:
   - `exact_state`: read deterministic state, not RAG.
   - `source_span`: retrieve or read the source region and require an exact span.
   - `semantic_recall`: use metadata, keyword, vector, or hybrid retrieval.
   - `relation`: prefer graph-local or relation-aware hybrid retrieval.
   - `global_synthesis`: prefer graph-global, hierarchical, or summary-tree retrieval.
   - `contradiction`: retrieve competing evidence and mark unresolved conflict.
   - `freshness`: route to time-aware source classes or live lookup.
3. Choose the smallest retrieval mode that can satisfy the evidence requirement:
   - deterministic state before search
   - metadata/keyword filters before vector search
   - hybrid search when terminology, language, or exact labels matter
   - graph-local search for entity/relation/path questions
   - graph-global or hierarchical retrieval for corpus-wide synthesis
   - full-document read when index results are ambiguous, sparse, or suspect
4. Add an agentic step only for a named failure mode:
   - `retrieval_needed` when many queries need no retrieval
   - `query_rewrite` when user wording is weak, multilingual, or underspecified
   - `subquestions` when the answer requires multiple evidence families
   - `relevance_grade` when bad chunks frequently pass through
   - `corrective_retry` when retrieval quality can be cheaply improved
   - `evidence_verify` when claims must map to cited spans or relation paths
5. Define the truth rule:
   - retrieved context proposes evidence
   - graph edges and summaries are indexes or hypotheses
   - deterministic code validates scope, shape, provenance, and state
   - semantic truth requires the approved owner and evidence standard
6. Define telemetry before implementation: query, filters, selected source IDs, ranker, fallback, evidence span or relation path, latency, cost, and unsupported claims.
7. Define evals separately for source selection, ranking, grounding, fallback, and final answer.
8. Read [references/rag-architecture-selector.md](references/rag-architecture-selector.md) only after the question family and truth owner are named.
9. Read framework references only when they map to the chosen mode:
   - [references/claude-code-patterns.md](references/claude-code-patterns.md)
   - [references/openclaw-patterns.md](references/openclaw-patterns.md)
   - [references/wave1-patterns.md](references/wave1-patterns.md)
   - [references/wave2-patterns.md](references/wave2-patterns.md)
   - [references/wave4-patterns.md](references/wave4-patterns.md)
10. Return the Default Output, using [../route-agent-runtime-design/references/handoff-schema.md](../route-agent-runtime-design/references/handoff-schema.md) when a handoff is needed.

## Rules

- Do not treat RAG as the default architecture.
- Do not choose GraphRAG, LightRAG, hierarchical retrieval, or agentic loops by name; choose them only from question family and evidence requirements.
- Search should operate over explicit source classes, permissions, freshness, and answer formats.
- Retrieved context is evidence, not product truth.
- A graph edge, community report, summary node, vector hit, or query rewrite is not semantic proof by itself.
- Fix context assembly and source routing before adding more documents.
- Prefer deterministic retrieval pipelines when query flow, filters, ranking, and fallback can be specified.
- Prefer routed retrieval when corpora differ by semantics, permissions, freshness, or answer format.
- Evaluation must test retrieval and answer quality separately.
- Include at least one negative case where retrieval should refuse, ask for scope, or fall back to full-document read.
- If the core complaint is forgetting, compaction, or cross-session leakage, route to `design-agent-context`.

## Stop Signals

Stop or narrow when:

- RAG is proposed before deterministic state, permissions, freshness, source classes, and truth owner are named
- graph or vector retrieval is allowed to override current operational state
- a graph relation, keyword hit, or summary is treated as domain truth without source-backed evidence
- query rewrite changes the user's intent instead of improving source lookup
- the agentic loop can run unbounded searches without cost, retry, trace, or fallback limits
- retrieval and final answer quality are collapsed into one pass/fail result
- full-document read is skipped when index results are ambiguous, sparse, stale, or contradictory

## Verification

Before claiming retrieval architecture is safe, name the evidence: question family, source classes, truth owner, retrieval mode, routing/ranking rule, evidence span or relation path, fallback, telemetry, and separate retrieval-vs-answer eval results.

## Handoffs

- Use `design-agent-context` when the real issue is memory, compaction, session state, identity scope, or leakage.
- Use `assign-decision-ownership` when retrieval, deterministic code, or model judgment is becoming the semantic owner.
- Use `design-agentic-evals` when the main task is retrieval evals, groundedness evals, holdouts, or trace replay.
- Use `narrow-evidence-claims` before claiming retrieval proves readiness, correctness, completeness, or source coverage.
