# Wave 4 Forward-Test Results

Review date: 2026-04-29.

Use this file as the structured dry-run record for the Wave 4 promotion pass. It tests whether the promoted references change the behavior of:

- `agent-retrieval-architecture`
- `agent-proactive-architecture`
- `agent-frictionless-design`

This is not a new source of architecture truth. Use it to decide whether the skills need small follow-up patches.

## Method

Each case is scored on five checks:

1. Uses `wave4-patterns.md` when the scenario calls for it.
2. Applies the new selector, router, matrix, contract, or checklist.
3. Produces the required return fields from the capability skill.
4. Includes a negative, false-positive, correction, regression, or eval case.
5. Avoids the main boundary error for that scenario.

Status labels:

- `pass`: guidance is enough; no patch required.
- `minor-gap`: one rule or output field would make the skill more reliable.
- `major-gap`: routing or reference coverage is insufficient.

## Summary

| Skill | Cases | Pass | Minor gap | Major gap | Result |
| --- | ---: | ---: | ---: | ---: | --- |
| `agent-retrieval-architecture` | 3 | 3 | 0 | 0 | pass |
| `agent-proactive-architecture` | 3 | 2 | 1 | 0 | pass with minor follow-up |
| `agent-frictionless-design` | 3 | 3 | 0 | 0 | pass |

No major gaps were found. Do not add new frameworks from this pass. If patching, add only the one minor rule listed in [Follow-up Patch Targets](#follow-up-patch-targets).

## Retrieval Cases

### R1: Exact state versus RAG

Prompt shape: The user asks for the current account tier. Deterministic account state says "enterprise", while old docs retrieved by semantic search mention "pro".

Expected use:

- Read `wave4-patterns.md` because exact state and RAG boundary are central.
- Choose deterministic state read before search.
- Treat docs as background explanation only if state needs documentation.
- Include a negative case where vector search over stale docs is rejected.

Rubric:

| Check | Result |
| --- | --- |
| Uses Wave 4 reference | yes |
| Applies selector/router | yes: exact state lookup before retrieval |
| Required return fields | yes: deterministic state, retrieval sources, fallback, failure modes, eval case |
| Negative/eval case | yes: stale doc search rejected |
| Avoids boundary error | yes: does not use RAG for current operational state |

Status: `pass`.

Observation: The query-mode selector directly covers this case. No patch required.

### R2: Multi-corpus router

Prompt shape: The user asks about "rate limit". Support docs, code docs, policy docs, and logs all contain the phrase but need different answer formats and permissions.

Expected use:

- Read `wave4-patterns.md` because source-class routing is central.
- Define source classes, permissions, freshness, citation needs, and answer format.
- Choose a source-class router before retriever/query-engine selection.
- Evaluate source selection separately from final answer quality.

Rubric:

| Check | Result |
| --- | --- |
| Uses Wave 4 reference | yes |
| Applies selector/router | yes: source-class router checklist |
| Required return fields | yes |
| Negative/eval case | yes: source selection and answer grounding split |
| Avoids boundary error | yes: no single global index for all corpora |

Status: `pass`.

Observation: Existing Wave 4 rules are enough. No patch required.

### R3: Fallback full-document read

Prompt shape: Retrieved chunks mention a policy but omit the exception clause needed for the answer.

Expected use:

- Read `wave4-patterns.md` because fallback full-document read is central.
- Trigger full-document read when retrieved chunks are incomplete or disagree.
- Keep RAG recommendation conditional rather than default.
- Add retrieval eval case for missing required sections.

Rubric:

| Check | Result |
| --- | --- |
| Uses Wave 4 reference | yes |
| Applies selector/router | yes: full-document fallback trigger |
| Required return fields | yes |
| Negative/eval case | yes: missing exception clause |
| Avoids boundary error | yes: does not keep retrying the same weak query |

Status: `pass`.

Observation: The fallback trigger is specific. No patch required.

## Proactive Cases

### P1: Scheduled reminder versus event wake

Prompt shape: A scheduled reminder fires, but an external event indicates the task was already completed.

Expected use:

- Read `wave4-patterns.md` because wake-trigger control plane and false-positive silence are central.
- Compare cron wake with event signal.
- Stay silent or dismiss the reminder automatically if policy allows.
- Trace why the agent did not interrupt.

Rubric:

| Check | Result |
| --- | --- |
| Uses Wave 4 reference | yes |
| Applies matrix/contract | yes: cron plus external event and false-positive silence |
| Required return fields | yes: wake trigger, autonomy tier, approval boundary, runtime surface, fallback, observability, dismissal/undo, metric |
| False-positive case | yes |
| Avoids boundary error | yes: schedule alone does not force interruption |

Status: `pass`.

Observation: The wake matrix and existing false-positive rule cover this case. No patch required.

### P2: Approval-required auto-action

Prompt shape: The agent wants to send a customer-facing message on the user's behalf.

Expected use:

- Read `wave4-patterns.md` because approval boundary and autonomy tier are central.
- Choose ask-to-approve, not auto-act.
- Provide draft, approval, edit, reject, and audit trail.
- Use workflow/flow orchestration for known steps.

Rubric:

| Check | Result |
| --- | --- |
| Uses Wave 4 reference | yes |
| Applies matrix/contract | yes: autonomy decision and proactive surface contract |
| Required return fields | yes |
| False-positive/approval case | yes: approval before customer-facing send |
| Avoids boundary error | yes: does not auto-act on high-risk external message |

Status: `pass`.

Observation: The autonomy decision is explicit enough. No patch required.

### P3: False-positive silence during meeting

Prompt shape: A state threshold looks suspicious, but confidence is low and the user is currently in a meeting.

Expected use:

- Read `wave4-patterns.md` because state threshold, delivery channel, and silence case are central.
- Prefer observe or draft over interruption.
- State the false-positive case where the agent stays silent.
- Define what signal would later justify surfacing the alert.

Rubric:

| Check | Result |
| --- | --- |
| Uses Wave 4 reference | yes |
| Applies matrix/contract | mostly: state threshold plus false-positive silence |
| Required return fields | yes |
| False-positive case | yes |
| Avoids boundary error | yes: no low-confidence interruption |

Status: `minor-gap`.

Observation: The skill asks for a false-positive case, but it does not explicitly require a later recheck or escalation condition after staying silent.

Patch target: Add one proactive rule: "When the agent stays silent for a false-positive risk, specify the next signal, threshold, or time window that would justify surfacing later."

## Frictionless Cases

### UX1: Premature clarification

Prompt shape: The agent asks a long setup questionnaire before producing any useful output, even though a reversible first draft is possible.

Expected use:

- Read `wave4-patterns.md` because first-value path and premature clarification are central.
- Use reversible defaults.
- Produce first value before asking narrow follow-up questions.
- Measure clarification turns and time to first value.

Rubric:

| Check | Result |
| --- | --- |
| Uses Wave 4 reference | yes |
| Applies checklist | yes: first-value path and delayed clarification |
| Required return fields | yes: current friction, why users feel it, deterministic/agentic split, surface change, instrumentation, first-value path, correction path |
| Correction/eval case | yes |
| Avoids boundary error | yes: no front-loaded questionnaire |

Status: `pass`.

Observation: Existing and Wave 4 rules cover this case. No patch required.

### UX2: Slow tool progress cue

Prompt shape: A tool run takes long enough that users may think the agent is stuck.

Expected use:

- Read `wave4-patterns.md` because streaming and progress cues are central.
- Expose current phase, tool waiting, blocked state, retry state, cancel, and correction.
- Do not expose internal chain-of-thought.
- Measure abandonment and user takeover.

Rubric:

| Check | Result |
| --- | --- |
| Uses Wave 4 reference | yes |
| Applies checklist | yes: progress cue, blocked state, measurement |
| Required return fields | yes |
| Correction/eval case | yes: slow tool progress |
| Avoids boundary error | yes: progress without chain-of-thought |

Status: `pass`.

Observation: The slow/uncertain-flow rule is enough. No patch required.

### UX3: Correction without losing work

Prompt shape: The user rejects one field in a generated plan. The current product makes them restart the whole flow.

Expected use:

- Read `wave4-patterns.md` because correction path and preservation are central.
- Preserve prior inputs and intermediate artifacts.
- Let the user edit the smallest wrong unit.
- Measure correction success and user takeover.

Rubric:

| Check | Result |
| --- | --- |
| Uses Wave 4 reference | yes |
| Applies checklist | yes: correction and measurement |
| Required return fields | yes |
| Correction/eval case | yes |
| Avoids boundary error | yes: no full restart after small correction |

Status: `pass`.

Observation: Existing and Wave 4 rules cover this case. No patch required.

## Follow-up Patch Targets

Only one minor patch is justified by this dry-run:

1. `agent-proactive-architecture/SKILL.md`
   - Add a rule requiring the next signal, threshold, or time window that would justify surfacing later when the agent stays silent for false-positive risk.

Patch closure note: Closed by adding the proactive rule requiring a next signal, threshold, or time window before later surfacing after false-positive silence. The original 9 dry-run records and `8 pass / 1 minor-gap / 0 major-gap` result are intentionally preserved.

Do not add frameworks for this patch. This is a rule-level clarification from existing Wave 4 reference material.

## Acceptance Result

- 9 of 9 cases have dry-run records.
- Each tested skill has at least 2 of 3 cases marked `pass`.
- No `major-gap` cases were found.
- Follow-up work is limited to one rule-level proactive patch.
