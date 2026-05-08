# Wave 3 Forward-Test Results

Review date: 2026-04-29.

Use this file as the structured dry-run record for the Wave 3 promotion pass. It tests whether the promoted references change the behavior of three runtime skills:

- `design-agent-context`
- `design-agent-durability`
- `design-agent-fallbacks`

This is not a new source of architecture truth. Use it to decide whether the skills need small follow-up patches.

## Method

Each case is scored on five checks:

1. Uses `wave3-patterns.md` when the scenario calls for it.
2. Applies the new taxonomy, selector, matrix, or checklist.
3. Produces the required return fields from the capability skill.
4. Includes a verification, regression, chaos, or eval case.
5. Avoids the main boundary error for that scenario.

Status labels:

- `pass`: guidance is enough; no patch required.
- `minor-gap`: one rule or output field would make the skill more reliable.
- `major-gap`: routing or reference coverage is insufficient.

## Summary

| Skill | Cases | Pass | Minor gap | Major gap | Result |
| --- | ---: | ---: | ---: | ---: | --- |
| `design-agent-context` | 3 | 3 | 0 | 0 | pass |
| `design-agent-durability` | 3 | 2 | 1 | 0 | pass with minor follow-up |
| `design-agent-fallbacks` | 3 | 2 | 1 | 0 | pass with minor follow-up |

No major gaps were found. Do not add new frameworks from this pass. If patching, add only the two minor rules listed in [Follow-up Patch Targets](#follow-up-patch-targets).

## Context Cases

### C1: Same user switches between two projects

Prompt shape: A user asks the agent to reuse prior decisions while switching from Project A to Project B. Some prior facts are user preferences, some are Project A architecture decisions.

Expected use:

- Read `wave3-patterns.md` because multi-tenant scope and state taxonomy are central.
- Classify facts as user memory versus project memory.
- Require `tenant_id`, `user_id`, `workspace_id`, and retention/privacy class.
- Carry stable user preferences only when allowed by privacy and retention rules.
- Keep Project A architecture decisions out of Project B context.

Rubric:

| Check | Result |
| --- | --- |
| Uses Wave 3 reference | yes |
| Applies taxonomy/checklist | yes: user memory, project memory, scope keys |
| Required return fields | yes: session boundary, identity boundary, durable memory, session state, context pack, compaction rule, leakage risk, verification case |
| Verification case | yes: same user in two projects |
| Avoids boundary error | yes: no workspace memory bleed |

Status: `pass`.

Observation: The new scope-key checklist directly supports the decision. No patch required.

### C2: Two users in one shared channel

Prompt shape: User A and User B are in the same shared thread. User A has private preference memory. The agent is about to answer User B.

Expected use:

- Read `wave3-patterns.md` because user identity, channel surface, and privacy class are central.
- Classify User A preference as user memory with private privacy class.
- Use `surface_id` plus `user_id` and `workspace_id` to separate shared thread context from private memory.
- Include only channel-visible facts unless explicit permission or shared memory policy exists.

Rubric:

| Check | Result |
| --- | --- |
| Uses Wave 3 reference | yes |
| Applies taxonomy/checklist | yes: user memory, surface scope, privacy class |
| Required return fields | yes |
| Verification case | yes: two users in one shared channel |
| Avoids boundary error | yes: private user memory is not shown to the other user |

Status: `pass`.

Observation: The existing rules cover private memory leakage. No patch required.

### C3: Checkpoint resume mistaken for durable memory

Prompt shape: An interrupted agent run resumes from a checkpoint, and the product team asks whether checkpoint fields should become durable personalization memory.

Expected use:

- Read `wave3-patterns.md` because checkpoint-vs-memory boundary is central.
- Classify checkpoint state as workflow runtime state.
- Restore pending tool state and human approval progress from checkpoint only.
- Do not write checkpoint payload into user, agent, or project memory unless a separate memory extraction rule accepts it.

Rubric:

| Check | Result |
| --- | --- |
| Uses Wave 3 reference | yes |
| Applies taxonomy/checklist | yes: checkpoint state versus durable memory |
| Required return fields | yes |
| Verification case | yes: resume after checkpoint does not create durable memory |
| Avoids boundary error | yes: checkpoint is not treated as reusable personalization |

Status: `pass`.

Observation: The LangGraph translation and rule "checkpoints are execution state" make this clear. No patch required.

## Durability Cases

### D1: Worker crashes after tool call before terminal state

Prompt shape: A background worker completes a side-effecting tool call, crashes before writing terminal state, and is later retried.

Expected use:

- Read `wave3-patterns.md` because worker lifecycle and crash recovery are central.
- Choose activity/task wrapper for side-effect retry boundary.
- Require idempotency key, input payload hash, trace ID, lease, terminal state, and rollback/compensation path.
- Operator runbook must show how to inspect job state and prove whether the side effect already happened.

Rubric:

| Check | Result |
| --- | --- |
| Uses Wave 3 reference | yes |
| Applies selector/contract | yes: activity wrapper, idempotency, terminal state |
| Required return fields | yes: durability risk, maintenance loop, state ownership, budget guard, recovery path, observability/rollback, runbook check |
| Chaos case | yes: worker crash after tool call |
| Avoids boundary error | yes: does not blindly retry a side effect |

Status: `pass`.

Observation: The worker lifecycle contract is actionable. No patch required.

### D2: Duplicate wake starts two workers for one job

Prompt shape: Two wake triggers start the same maintenance job in parallel.

Expected use:

- Read `wave3-patterns.md` because worker lifecycle and stale ownership are central.
- Choose background job with lease.
- Require owner key, lease/lock rule, idempotency key, terminal states, and duplicate detection in the runbook.
- Treat the task ledger as audit, not the scheduler.

Rubric:

| Check | Result |
| --- | --- |
| Uses Wave 3 reference | yes |
| Applies selector/contract | yes: background job with lease |
| Required return fields | yes |
| Chaos case | yes: duplicate wake |
| Avoids boundary error | yes: no incidental shared-file or task-ledger scheduling assumption |

Status: `pass`.

Observation: The guidance is strong for duplicate-worker control. No patch required.

### D3: Budget exhausted halfway through a multi-step run

Prompt shape: A long-running agent has already completed some steps when the runtime budget is exhausted.

Expected use:

- Read `wave3-patterns.md` because budget exposure and operator runbook are central.
- Choose budget gate before expensive loops and checkpointed workflow if partial progress must survive.
- Define what is restored, recomputed, discarded, paused, or marked superseded.
- Provide operator action: resume after budget reset, cancel, or return degraded result through `design-agent-fallbacks`.

Rubric:

| Check | Result |
| --- | --- |
| Uses Wave 3 reference | yes |
| Applies selector/contract | mostly: budget gate plus checkpointed workflow |
| Required return fields | yes |
| Chaos case | yes: budget exhausted halfway through multi-step run |
| Avoids boundary error | yes: budget guard acts before loops; no invisible runaway |

Status: `minor-gap`.

Observation: The skill covers budget gates and recovery, but the expected user-visible degraded path is only implicit through the route to `design-agent-fallbacks`.

Patch target: Add one durability rule or output hint: "When budget exhaustion affects a user-visible result, specify the operator action and whether degraded response ownership hands off to `design-agent-fallbacks`."

## Fallback/Eval Cases

### F1: Tool timeout

Prompt shape: A tool call times out during a larger workflow.

Expected use:

- Read `wave3-patterns.md` because failure-class matrix and stop condition are central.
- Classify as timeout or transport.
- Retry current operation only.
- Stop when max attempts or SLA is exceeded.
- Trace endpoint/tool, latency, timeout class, and attempt count.
- Seed eval with "single slow tool should not replay whole workflow."

Rubric:

| Check | Result |
| --- | --- |
| Uses Wave 3 reference | yes |
| Applies matrix/checklist | yes: timeout/transport row |
| Required return fields | yes: failure surface, retry, failover, degraded mode, traces, evals, stop condition, regression seed |
| Eval case | yes |
| Avoids boundary error | yes: does not replay whole workflow |

Status: `pass`.

Observation: The matrix precisely supports this case. No patch required.

### F2: Guardrail tripwire blocks unsafe tool action

Prompt shape: The model attempts a side-effecting tool call that violates policy or user approval boundaries.

Expected use:

- Read `wave3-patterns.md` because guardrail placement and tripwire behavior are central.
- Classify as unsafe or out-of-policy action.
- Stop for approval or block outright.
- Trace guardrail name, policy class, blocked action, and approval ID.
- Define which input, tool, output, and handoff guardrails apply.

Rubric:

| Check | Result |
| --- | --- |
| Uses Wave 3 reference | yes |
| Applies matrix/checklist | yes: unsafe/out-of-policy row plus guardrail placement |
| Required return fields | yes |
| Eval case | yes: unsafe tool call blocked before side effect |
| Avoids boundary error | mostly: blocks before side effect, but hosted/built-in tool caveat is not explicit in this skill |

Status: `minor-gap`.

Observation: The guidance is operational, but the skill would be safer if it explicitly reminded agents not to assume every tool path supports the same pre/post guardrail hooks.

Patch target: Add one fallback rule: "State which tools or handoff paths cannot be wrapped by the proposed guardrail, and choose a stop or approval boundary for those paths."

### F3: Low-quality answer enters eval dataset

Prompt shape: The agent returns an answer that is complete-looking but poorly grounded or low quality.

Expected use:

- Read `wave3-patterns.md` because trace-to-dataset loop and eval seed shape are central.
- Classify as low-quality answer.
- Run eval/critic or request missing source.
- Trace rubric, score, missing evidence, and retrieved sources.
- Create regression seed with request, context, expected failure class, allowed response policy, forbidden behavior, required trace fields, and degraded-success acceptance rule.

Rubric:

| Check | Result |
| --- | --- |
| Uses Wave 3 reference | yes |
| Applies matrix/checklist | yes: low-quality row and eval seed shape |
| Required return fields | yes |
| Eval case | yes: quality failure becomes dataset example |
| Avoids boundary error | yes: trace visibility is not treated as root-cause diagnosis |

Status: `pass`.

Observation: The trace-to-dataset loop and eval seed shape are enough. No patch required.

## Follow-up Patch Targets

Only two minor patches are justified by this dry-run:

1. `design-agent-durability/SKILL.md`
   - Add a rule for budget exhaustion that requires an operator action and, when user-visible degradation is needed, a handoff to `design-agent-fallbacks`.

2. `design-agent-fallbacks/SKILL.md`
   - Add a guardrail limitation rule requiring the answer to state which tools or handoff paths cannot be wrapped by the proposed guardrail.

Do not add frameworks for either patch. Both are rule-level clarifications from existing Wave 3 references.

Patch closure note:

- `design-agent-durability/SKILL.md` now requires an operator action and explicit `design-agent-fallbacks` handoff decision when budget exhaustion affects a user-visible result.
- `design-agent-fallbacks/SKILL.md` now requires guardrail coverage limitations and a stop or approval boundary for unwrapped tools, hosted/built-in capabilities, and handoff paths.

## Acceptance Result

- 9 of 9 cases have dry-run records.
- Each tested skill has at least 2 of 3 cases marked `pass`.
- No `major-gap` cases were found.
- Follow-up work is limited to two rule-level patches.
