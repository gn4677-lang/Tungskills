# AI Development Blueprint Harness

Use this reference when `sequence-capability-work` is being used to start, audit, or repair an AI-assisted development harness for a repo, product, or major capability.

This is a reference, not a separate skill. The operational owner remains `sequence-capability-work`; hand off to neighboring skills when the work becomes direction challenge, architecture, eval, evidence, activation, delivery, UI, security, or code-quality work.

## When To Use

Read this when the task mentions:

- AI development blueprint, harness bootstrap, spec-and-evidence-first work, or repo setup for AI agents
- product truth, workflow map, target architecture, invariants, golden flows, evidence matrix, completion standard
- fake pass, fixture-only proof, partial E2E, implementation started before source-of-truth docs
- new product, new repo, new major capability, or a repo that repeatedly passes tests but fails real use

Do not load this for ordinary PR ordering when the product truth, invariants, and evidence gates are already established.

## Default Harness Output

```text
Product shape: deterministic app | agentic product | hybrid | unknown
Existing source-of-truth docs: ...
Missing harness artifacts: ...
Product truth / user outcome: ...
Current capability blocker: ...
Minimum spec set: ...
Minimum evidence set: ...
Invariants to protect: ...
Golden flows / real E2E paths: ...
Fake-pass risks: ...
Handoff skills: ...
Decision: create docs | patch existing docs | sequence build | stop
```

## Protocol

1. Classify the product shape: deterministic app, agentic product, or hybrid.
2. Inventory existing repo truth before creating new docs. Prefer patching the nearest existing spec, runbook, or evidence gate.
3. Require product truth before build order: user outcome, domain language, workflow map, target architecture, and current blocker.
4. For deterministic apps, require workflow/state boundaries, invariants, golden flows, security model, and E2E completion evidence.
5. For agentic products, require UX map, manager-style mechanism, decision ownership map, trace contract, fixture boundary, real E2E path, and live/diagnostic strategy.
6. Separate three evidence levels: fixture/local proof, real local E2E, and live/provider/user-facing evidence.
7. Treat implementation discoveries as backpropagation into the source-of-truth docs, not as silent drift.
8. Only then sequence build slices by blocker removal, product capability, decision unlock, risk reduction, or maintenance.

## Mechanism-First EDD Gate

Use this gate before changing Golden Sets, browser suites, prompt contracts, or eval cases for a high-impact agentic failure.

```text
Product capability: ...
Failure family: ...
Code references inspected: ...
Trace / artifact references inspected: ...
Semantic owner: ...
Deterministic boundary: ...
Invariants: ...
Mechanism under test: ...
Targeted E2E plan: ...
Holdout need: ...
Decision: patch mechanism | add holdout | revise eval | stop
```

Order:

1. Classify the failure family from existing trace/log/artifact evidence.
2. Inspect the real code path and response owner before adding cases.
3. Define the intended mechanism and ownership boundary.
4. Run or design the smallest targeted E2E that proves the mechanism, not just a fixture path.
5. Add only enough holdout coverage to prevent literal-case overfit.
6. Run full browser or full-suite E2E after the mechanism works.

## Golden Set And Mechanism Map Pairing

For high-impact capability families, keep two views connected:

```text
Golden Set capability row:
case_id:
product_capability:
user_outcome:
evidence_level:
invariants:
acceptance_signal:

Mechanism map row:
case_id_or_family:
failure_family:
mechanism_under_test:
semantic_owner:
deterministic_boundary:
local_code_paths:
trace_fields_required:
implementation_references:
targeted_e2e:
holdout_family:
gap_to_close:
```

Rules:

- Golden Set rows represent product capability and user-visible outcomes.
- Mechanism map rows explain how the capability should become real in code.
- A high-impact Golden Set family should not keep expanding cases when no one can name the mechanism under test.
- Small regression seeds do not each need their own mechanism map; map the capability family, then attach focused regression cases to it.
- Mature GitHub/framework code may inform mechanism shape, but local repo truth decides behavior.

## Best-Practice Evidence Ladder

Do not treat "best practice" as one source type.

```text
Normative basis: official docs, standards, framework docs, security guidance
Implementation reference: mature GitHub repos, framework examples, tests, issues, PRs
Repo truth: local product specs, traces, code paths, invariants, source-of-truth docs
```

Use official docs to justify principles. Use implementation references to understand mechanism shape. Use repo truth to decide product behavior.

When mechanism quality is unclear, require an implementation-reference pass:

- name 2-3 mature repos, framework examples, or public code paths inspected
- compare code shape, trace surface, tests, failure handling, and ownership boundary
- record what is applicable, optional, or rejected for this repo
- do not copy code blindly and do not let external examples override local product truth

## Stop Signals

Stop or narrow when:

- implementation starts before product truth, invariant, or golden-flow evidence is named
- tests pass but the real user path still behaves like a placeholder, fallback, mock, or template
- fixture-only or partial E2E evidence is being used to claim product readiness
- a report, matrix, candidate bundle, or closeout artifact replaces real product capability
- AGENTS.md is growing into an encyclopedia instead of pointing to repo truth
- a skill, test, or deterministic checker is becoming the owner of product semantics
- completion language says done, ready, production, or self-use without naming the evidence level
- Golden Sets, holdouts, browser suites, or prompt contracts are patched before failure family, code references, mechanism owner, and targeted E2E plan are named
- long EDD runs repeatedly move failures between cases instead of shrinking one named failure family
- best-practice rationale cites only official docs when the local mechanism is unclear and no mature implementation reference was inspected

## Handoff Matrix

- Direction is disputed, scope may be wrong, or the slice may not belong now: `run-slice-direction-challenge-subagent`
- Build order and dependency sequencing after direction is accepted: `sequence-capability-work`
- Architecture, bounded context, dependency direction, module ownership: `check-architecture-boundaries`
- LLM vs deterministic vs human ownership: `assign-decision-ownership`
- Agentic evals, golden sets, trace replay, fixture boundaries, fake-pass prevention: `design-agentic-evals`
- Evidence claims, readiness, completion, all-green language: `narrow-evidence-claims`
- Shadow/canary/live/user-facing/mutation authority: `gate-agent-activation`
- CI, pre-PR, PR readiness, merge queue, deploy gate: `gate-delivery-readiness`
- UI workflow and acceptance: `define-uiux-intent` or `review-rendered-uiux`
- Security model or red-team plan: `red-team-application-security`
- Code taste, DSA, complexity, hot path, unnecessary abstraction: `review-code-excellence`

## Source Basis

This reference distills the cross-project whitepaper:

`context-infrastructure/docs/AI_DEVELOPMENT_BLUEPRINT_WHITEPAPER.md`

Core principle: repo knowledge is the system of record; skills route and operationalize the workflow, but do not replace product specs, invariants, evidence artifacts, or completion gates.
