# Runtime Source Coverage Matrix

Use this file to see how `cc-haha-main`, `openclaw-main`, and the accepted Wave 1 through Wave 4 sources complement each other across the seven runtime skills.

## Matrix

| Skill | Primary sources after Wave 4 | Strongest additions through Wave 4 | Current gap or caution |
| --- | --- | --- | --- |
| `agent-context-architecture` | `cc-haha-main`, `openclaw-main`, `letta-main`, `mem0-main`, selective `langgraph`, `google-adk`, `zep-graphiti` | long-lived stateful-memory framing, inspectable memory CRUD/history/feedback, project and org memory concepts, checkpoint-vs-memory separation, state scope prefixes, temporal relationship memory | improved after Wave 3; remaining caution is not to let memory products override deterministic tenant/user/workspace scope keys |
| `agent-retrieval-architecture` | `cc-haha-main`, `graphrag-main`, `mem0-main`, `llama_index-main`, `openclaw-main`, selective `haystack`, `ragas`, `trulens`, `langfuse`, `phoenix` | indexed-query framing, local/global/DRIFT search modes, clearer memory-search source classes, stronger retriever/query-engine/router vocabulary, pipeline-before-agent rule, retrieval-vs-answer eval split, fallback doc-read triggers | stronger after Wave 4; remaining caution is still not to let retrieval framework taxonomy overwhelm simpler deterministic state reads |
| `agent-durability-ops` | `cc-haha-main`, `openclaw-main`, `letta-main`, `mem0-main`, selective `openai-agents-python-main`, `temporal`, selective `pydantic-ai`, `microsoft-agent-framework`, selective `dbos`, selective `prefect` | long-lived durable memory framing, inspectable persistent-memory lifecycle, session persistence as a surfaced runtime concern, durable execution backend selection, worker lifecycle, operator runbook checks | materially stronger after Wave 3; remaining caution is not to treat durable execution frameworks as memory governance systems |
| `agent-proactive-architecture` | `openclaw-main`, selective `openai-agents-python-main`, Microsoft HAI, Fogg, Google HEART, secondary `cc-haha-main`, selective `microsoft-agent-framework`, `langgraph`, `crewai-flows`, `temporal`, `vercel-ai-sdk` | approval, interruption, delegation boundaries, wake-trigger control planes, flow/workflow orchestration, timing, dismissal, usefulness metrics, delivery surfaces | stronger after Wave 4; still keep OpenClaw as the main runtime source so product heuristics do not replace delivery and wake mechanics |
| `agent-fallback-eval` | `openclaw-main`, `cc-haha-main`, `langfuse-main`, `openai-agents-python-main`, selective `pydantic-ai-main`, `phoenix`, selective `ragas`, selective `trulens`, selective `temporal` | observability as runtime substrate, eval/dataset loops, traces/spans/session grouping, guardrail and HITL run controls, stable-contract language, failure-class matrices, trace-to-dataset replay, stop conditions | materially stronger after Wave 3; remaining caution is not to confuse trace visibility with root-cause diagnosis |
| `agent-frictionless-design` | `openclaw-main`, Microsoft HAI, Google HEART, Baymard, selective `langfuse-main`, selective `smolagents-main`, secondary `cc-haha-main`, selective `vercel-ai-sdk`, `phoenix`, `pydantic-evals`, `crewai-flows`, `dify`, `flowise` | post-launch instrumentation, inspectable user sessions, calibrated expectations, cheap correction, streaming/progress cues, first-value path, and explicit friction metrics | stronger after Wave 4; remaining gap is deeper experiment design rather than missing interaction language |
| `agent-runtime-architecture` | `cc-haha-main`, `openclaw-main`, selective `openai-agents-python-main`, `langfuse-main`, `graphrag-main`, selective `pydantic-ai-main`, selective `llama_index-main` | better routing confidence for tracing/evals, retrieval query modes, repo-intake policy, and interface-contract language | must stay an umbrella map and avoid absorbing detailed retrieval, observability, or API-style design |

## Reading guidance

- Reach for `cc-haha-main` first when the problem is:
  - memory quality
  - context assembly
  - compaction
  - background consolidation
  - token-aware loop control

- Reach for `openclaw-main` first when the problem is:
  - session ownership
  - channel routing
  - proactive wake surfaces
  - delivery policy
  - failover in production
  - operator visibility
  - long-lived gateway state

- Reach for Wave 1 sources when the problem is:
  - `openai-agents-python-main`
    - orchestration choices, tracing surfaces, sessions, guardrails, approval checkpoints
  - `langfuse-main`
    - eval loops, datasets, prompt iteration, operator-facing traces
  - `graphrag-main`
    - retrieval query modes, indexing architecture, corpus-level search behavior
  - `letta-main`
    - long-lived stateful memory framing
  - `mem0-main`
    - inspectable memory search, history, feedback, and scoped memory products

- Reach for Wave 2 sources when the problem is:
  - `pydantic-ai-main`
    - stable public contracts, compatibility discipline, operator-facing interface evolution
  - `llama_index-main`
    - retriever/query-engine/router vocabulary and broader retrieval stack decomposition

- Use both when the problem spans:
  - long-running agents that must both think well and survive real deployment
  - shared/team memory with background maintenance
  - silent housekeeping plus user-visible confidence cues
  - proactive behavior that also needs reliability and auditability

## Biggest remaining holes

- `agent-frictionless-design` now has stronger streaming, progress, correction, and measurement framing, but still could use deeper formal experiment design later.
- `agent-retrieval-architecture` is stronger after Wave 4, but should still resist unnecessary framework complexity.
- `agent-durability-ops` now has stronger operator-run and durable-execution framing; it could still use future deep dives on cross-device restoration and backup policy.
- At least one candidate repo was intentionally demoted:
  - `langgraph-main.zip` stays low authority in the current local bundle because the included examples are archival rather than strong runtime source-of-truth.
  - `dify-main.zip` was also rejected for `agent-frictionless-design` because it is too platform-broad for this specific runtime skill target.
