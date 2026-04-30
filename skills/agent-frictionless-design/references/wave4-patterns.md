# Wave 4 Patterns

Use this file when the friction problem involves streaming, progress cues, blocked-state design, correction paths, first-value time, or post-launch measurement.

## Sources promoted

- Vercel AI SDK Agents: streaming responses, tool loops, and frontend-native agent delivery.
  - Source: https://vercel.com/docs/agents/
- Langfuse and Arize Phoenix: traces, sessions, datasets, experiments, and user-visible debugging evidence.
  - Sources: https://langfuse.com/docs/observability/overview and https://arize.com/docs/phoenix/evaluation/llm-evals/evaluator-traces
- Pydantic Evals: evaluation for simple calls through multi-agent apps.
  - Source: https://ai.pydantic.dev/evals/
- Hugging Face smolagents: minimal multi-step loop, step callbacks, final-answer checks, and replay memory.
  - Source: https://huggingface.co/docs/smolagents/main/reference/agents
- CrewAI Flows: controlled event flow around agents.
  - Source: https://docs.crewai.com/en/concepts/flows
- Dify and Flowise: productized visual workflow and knowledge surfaces.
  - Sources: https://docs.dify.ai/en/use-dify/build/agent and https://docs.flowiseai.com/

## Friction diagnosis checklist

Before redesigning the flow, identify:

- first-value path: what useful result can appear before all setup is complete?
- progress cue: what can the user see while work is running?
- blocked state: how does the user know the agent needs input or approval?
- correction path: can the user fix the result without restarting?
- surface choice: is the action happening where the user already is?
- measurement: which metric will prove friction improved?

## Streaming and progress cues

Use visible progress when the work is slow, uncertain, or multi-step:

- show current phase, not internal chain-of-thought
- stream partial artifacts when they are useful
- expose tool waiting, blocked input, approval needed, and retry states
- keep cancel and correction available
- preserve prior work across retry and handoff

## Surface-choice rule

Prefer the user's current surface when:

- the task is a continuation of the current conversation or workflow
- the next action is small and reversible
- the user can correct the result in place

Move to a dedicated surface when:

- the task needs comparison, review, bulk editing, or structured approval
- multiple artifacts or stakeholders are involved
- the current channel cannot show progress, preview, or undo safely

## Correction and measurement

Treat correction as part of the main path:

- preserve prior inputs and intermediate artifacts
- let users edit the smallest wrong unit
- explain blocked state with a single next action
- record correction success, user takeover, abandonment, and time to first value

Do not claim the design is improved without instrumentation or a clear evaluation case.

## Regression cases

- Premature clarification: the agent asks a setup questionnaire when it could produce a reversible first draft.
- Slow tool progress: a tool run takes long enough that users may think the agent is stuck.
- Correction without losing work: user rejects one field in a generated plan and should not have to restart the flow.
