# Wave 4 Patterns

Use this file when proactive behavior needs a wake-trigger to control-plane mapping, autonomy-tier decision, approval/dismiss/undo surface, or false-positive silence case.

## Sources promoted

- Microsoft Agent Framework: workflows, checkpointing, pause/resume, streaming workflows, and human approvals.
  - Source: https://devblogs.microsoft.com/agent-framework/microsoft-agent-framework-version-1-0/
- LangGraph: durable graph execution, checkpoints, human-in-the-loop resume, and fault tolerance.
  - Source: https://docs.langchain.com/oss/python/langgraph/persistence
- OpenAI Agents SDK: guardrails, handoffs, tracing, and approval boundaries.
  - Source: https://openai.github.io/openai-agents-python/guardrails/
- CrewAI Flows: event/listen routing, flow state, and controlled orchestration around agents.
  - Source: https://docs.crewai.com/en/concepts/flows
- Temporal: timers, signals, task queues, retries, and durable workflow boundaries.
  - Source: https://temporal.io/home
- Vercel AI SDK Agents: streaming, tool loops, and frontend-native delivery surfaces.
  - Source: https://vercel.com/docs/agents/

## Wake-trigger to control-plane matrix

| Wake source | Control plane | Required user surface | Failure mode to prevent |
| --- | --- | --- | --- |
| Cron or schedule | scheduler with run ledger | snooze, dismiss, opt-out | reminder spam |
| External event | event bus or webhook | reason shown to user | mystery interruption |
| State threshold | monitor plus debounce | threshold explanation and undo | noisy false positives |
| Human approval needed | paused workflow/checkpoint | approve, reject, edit | silent auto-action |
| Long-running background progress | durable workflow | progress, cancel, resume | invisible work |
| Delivery channel change | deterministic channel router | chosen channel and fallback | message lands in wrong place |

## Autonomy decision

Choose the lowest tier that creates value:

- observe: collect signal only
- draft: prepare work without surfacing unless requested
- suggest: notify with a low-effort next step
- ask to approve: prepare a specific action for human approval
- auto-act with undo: only for low-risk, reversible actions with audit trail

If action is high-risk, costly, irreversible, cross-user, or policy-sensitive, do not auto-act.

## Proactive surface contract

Every proactive action should specify:

- wake source
- user-relevant reason for acting now
- autonomy tier
- approval boundary
- dismiss, snooze, edit, undo, or rollback path
- delivery channel and fallback channel
- trace or run ID
- false-positive case where the agent stays silent

## Controlled orchestration rule

Use workflows or flows when proactive work has known steps, approvals, timers, or state thresholds. Use open-ended agents only inside bounded steps that need tool choice, drafting, or interpretation.

## Regression cases

- Scheduled reminder versus event wake: a calendar reminder fires, but the event was already completed through another signal.
- Approval-required auto-action: agent drafts and asks approval before sending a customer-facing message.
- False-positive silence: state threshold looks suspicious but confidence is low and the action would interrupt a meeting.
