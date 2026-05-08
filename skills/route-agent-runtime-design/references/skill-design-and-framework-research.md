# Skill Design And Framework Research

Use this file when editing the runtime skills or deciding whether current agent-framework patterns should reshape them.

## Skill design principles

- OpenAI Academy frames skills as reusable workflows with name/description, SKILL.md steps, resources, expected output, and final quality checks. Use this to keep each runtime skill focused on repeatable work rather than broad education.
  - Source: https://academy.openai.com/public/resources/skills
- OpenAI's skill-creator guidance emphasizes progressive disclosure: metadata is always loaded, SKILL.md is loaded on trigger, and bundled resources are loaded only as needed. Use this to keep SKILL.md short and move detailed source material to references.
  - Source: https://github.com/openai/skills/blob/main/skills/.system/skill-creator/SKILL.md
- Anthropic's Agent Skills engineering writeup uses the same pattern: SKILL.md plus optional linked files, with progressive disclosure as the core scalability mechanism. Use this to avoid turning SKILL.md into an encyclopedia.
  - Source: https://www.anthropic.com/engineering/equipping-agents-for-the-real-world-with-agent-skills

## Framework patterns to translate, not copy

- LangGraph persistence separates thread checkpoints, memory, replay, human-in-the-loop inspection, and fault tolerance. Translate this into the boundary between execution recovery, active session state, and durable memory.
  - Strongest skills: `design-agent-context`, `design-agent-durability`, `design-proactive-agents`
  - Source: https://docs.langchain.com/oss/python/langgraph/persistence
- Microsoft Agent Framework separates agents from workflows: use agents for open-ended tool use and workflows for explicit multi-step control. It also names sessions, memory context providers, middleware, telemetry, checkpointing, and human-in-the-loop as production building blocks.
  - Strongest skills: `design-agent-durability`, `design-proactive-agents`, `design-agent-fallbacks`
  - Source: https://learn.microsoft.com/en-us/agent-framework/overview/
- OpenAI Agents SDK guardrails distinguish input, output, and tool boundaries, with blocking vs parallel execution tradeoffs. Translate this into stop conditions, approval boundaries, and cost/side-effect gates.
  - Strongest skills: `design-agent-fallbacks`, `design-proactive-agents`
  - Source: https://openai.github.io/openai-agents-python/guardrails/
- LlamaIndex routers select among query engines or retrievers using candidate metadata. Translate this into source-class routing rather than defaulting to one vector index.
  - Strongest skill: `design-agent-retrieval`
  - Source: https://docs.llamaindex.ai/en/stable/module_guides/querying/router/
- Langfuse observability treats traces, sessions, observations, cost, token usage, and environments as debugging substrate for non-deterministic LLM apps. Translate this into required trace fields and eval dataset seeds.
  - Strongest skills: `design-agent-fallbacks`, `reduce-agent-friction`, `design-agent-retrieval`
  - Source: https://langfuse.com/docs/observability/overview
- Anthropic's agent eval guidance emphasizes transcript review and fair failure diagnosis. Translate this into regression cases that expose actual agent behavior instead of only checking final answer text.
  - Strongest skill: `design-agent-fallbacks`
  - Source: https://www.anthropic.com/engineering/demystifying-evals-for-ai-agents
- Anthropic's tool-writing guidance frames tools as contracts between deterministic systems and non-deterministic agents, and recommends intentionally defined, composable tools with careful context use.
  - Strongest skills: all six capability skills
  - Source: https://www.anthropic.com/engineering/writing-tools-for-agents

## Update rule for these skills

When updating a runtime skill, prefer an additive patch that adds one of:

- a sharper trigger or boundary in frontmatter
- an intake checklist
- a decision taxonomy
- an output contract
- a verification or regression case
- a reference pointer with clear "when to read" guidance

Avoid adding long framework summaries unless the content changes what the agent should do.
