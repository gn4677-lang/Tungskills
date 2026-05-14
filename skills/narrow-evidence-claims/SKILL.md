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
Allowed claim: ...
Forbidden claim: ...
Decision: proceed | narrow | stop
```

## Decision Rules

1. A unit test pass only proves that unit test pass.
2. A runner green only proves the runner's completed scope.
3. A partial, timed-out, interrupted, mocked, skipped, or incomplete run cannot support a full pass claim.
4. Final answer quality does not prove tool calls, handoffs, guard decisions, state transitions, or traces were correct.
5. Do not claim readiness if required parity, coverage, trace, human/founder review, or production checks are missing.
6. If evidence is missing, narrow the claim instead of making a broad success statement.
7. If evidence contradicts product truth, product truth wins and the eval/report is incomplete or misaligned evidence.
8. If you did not personally run or inspect the evidence in the current task context, say so.
9. Truncated shell, terminal, or `rg` output supports only partial inspection unless a complete artifact, count summary, or bounded scan metadata proves the scan scope.
10. For large repository searches, prefer bounded JSON artifacts with `truncated=true/false`; do not treat terminal display as complete evidence.
11. A passing PR check on a stale branch proves only that checked ref passed; it does not prove the PR is merge-ready against the current target branch.
12. A draft or open PR proves work exists for review; it does not prove the capability is still in scope, current with main, or safe to merge.
13. Lint, type, formatting, or unit-test passes do not by themselves prove code is clean, maintainable, readable, or efficient; route code-health claims through `review-code-excellence`.
14. A pre-PR gate pass supports only "ready to open PR"; it does not prove queue-ready, merge-ready, deploy-ready, or product-ready.
15. A PR readiness pass supports only queue eligibility; it does not prove the merge queue candidate will pass.
16. A merge queue pass supports the tested target-branch candidate; it does not prove deployment or production readiness unless deploy gates also passed.
17. Use `gate-delivery-readiness` when the primary work is diagnosing CI/CD, required checks, merge queue eligibility, branch protection, base drift, deployment gates, or release readiness; this skill narrows the claim after that evidence is named.
18. A red-team pass, pentest, or security review supports only the tested attack surface and evidence boundary; it does not prove general safety against XSS, SQLi, SSRF, auth bypass, IDOR/BOLA, exfiltration, prompt injection, or other untested families.
19. A mainline/detour checklist, CI pass, merged PR, or queue position does not prove that the next slice is directionally justified. Route direction claims through `run-slice-direction-challenge-subagent` or name the explicit user/controller acceptance evidence.
20. A keyword, regex, dictionary, term-list, or lexical smoke pass proves only that lexical scaffold behavior ran; it does not prove semantic support, groundedness, category truth, user intent, or product truth.
21. A semantic support claim requires its evidence boundary: cited span or source region, support state, provenance, product-approved oracle, model/human grader, or explicit review-needed status.
22. Browser execution, route navigation, persistence checks, fixture-manager passes, and `live_llm_invoked=true` do not by themselves prove user-perceived AI capability, natural conversation, intent discrimination, or manager-style product behavior.
23. A deterministic renderer, template response, or canned copy can support output-safety and factual-display claims, but not a claim that the final answer is LLM-composed or conversationally intelligent unless that response owner was actually exercised and evaluated.

## Heuristics

| If you see | Allowed claim | Forbidden claim |
| --- | --- | --- |
| Pytest or unit tests passed | The named tests passed. | Feature complete. |
| Runner green but trace missing | Runner completed its visible checks. | Full eval pass. |
| Agent-written or AI-generated tests passed | Those tests passed under their own oracle. | The test oracle is correct, coverage is enough, or product truth is verified. |
| Bundle P0 passed but founder review not run | P0 runner passed; founder status not run. | Ready for E2E or bundle complete. |
| One benchmark case fixed | That case is fixed. | Failure family closed. |
| All visible checks passed | Visible checks passed. | No issues or production ready. |
| Timeout, skipped tests, mocks, or partial report | Evidence is incomplete. | All passed. |
| Repeated strict harness runs passed | That harness passed under those model/scaffold/environment settings. | Generally stable, model-portable, production ready, or architecture optimal. |
| Full suite passed after prompt/schema/contract hardening | That suite passed under the new scaffold and evidence scope. | Product semantics are correct, model-portable, or readiness is unlocked. |
| Single-profile live evidence passed | That profile produced diagnostic evidence. | Provider portability, production readiness, or private-use readiness. |
| Browser green with fixture or template output | The UI route and checked state passed. | The AI product experience or natural assistant behavior is proven. |
| Live manager invoked but deterministic renderer wrote final text | The structured manager path ran. | Final answer quality, tone, or natural-language intelligence is proven. |
| Red-team run found no issue | The tested attack set produced no confirmed issue. | Safe against prompt injection, exfiltration, or agent attacks in general. |
| Large `rg` or shell output was truncated | The visible subset was inspected. | Full scan completed, no references exist, or the whole folder was checked. |
| Bounded scan artifact says `truncated=true` | Results are partial up to the stated limit. | Complete absence, complete coverage, or no remaining matches. |
| Branch CI passed before main advanced | That branch ref passed those checks. | Current-base merge-ready. |
| Draft PR exists for future work | The future work has a review artifact. | Mainline scope approved or merge-safe. |
| Mainline checklist filled inline | The checklist fields were completed. | Direction was independently challenged or the slice is justified. |
| Lint and tests passed after refactor | The named checks passed. | The refactor is behavior-preserving, readable, or efficient without review evidence. |
| Pre-PR gate passed | Ready to open a PR for review. | Queue-ready, merge-ready, deploy-ready, or product-ready. |
| PR readiness gate passed | Eligible to enter the integration queue. | Merge result is safe. |
| Merge queue or `merge_group` passed | The tested target-branch candidate passed that queue scope. | Production-ready or deploy-safe without deploy evidence. |
| Keyword or term-list support check passed | The lexical scaffold check passed. | Semantic support, groundedness, or product truth is proven. |
| Cited evidence span is present and validated | The cited span exists in the named source boundary. | The semantic interpretation is correct unless a model/human/product oracle judged support. |

## Stop Signals

Stop or narrow when:

- mixed status is being compressed into `all good`
- missing artifacts are hidden in a success summary
- green infrastructure is treated as product correctness
- a local test result is used as architecture, readiness, or production evidence
- agent-generated tests are treated as independent evidence without reviewing their oracle, coverage, and product-truth alignment
- tests assert implementation details or harness behavior while the claim talks about user-visible product truth
- a full-suite pass after hardening is used to claim product semantic correctness without holdout or representability evidence
- single-profile live evidence is used to claim model portability or readiness
- terminal, shell, or search output is truncated but summarized as complete
- a broad no-result claim is made without full scan metadata or a complete artifact
- a report says pass but also says partial, interrupted, skipped, mocked, or not run
- PR status is summarized as merge-ready without current-base evidence or merge simulation
- clean, maintainable, optimized, or efficient is claimed from green checks without code-health or performance evidence
- direction, alignment, or "best next slice" is claimed from an inline checklist without source-of-truth and direction acceptance evidence
- pre-PR, queue-ready, merge-ready, and deploy-ready are collapsed into one "ready" claim
- keyword, regex, dictionary, or term-list checks are summarized as semantic proof
- lexical smoke or negative guard output is used to claim groundedness, category support, or product truth
- shell, browser, fixture, live-invocation, or persistence evidence is summarized as "the agent works" without naming the actual user-visible AI behavior that was exercised
- final response quality is claimed from marker checks or template copy without a response-owner trace, representative prompts, and a human/model rubric when the claim is subjective

## Verification

Before finalizing, name the evidence and its boundary: command output, report path, trace artifact, coverage result, parity audit, human or founder status, CI job, tested attack surface, or explicit not-run status.

## Handoffs

- Use `design-agentic-evals` when the missing evidence is eval oracle quality, regression coverage, holdout design, trace replay, or whether agent-written tests prove product truth.
- Use `assign-decision-ownership` when tests, guards, validators, or runners may be encoding semantic truth, intent, route, action, or product decision ownership.
- Use `assign-decision-ownership` when keyword scaffolds, term lists, regexes, dictionaries, or lexical hints may be treated as semantic proof.
- Use `gate-delivery-readiness` when the primary question is CI/CD, pre-PR, PR readiness, merge queue eligibility, base drift, deploy gates, or release readiness.
- Use `review-code-excellence` when clean, maintainable, readable, efficient, optimized, or no-behavior-refactor claims need code-health evidence.
- Use `red-team-application-security` when security, pentest, red-team, prompt-injection-safe, or exfiltration-safe claims need attack-surface evidence.
