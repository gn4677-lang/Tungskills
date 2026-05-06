---
name: agent-retrieval-architecture
description: Use when the main problem is search, retrieval, document lookup, or RAG boundaries, especially agent 搜尋, RAG, source routing, deterministic state vs retrieved knowledge, full-document read fallback, stale citations, or multi-corpus scope. Trigger on retrieval symptoms such as wrong source selection, stale grounding, corpus ambiguity, full-document-read decisions, or retrieval-vs-answer eval design. Do not use as primary for session continuity or memory leakage.
---

# Agent Retrieval Architecture

Use this skill when search is weak, RAG is overused, or document loading is being asked to solve the wrong problem.

## Operating mode

Use this as a retrieval design workflow, not a list of RAG facts. Start by deciding what must be deterministic state, what should be indexed, and what deserves a full document read.

Before reading references, write down:

- the question type the agent must answer
- the source classes available
- the freshness and citation requirement
- the cost of a wrong or stale retrieval

## Default Output

```text
Deterministic state: ...
Durable memory: ...
Session state: ...
Retrieval sources: ...
Routing and ranking rule: ...
Doc-read fallback: ...
Search failure modes: ...
RAG recommendation: ...
Retrieval eval case: ...
Handoff block: optional
Decision: proceed | narrow | stop
```

## Workflow

1. Classify the retrieval task as one of:
   - exact state lookup
   - semantic recall
   - source-grounded answering
   - multi-source synthesis
   - fallback document inspection
   - freshness-sensitive lookup
2. Choose the retrieval path:
   - deterministic state read before search
   - metadata or keyword filtering before vector search
   - routed retriever or query engine when source classes differ
   - full document read only when index results are insufficient
3. Read [references/claude-code-patterns.md](references/claude-code-patterns.md) for targeted reads, bounded memory selection, and freshness rendering.
4. Read [references/openclaw-patterns.md](references/openclaw-patterns.md) for scoped retrieval surfaces and resource precedence.
5. Read [references/wave1-patterns.md](references/wave1-patterns.md) when query modes, indexing strategy, or memory search product surfaces matter.
6. Read [references/wave2-patterns.md](references/wave2-patterns.md) when retrieval taxonomy, routers, or query-engine layering need more precision.
7. Read [references/wave4-patterns.md](references/wave4-patterns.md) when query-mode selection, source-class routing, deterministic pipeline boundaries, retrieval evaluation, or full-document fallback matter.
8. Read [references/translation.md](references/translation.md) only after choosing the retrieval path.
9. Return the Default Output, using [../agent-runtime-architecture/references/handoff-schema.md](../agent-runtime-architecture/references/handoff-schema.md) when a handoff is needed.

## Rules

- Do not treat RAG as the default architecture.
- Search should operate over explicit source classes, not an unbounded pile of text.
- Document reading is a fallback tool, not a substitute for state design.
- Fix context assembly before adding more documents.
- Prefer routed retrieval when corpora have different semantics, permissions, freshness, or answer formats.
- Evaluation must test retrieval and answer quality separately.
- Prefer deterministic retrieval pipelines before open-ended agent search when the query flow, filters, ranking, and fallback can be specified.
- Split retrieval evaluation into source selection, ranking, answer grounding, citation/freshness, and fallback behavior.
- Include at least one negative case where retrieval should refuse, ask for source scope, or fall back to document read.
- If the core complaint is forgetting or cross-session leakage, route to `agent-context-architecture`.

## Stop Signals

Stop or narrow when:

- RAG is proposed before deterministic state, permissions, freshness, and source classes are named
- a vector result is allowed to override current operational state
- retrieval and answer quality are evaluated as one combined pass/fail result
- full-document read is skipped when index results are ambiguous or stale

## Verification

Before claiming retrieval architecture is safe, name the evidence: source classes, deterministic-state boundary, routing/ranking rule, citation or freshness check, doc-read fallback, and retrieval-vs-answer eval case.
