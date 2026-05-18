---
name: narrow-evidence-claims
description: "Use before claiming or summarizing done, fixed, ready, safe, clean, maintainable, efficient, optimized, justified, aligned, all passed, green, no issues, merge-ready, deploy-ready, production-ready, security reviewed, red-teamed, prompt-injection safe, semantic support, grounded, fake pass, fixture pass, browser green, live invoked, template response, full-suite pass, partial scan, skipped tests, stale base, or incomplete evidence."
---

# Narrow Evidence Claims

## Action Protocol

Use this as a hard evidence gate. Match every success, readiness, safety, or quality claim to the exact evidence boundary or narrow the claim.

## Overview

Use this before making success, readiness, pass, or completion claims.

Core principle: match claim scope to evidence scope. Partial evidence supports only a partial claim.

Positive default: state the strongest useful claim the evidence really supports, then name the proof gaps instead of hiding them or weakening the whole result.

Hard gate: if the evidence boundary cannot be named, the claim must be narrowed or withheld.

## Default Output

Keep the answer compact:

```text
Claim: ...
Claim type: implementation | test | eval | readiness | production | architecture
Tested attack surface: ...
Evidence present: ...
Evidence missing: ...
Invariant evidence: present | missing | not_applicable
Allowed claim: ...
Forbidden claim: ...
Decision: proceed | narrow | stop
```

## Decision Rules

1. A test, runner, CI job, scan, browser check, or queue pass proves only its named scope.
2. Scenario pass does not prove invariant pass; name the invariant evidence when making a capability or readiness claim.
3. Partial, timed-out, interrupted, mocked, skipped, stale, or truncated evidence supports only a partial claim.
4. If you did not personally run or inspect the evidence in this task context, say so.
5. If evidence contradicts product truth or manual product use, the report is incomplete or misaligned.
6. Final answer quality does not prove tool calls, guard decisions, state transitions, or traces.
7. Green infrastructure does not prove product capability, architecture quality, or direction correctness.
8. Delivery states are separate: pre-PR, PR-ready, queue-ready, merge-ready, deploy-ready, production-ready.
9. A security or red-team pass covers only the tested attack surface and attack families.
10. Lint, type, formatting, and unit tests do not prove maintainability or efficiency without code-health evidence.
11. Lexical checks, term lists, regexes, and fixture labels do not prove semantic support or product truth.
12. Browser execution, route navigation, persistence, fixture manager output, or `live_llm_invoked=true` do not prove user-perceived AI capability unless the intended entrypoint, owner trace, and final response owner ran.
13. Direction claims require source-of-truth and acceptance evidence, not CI green, queue position, or a filled checklist.

## Heuristics

| If you see | Allowed claim | Forbidden claim |
| --- | --- | --- |
| Named tests passed | Those tests passed. | Feature complete. |
| Full suite passed after hardening | The suite passed under that scaffold. | Product semantics are correct. |
| Browser green with fixture/template output | The route and checked state passed. | The AI experience is proven. |
| Red-team found no issue | Tested attacks found no confirmed issue. | Generally secure. |
| `rg`/shell output truncated | Visible subset inspected. | Full scan/no references. |
| Stale branch CI passed | That branch ref passed. | Current-base merge-ready. |
| Pre-PR/PR/queue gate passed | That gate's scope passed. | Later delivery gates passed. |
| Lexical support check passed | Lexical scaffold ran. | Semantic support is proven. |

## Stop Signals

Stop or narrow when:

- mixed status is compressed into `all good`
- missing, skipped, stale, partial, mocked, or truncated evidence is hidden
- green infrastructure is treated as product correctness
- a capability or readiness claim ignores the invariant it was supposed to preserve
- agent-generated tests are treated as independent truth without oracle review
- delivery gate levels are collapsed into one "ready"
- code health, performance, security, or direction is claimed from unrelated checks
- lexical, fixture, shell, browser, persistence, or live-invocation evidence is summarized as semantic or user-perceived AI proof
- final response quality is claimed from templates or marker checks without response-owner trace and rubric evidence

## Verification

Before finalizing, name the evidence and its boundary: command output, report path, trace artifact, coverage result, parity audit, human or founder status, CI job, tested attack surface, or explicit not-run status.

## Handoffs

- Use `design-agentic-evals` when the missing evidence is eval oracle quality, regression coverage, holdout design, trace replay, or whether agent-written tests prove product truth.
- Use `assign-decision-ownership` when tests, guards, validators, or runners may be encoding semantic truth, intent, route, action, or product decision ownership.
- Use `assign-decision-ownership` when keyword scaffolds, term lists, regexes, dictionaries, or lexical hints may be treated as semantic proof.
- Use `gate-delivery-readiness` when the primary question is CI/CD, pre-PR, PR readiness, merge queue eligibility, base drift, deploy gates, or release readiness.
- Use `review-code-excellence` when clean, maintainable, readable, efficient, optimized, or no-behavior-refactor claims need code-health evidence.
- Use `red-team-application-security` when security, pentest, red-team, prompt-injection-safe, or exfiltration-safe claims need attack-surface evidence.
