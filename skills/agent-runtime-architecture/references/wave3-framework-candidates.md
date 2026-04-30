# Wave 3 Framework Candidates

Review date: 2026-04-29.

Use this as a candidate pool, not as accepted source coverage. Promote a candidate into a capability skill only when it changes the skill's intake, decision taxonomy, output contract, or verification cases.

## Promotion rule

- Prefer official docs, source code, or primary project material.
- Extract runtime patterns, not product marketing claims.
- Record a "do not overstate" note before using a framework in a capability skill.
- Promote narrowly: add one concrete rule, output field, or reference pointer at a time.
- Do not let broad multi-agent frameworks override simpler deterministic routing, workflow, retrieval, or eval contracts.

## Promotion status

Promoted on 2026-04-29:

- `agent-context-architecture/references/wave3-patterns.md`
  - LangGraph, Google Agent Development Kit, Mem0, Letta, Zep / Graphiti
- `agent-durability-ops/references/wave3-patterns.md`
  - Temporal, Pydantic AI durable execution, Microsoft Agent Framework, DBOS, Prefect
- `agent-fallback-eval/references/wave3-patterns.md`
  - OpenAI Agents SDK, Langfuse, Arize Phoenix, Pydantic Evals, Ragas, TruLens, Temporal
- `agent-retrieval-architecture/references/wave4-patterns.md`
  - LlamaIndex, Haystack, Microsoft GraphRAG, Ragas, TruLens, Langfuse, Arize Phoenix
- `agent-proactive-architecture/references/wave4-patterns.md`
  - Microsoft Agent Framework, LangGraph, OpenAI Agents SDK, CrewAI Flows, Temporal, Vercel AI SDK
- `agent-frictionless-design/references/wave4-patterns.md`
  - Vercel AI SDK, Langfuse, Arize Phoenix, Pydantic Evals, smolagents, CrewAI Flows, Dify, Flowise

## A-tier candidates

These are strong enough to consider for capability-skill patches after one focused read of their official docs.

| Candidate | Best-fit skills | Pattern to extract | Candidate patch target | Do not overstate | Primary source |
| --- | --- | --- | --- | --- | --- |
| LangGraph | `agent-context-architecture`, `agent-durability-ops`, `agent-proactive-architecture` | Threads, checkpoints, super-step snapshots, time travel, human-in-the-loop resume, fault-tolerant graph execution | Add clearer distinction between checkpoint, active session state, and durable memory | LangGraph checkpoints do not solve long-term memory governance by themselves | https://docs.langchain.com/oss/python/langgraph/persistence |
| Google Agent Development Kit | `agent-context-architecture`, `agent-durability-ops` | Session state as scratchpad, event history separation, state scope prefixes, controlled state updates | Add scope-prefix examples for user/app/temp state boundaries | ADK state design is not a universal memory schema | https://google.github.io/adk-docs/sessions/state/ |
| OpenAI Agents SDK | `agent-fallback-eval`, `agent-proactive-architecture`, `agent-durability-ops` | Input/output/tool guardrails, tripwires, handoff boundaries, tracing spans | Add guardrail placement and stop-condition language | Tool guardrails do not cover every hosted/built-in tool path | https://openai.github.io/openai-agents-python/guardrails/ |
| Microsoft Agent Framework | `agent-durability-ops`, `agent-proactive-architecture`, `agent-fallback-eval` | Agent/workflow separation, checkpointing, pause/resume, human approval, streaming workflows | Add workflow-vs-agent routing rule for deterministic control paths | Do not copy Microsoft product layering literally | https://devblogs.microsoft.com/agent-framework/microsoft-agent-framework-version-1-0/ |
| Pydantic AI durable execution | `agent-durability-ops`, `agent-fallback-eval` | Durable agents via Temporal, DBOS, and Prefect integrations; long-running async and human-in-loop reliability | Add durable-execution backend selection criteria | Pydantic AI's typed interface is not itself a full runtime architecture | https://ai.pydantic.dev/durable_execution/overview/ |
| Pydantic Evals | `agent-fallback-eval`, `agent-frictionless-design` | Eval framework for simple calls through multi-agent apps; span-based and structured evaluations | Add regression dataset seed shape for complex agent behavior | Evals still need representative failure cases | https://ai.pydantic.dev/evals/ |
| LlamaIndex | `agent-retrieval-architecture` | Indices, retrievers, query engines, query-engine tools, router retrievers | Add source-class router rule and retriever/query-engine vocabulary | Router abstractions can be too heavy for simple exact-state lookups | https://docs.llamaindex.ai/en/stable/examples/retrievers/router_retriever/ |
| Haystack | `agent-retrieval-architecture`, `agent-fallback-eval` | Components, pipelines, document stores, conditional routers, agents inside pipelines | Add deterministic pipeline-before-agent decision point for retrieval workflows | Haystack is stronger for RAG/search pipelines than memory continuity | https://docs.haystack.deepset.ai/docs/pipelines |
| Microsoft GraphRAG | `agent-retrieval-architecture` | Local/global/DRIFT search and graph-grounded retrieval taxonomy | Add query-mode selection for corpus-level retrieval | GraphRAG is not the default for small or fresh operational state | https://microsoft.github.io/graphrag/ |
| Mem0 | `agent-context-architecture`, `agent-retrieval-architecture`, `agent-durability-ops` | User, agent, and session memory as explicit source classes; async memory layer and reranking | Add memory source-class and recall-ranking examples | Treat claims about benchmark superiority as vendor claims unless independently verified | https://docs.mem0.ai/overview |
| Letta | `agent-context-architecture`, `agent-durability-ops` | Core memory, archival memory, recall memory, and agent-managed memory movement | Add memory-tier taxonomy for long-lived stateful agents | Letta's model should not override product-specific scope and retention rules | https://docs.letta.com/ |
| Zep / Graphiti | `agent-context-architecture`, `agent-retrieval-architecture` | Temporal knowledge graph, changing relationship history, structured plus conversational memory | Add temporal validity and stale-relationship failure cases | Knowledge graphs add complexity and should not replace simple deterministic state | https://help.getzep.com/graphiti/graphiti/overview |
| Langfuse | `agent-fallback-eval`, `agent-frictionless-design`, `agent-retrieval-architecture` | Traces, sessions, observations, cost, latency, datasets, experiments, LLM-as-judge | Add trace-field checklist and trace-to-dataset loop | Traces show what happened; diagnosis still needs structured evals | https://langfuse.com/docs/observability/overview |
| Arize Phoenix | `agent-fallback-eval`, `agent-retrieval-architecture` | OpenTelemetry tracing, datasets, experiments, evaluator explanations, production trace evals | Add trace-eval replay loop for regression testing | LLM evals require calibration and human review for high-risk claims | https://arize.com/docs/phoenix/evaluation/llm-evals/evaluator-traces |
| Ragas | `agent-retrieval-architecture`, `agent-fallback-eval` | Retrieval, RAG, and agent/tool-use metrics such as goal accuracy | Add retrieval-vs-answer eval separation | Ragas metrics are signals, not absolute truth | https://docs.ragas.io/en/stable/concepts/metrics/ |
| TruLens | `agent-retrieval-architecture`, `agent-fallback-eval` | Feedback functions for groundedness, relevance, moderation, and custom app metrics | Add feedback-function style evaluator catalog | Feedback functions still depend on provider and rubric quality | https://www.trulens.org/component_guides/evaluation/ |
| Temporal | `agent-durability-ops`, `agent-fallback-eval`, `agent-proactive-architecture` | Durable execution, activities, retries, timers, task queues, signals, replay constraints | Add durable workflow vs background-job distinction | Temporal requires deterministic workflow discipline and idempotent activities | https://temporal.io/home |

## B-tier candidates

Use these selectively when the question matches their specialty.

| Candidate | Best-fit skills | Pattern to extract | Candidate patch target | Do not overstate | Primary source |
| --- | --- | --- | --- | --- | --- |
| DBOS | `agent-durability-ops` | Durable workflows, observable execution, crashproof agent examples, human approval | Add SQL-backed durable execution option to runbook checks | DBOS is an execution substrate, not a memory product | https://www.dbos.dev/solutions/agentic-ai-platform |
| Prefect | `agent-durability-ops`, `agent-fallback-eval` | Dynamic Python workflows, retries, result caching, task observability, Pydantic AI wrapper | Add dynamic-control-flow backend option | Prefect's "exactly once" and dynamic workflow claims need workload-specific review | https://www.prefect.io/solutions/durable-execution |
| CrewAI | `agent-proactive-architecture`, `agent-durability-ops`, `agent-frictionless-design` | Crews vs flows, flow memory, human feedback decorators, event/listen routing | Add "crew for autonomous collaboration, flow for controlled orchestration" rule | Multi-agent collaboration can increase debugging, cost, and latency | https://docs.crewai.com/en/concepts/flows |
| CrewAI Memory | `agent-context-architecture`, `agent-retrieval-architecture` | Scoped shared/private memory, LLM-inferred categories, composite recall score | Add shared/private memory scope examples | LLM-inferred memory scope must be checked against deterministic privacy rules | https://docs.crewai.com/en/concepts/memory |
| Semantic Kernel Agent Framework | `agent-proactive-architecture`, `agent-durability-ops` | Agent abstractions, plugins, group chat, process/workflow patterns | Add plugin/tool boundary examples for enterprise systems | Microsoft Agent Framework is now the stronger umbrella source for newer runtime patterns | https://learn.microsoft.com/en-us/semantic-kernel/frameworks/agent/ |
| AutoGen / AG2 | `agent-proactive-architecture`, `agent-fallback-eval`, `agent-frictionless-design` | Conversable agents, human input modes, termination conditions, team chat memory | Add termination-condition and human-input-mode examples | Multi-agent chat is not automatically better than a single agent plus deterministic workflow | https://microsoft.github.io/autogen/dev/user-guide/agentchat-user-guide/memory.html |
| Hugging Face smolagents | `agent-frictionless-design`, `agent-fallback-eval` | Minimal multi-step loop, step callbacks, final answer checks, succinct/full replay memory | Add lightweight loop and final-answer-check examples | The API is experimental and should not be a primary production runtime source | https://huggingface.co/docs/smolagents/main/reference/agents |
| Vercel AI SDK Agents | `agent-frictionless-design`, `agent-proactive-architecture` | Tool loops, streaming UX, deployment surface, frontend-native agent patterns | Add streaming/progress surface examples | Strong for web delivery; weaker as a full durability/memory authority | https://vercel.com/docs/agents/ |
| Mastra | `agent-fallback-eval`, `agent-proactive-architecture` | JavaScript/TypeScript agents, workflows, memory, evals, deployable runtime | Add JS-agent ecosystem comparison only if the product stack is JS-first | Do not treat as stronger than LangGraph/Pydantic AI for runtime durability | https://mastra.ai/en/docs |
| Agno | `agent-proactive-architecture`, `agent-durability-ops` | Agents, teams, sessions, memory, knowledge, logs, traces in one framework | Add team/session/logs vocabulary if multi-agent productization is central | Verify claims against source code before using as authority | https://docs.agno.com/ |
| MCP | `agent-retrieval-architecture`, `agent-fallback-eval`, `agent-proactive-architecture` | Resources, prompts, tools, tool discovery, tool-contract surface | Add resources/prompts/tools boundary to tool and retrieval design | MCP standardizes integration; it does not solve authorization, prompt injection, or tool safety | https://modelcontextprotocol.io/specification/2025-11-25/basic |
| Supermemory | `agent-context-architecture`, `agent-retrieval-architecture` | User/document/project/org memory containers and semantic understanding graph | Add container-scope examples for productized memory | Treat as a productized memory API, not a runtime control plane | https://supermemory.ai/docs/intro |
| Dify | `agent-retrieval-architecture`, `agent-frictionless-design` | Visual agent/workflow split, knowledge pipeline, productized RAG UI | Add product-surface examples for knowledge ingestion and workflow UX | Too broad to serve as primary runtime architecture source | https://docs.dify.ai/en/use-dify/build/agent |
| Flowise | `agent-retrieval-architecture`, `agent-frictionless-design` | Visual low-code chains, agentflows, retrieval nodes, human-facing assembly surface | Use mainly as UI/productization comparison | Many patterns are downstream of LangChain/LangGraph ideas | https://docs.flowiseai.com/ |
| n8n AI Agents | `agent-proactive-architecture`, `agent-frictionless-design` | Workflow automation with AI nodes, trigger-driven execution, human business workflows | Add boundary examples between automation workflow and autonomous agent | n8n is workflow automation first, not an agent runtime authority | https://docs.n8n.io/advanced-ai/ |

## C-tier watchlist

Keep these available for future research, but do not promote without deeper source review.

| Candidate | Why watch | Current status |
| --- | --- | --- |
| AIOS / Cerebrum | Agent SDK, hub, storage/tool/memory layers, and deployment/discovery ideas | Academic/emerging; use for research framing only |
| HumanLayer | Human approval and contact-channel integrations for agents | Useful for proactive/HITL product surfaces; needs narrower source read |
| Future AGI / LangWatch / Confident AI | Trace-to-diagnosis and continuous eval tooling | Good eval ecosystem signals; not yet primary for these skills |
| Local-first memory projects such as MemX | Explainable local memory and privacy-first persistence | Promising for context/durability, but still research-stage |
| MCP security research | Tool poisoning, prompt injection, authorization, and protocol gaps | Use to add cautions, not as framework pattern source |

## Skill-specific shortlist

- `agent-context-architecture`
  - strongest candidates: Google ADK, LangGraph, Mem0, Letta, Zep/Graphiti, CrewAI Memory, Supermemory
  - next likely patch: add a memory-state taxonomy that distinguishes scratchpad/session state, checkpoint state, user memory, agent memory, project memory, and temporal relationship memory

- `agent-retrieval-architecture`
  - strongest candidates: LlamaIndex, Haystack, GraphRAG, Zep/Graphiti, Ragas, TruLens, Langfuse/Phoenix
  - next likely patch: add retrieval eval split: source selection, retrieval ranking, answer grounding, citation/freshness, and fallback document read

- `agent-durability-ops`
  - strongest candidates: Temporal, Pydantic AI durable execution, Microsoft Agent Framework, LangGraph, DBOS, Prefect
  - next likely patch: add durable-execution backend selection and worker/job runbook checks

- `agent-proactive-architecture`
  - strongest candidates: Microsoft Agent Framework, LangGraph, OpenAI Agents SDK, CrewAI Flows, Temporal, Vercel AI SDK
  - next likely patch: add wake-trigger to workflow/control-plane mapping: cron, event, state threshold, human approval, external signal, and delivery channel

- `agent-fallback-eval`
  - strongest candidates: OpenAI Agents SDK, Langfuse, Phoenix, Pydantic Evals, Ragas, TruLens, Temporal
  - next likely patch: add failure-class to trace/eval/stop-condition table

- `agent-frictionless-design`
  - strongest candidates: Vercel AI SDK, Langfuse, Phoenix, smolagents, CrewAI Flows, Dify/Flowise as product-surface references
  - next likely patch: add streaming/progress/correction instrumentation examples for user-visible agent work
