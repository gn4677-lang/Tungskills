# Final Acceptance and Usage Readiness

Review date: 2026-04-29.

Use this file as the final acceptance record for the six runtime capability skills and the umbrella runtime router. It is not a new framework source and should not replace the Wave 1 through Wave 4 reference files.

## Status Snapshot

| Area | Acceptance status |
| --- | --- |
| Wave 1 and Wave 2 source expansion | Accepted as baseline framework and contract coverage. |
| Wave 3 promotion pass | Accepted for context, durability, and fallback/eval. Forward-test found 7 pass, 2 minor gaps, 0 major gaps. |
| Wave 3 closure patch | Closed the durability budget-exhaustion rule and fallback guardrail-limitation rule. Original dry-run results remain preserved. |
| Wave 4 promotion pass | Accepted for retrieval, proactive, and frictionless. Forward-test found 8 pass, 1 minor gap, 0 major gaps. |
| Wave 4 closure patch | Closed the proactive false-positive silence recheck rule. Original dry-run results remain preserved. |
| Current readiness | Ready for use as six procedural runtime skills plus one umbrella router. |

Remaining cautions are future research targets, not acceptance blockers:

- `reduce-agent-friction` could later use deeper experiment-design patterns.
- `design-agent-durability` could later use deeper cross-device restoration and backup-policy patterns.
- `design-agent-retrieval` should continue resisting unnecessary retrieval framework complexity when deterministic state reads are enough.
- `route-agent-runtime-design` must stay a router and avoid absorbing capability-level design details.

## Capability Usage Matrix

| Skill | Use as primary when | Do not use as primary for | Required output fields |
| --- | --- | --- | --- |
| `design-agent-context` | The problem is memory continuity, identity boundaries, session leakage, context packing, compaction, or durable memory. | Search/RAG boundaries, provider failover, proactive reminders, or generic UX friction. | session boundary; identity boundary; durable memory; session state; assembled context pack; compaction rule; leakage risk; verification case; optional handoff block. |
| `design-agent-retrieval` | The problem is search, document lookup, RAG scope, deterministic state versus retrieval, routing among source classes, or full-document fallback. | Session ownership, active memory continuity, wake triggers, or runtime crash recovery. | deterministic state; durable memory; session state; retrieval sources; routing and ranking rule; doc-read fallback; search failure modes; RAG recommendation; retrieval eval case; optional handoff block. |
| `design-agent-durability` | The problem is background runtime continuity, worker lifecycle, crash recovery, shared-state sync, checkpoint/bootstrap, or budget/quota guards. | Ordinary context packing, RAG design, proactive timing, or provider/model failover policy. | durability risk; background maintenance loop; state ownership and sync rule; budget and quota guard; recovery and bootstrap path; observability and rollback rule; operator runbook check; optional handoff block. |
| `design-proactive-agents` | The problem is wake triggers, scheduled work, follow-ups, reminders, autonomy tiers, approval boundaries, or proactive delivery. | Retry/failover handling, memory schema design, or ordinary onboarding and progress cues. | wake trigger; autonomy tier; approval boundary; runtime surface; fallback path; observability requirement; dismissal and undo path; proactivity metric; optional handoff block. |
| `design-agent-fallbacks` | The problem is retry, failover, degraded response, guardrails, traces, eval loops, stop conditions, or regression datasets. | Proactive reminders, memory continuity, or interaction-friction redesign. | failure surface; retry rule; failover rule; degraded mode; trace additions; eval additions; stop condition; regression dataset seed; optional handoff block. |
| `reduce-agent-friction` | The problem is heavy onboarding, premature clarification, weak progress cues, poor surface choice, slow perceived latency, or expensive correction. | Memory, retrieval, durability, proactive policy, or failover ownership. | current friction; why users feel it; what stays deterministic; what should become more agentic; surface and interaction change; instrumentation after launch; first-value path; correction path; optional handoff block. |

## Final Dry-Run Rubric

Each final case is accepted only when it:

1. Chooses one primary skill.
2. Names any handoff skill only when a separate layer must own part of the design.
3. Preserves the required return fields for the primary skill.
4. Avoids the most likely boundary error.
5. Adds a verification, regression, chaos, eval, false-positive, or correction case.

Status labels:

- `pass`: guidance is ready for real use.
- `minor-gap`: a future rule-level patch may be useful.
- `major-gap`: routing or source coverage is not ready.

## Single-Skill Final Cases

### A1: Context carryover across projects

Prompt shape: The same user switches between two projects and asks which memory can carry over.

Expected routing:

- Primary skill: `design-agent-context`.
- Handoff: none unless the answer needs document search.
- Required fields: session boundary, identity boundary, durable memory, session state, assembled context pack, compaction rule, leakage risk, verification case.

Acceptance notes:

- User identity can carry across projects only through explicitly scoped durable memory.
- Project-local facts, files, tasks, and preferences must stay behind project/workspace scope keys.
- Checkpoint/resume state is not reusable memory.
- Verification case: same user, two projects, conflicting project-local preference.

Status: `pass`.

Boundary avoided: does not use retrieval as the authority for active identity or tenant scope.

### A2: Exact operational state versus retrieved docs

Prompt shape: The user asks for current account tier, but old retrieved docs mention a different tier.

Expected routing:

- Primary skill: `design-agent-retrieval`.
- Handoff: `design-agent-context` only if durable user memory is being mixed into the answer.
- Required fields: deterministic state, durable memory, session state, retrieval sources, routing and ranking rule, doc-read fallback, search failure modes, RAG recommendation, retrieval eval case.

Acceptance notes:

- Deterministic account state wins over semantic retrieval.
- Retrieved docs can explain policy but must not override current state.
- Retrieval eval should split source selection, ranking, and answer grounding.
- Negative case: stale vector result is rejected.

Status: `pass`.

Boundary avoided: does not use RAG for current operational state.

### A3: Background worker crash before terminal write

Prompt shape: A background worker completes a tool call, then crashes before writing terminal job state.

Expected routing:

- Primary skill: `design-agent-durability`.
- Handoff: `design-agent-fallbacks` only for user-visible degraded response or retry messaging.
- Required fields: durability risk, background maintenance loop, state ownership and sync rule, budget and quota guard, recovery and bootstrap path, observability and rollback rule, operator runbook check.

Acceptance notes:

- Recovery needs lease, idempotency key, terminal-state check, and replay-safe write boundary.
- Operator runbook must say how to detect stuck in-progress work.
- Chaos case: crash after external side effect but before terminal write.

Status: `pass`.

Boundary avoided: does not treat provider retry policy as durable job recovery.

### A4: Low-confidence proactive alert during meeting

Prompt shape: A suspicious state threshold fires while confidence is low and the user is in a meeting.

Expected routing:

- Primary skill: `design-proactive-agents`.
- Handoff: none unless the issue becomes interaction-surface friction after a proactive action is allowed.
- Required fields: wake trigger, autonomy tier, approval boundary, runtime surface, fallback path, observability requirement, dismissal and undo path, proactivity metric.

Acceptance notes:

- Choose observe-only or draft instead of interruption.
- Record the false-positive silence case.
- Specify the next signal, threshold, or time window that would justify surfacing later.
- False-positive case: low confidence plus active meeting should stay silent.

Status: `pass`.

Boundary avoided: does not treat a schedule or threshold alone as permission to interrupt.

### A5: Tool timeout during a workflow

Prompt shape: A tool call times out after partial workflow progress.

Expected routing:

- Primary skill: `design-agent-fallbacks`.
- Handoff: `design-agent-durability` only if crash recovery, checkpointing, or job lifecycle is the main issue.
- Required fields: failure surface, retry rule, failover rule, degraded mode, trace additions, eval additions, stop condition, regression dataset seed.

Acceptance notes:

- Retry only the current operation when safe, not the whole workflow.
- Distinguish retry, failover, degraded result, and stop-for-human.
- Trace fields must capture operation id, timeout class, retry count, provider/tool, and terminal outcome.
- Regression seed: tool timeout with prior steps already completed.

Status: `pass`.

Boundary avoided: does not replay the entire workflow by default.

### A6: Slow tool with poor progress cues

Prompt shape: A tool run is slow enough that users may think the agent is stuck.

Expected routing:

- Primary skill: `reduce-agent-friction`.
- Handoff: `design-agent-fallbacks` only if the tool has actually timed out or degraded.
- Required fields: current friction, why users feel it, deterministic/agentic split, surface and interaction change, instrumentation after launch, first-value path, correction path.

Acceptance notes:

- Show progress cue, blocked state, cancellation/correction path, and measurement.
- Do not expose chain-of-thought as progress.
- Correction case: user can redirect the next step without losing prior work.

Status: `pass`.

Boundary avoided: does not redesign runtime durability when the bottleneck is perceived latency and interaction feedback.

## Cross-Skill Routing Cases

### R1: Context versus retrieval

Prompt shape: "When I switch from Project A to Project B, should the agent search prior conversations or use memory?"

Expected routing:

- Primary skill: `design-agent-context`.
- Handoff: `design-agent-retrieval` only for explicit document or conversation search after scope is decided.

Acceptance notes:

- Decide tenant/user/workspace/project scope before retrieval.
- Carry only durable, scope-safe user memory.
- Retrieval may inspect prior material but cannot define identity or leakage boundaries.

Status: `pass`.

Boundary avoided: retrieval is not used as a substitute for memory-state taxonomy.

### R2: Durability versus fallback

Prompt shape: "A long-running job hit budget exhaustion halfway and the user still needs a result."

Expected routing:

- Primary skill: `design-agent-durability`.
- Handoff: `design-agent-fallbacks` for degraded response wording, retry/failover policy, and eval seed.

Acceptance notes:

- Durability owns budget gate, job state, operator action, and recovery path.
- Fallback/eval owns degraded mode, stop condition, trace/eval additions, and regression seed.
- Required closure rule: specify operator action and whether degraded response ownership hands off.

Status: `pass`.

Boundary avoided: budget exhaustion is not treated as only a retry problem.

### R3: Proactive versus frictionless

Prompt shape: "The reminder system is annoying users with noisy timing and too many prompts."

Expected routing:

- Primary skill: `design-proactive-agents` if the core issue is wake timing, autonomy tier, approval, or silence.
- Handoff: `reduce-agent-friction` when the allowed proactive surface still has too much friction.

Acceptance notes:

- Proactive owns wake source, autonomy tier, approval boundary, false-positive silence, and dismiss/snooze/undo.
- Frictionless owns first-value path, correction path, progress, and post-launch friction measurement.
- False-positive case: reminder should stay silent when external completion signal already exists.

Status: `pass`.

Boundary avoided: interaction polish does not replace wake-trigger control policy.

## Acceptance Result

- 9 of 9 final dry-run cases are recorded.
- 9 of 9 final dry-run cases are `pass`.
- No new `major-gap` cases were found.
- No new `minor-gap` patch targets were found.
- Required return fields are present for all six capability skills.
- Cross-skill routing cases name one primary skill and only use handoff when another layer has clear ownership.

## Future Research Queue

These items are intentionally deferred:

1. Deeper formal experiment design for `reduce-agent-friction`.
2. Cross-device restoration and backup-policy deep dive for `design-agent-durability`.
3. More production examples for retrieval systems that keep deterministic state outside RAG.

Do not start a Wave 5 solely from this file. Start another promotion pass only when a real usage failure, new framework source, or explicit user request justifies it.
