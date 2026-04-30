# Wave 1 Patterns

Use this file to strengthen the eval and observability side of runtime reliability.

## `openai-agents-python-main.zip`

- Confidence:
  - `doc-confirmed`
- Keep:
  - tracing as a built-in runtime substrate
  - explicit orchestration choices such as `handoffs` versus `agents as tools`
  - sessions, guardrails, and human-in-the-loop as control surfaces around a run
- Use it to answer:
  - what should be traced at the run and span level
  - where approval and interruption fit into reliability design
  - how orchestration choices affect failure containment
- Do not overstate:
  - deep memory or compaction patterns; that is not this repo's strength

## `langfuse-main.zip`

- Confidence:
  - `doc-confirmed`
- Keep:
  - observability and traces as first-class runtime infrastructure
  - evals, datasets, feedback loops, and prompt iteration surfaces
  - session-level grouping for debugging and operator review
- Use it to answer:
  - how to turn failures into measurable eval loops
  - what operator-facing trace and dataset surfaces should exist
  - how prompt changes should be tied back to observed failures

## Boundary reminder

- `agent-fallback-eval` owns:
  - retry and failover
  - degraded modes
  - traces and eval loops
- It does not own:
  - memory schema
  - retrieval indexing
  - background state sync
