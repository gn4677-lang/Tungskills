---
name: evidence-claim-integrity
description: Use when claiming or summarizing done, fixed, ready, safe, clean, maintainable, efficient, optimized, all passed, green, no issues, test/eval/CI/benchmark/PR status, pre-PR pass, queue-ready, merge queue, merge_group, required report, merge-ready, deploy-ready, production-ready, stale base, base drift, PR debt, AI-generated or self-confirming tests, full-suite false green, pass after hardening, single-profile evidence, model portability, truncated output, partial scan, skipped tests, timeouts, mocks, partial failures, or incomplete reports. Trigger on 可以說完成嗎, ready 嗎, 有證據嗎, PR 可以 merge 嗎, 進 queue 嗎, code 乾淨嗎, unrun tests, or overbroad success claims.
---

# Evidence Claim Integrity

## Overview

Use this before making success, readiness, pass, or completion claims.

Core principle: match claim scope to evidence scope. Partial evidence supports only a partial claim.

## Default Output

Keep the answer compact:

```text
Claim: ...
Claim type: implementation | test | eval | readiness | production | architecture
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
13. Lint, type, formatting, or unit-test passes do not by themselves prove code is clean, maintainable, readable, or efficient; route code-health claims through `code-excellence-dsa-hygiene`.
14. A pre-PR gate pass supports only "ready to open PR"; it does not prove queue-ready, merge-ready, deploy-ready, or product-ready.
15. A PR readiness pass supports only queue eligibility; it does not prove the merge queue candidate will pass.
16. A merge queue pass supports the tested target-branch candidate; it does not prove deployment or production readiness unless deploy gates also passed.

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
| Large `rg` or shell output was truncated | The visible subset was inspected. | Full scan completed, no references exist, or the whole folder was checked. |
| Bounded scan artifact says `truncated=true` | Results are partial up to the stated limit. | Complete absence, complete coverage, or no remaining matches. |
| Branch CI passed before main advanced | That branch ref passed those checks. | Current-base merge-ready. |
| Draft PR exists for future work | The future work has a review artifact. | Mainline scope approved or merge-safe. |
| Lint and tests passed after refactor | The named checks passed. | The refactor is behavior-preserving, readable, or efficient without review evidence. |
| Pre-PR gate passed | Ready to open a PR for review. | Queue-ready, merge-ready, deploy-ready, or product-ready. |
| PR readiness gate passed | Eligible to enter the integration queue. | Merge result is safe. |
| Merge queue or `merge_group` passed | The tested target-branch candidate passed that queue scope. | Production-ready or deploy-safe without deploy evidence. |

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
- pre-PR, queue-ready, merge-ready, and deploy-ready are collapsed into one "ready" claim

## Verification

Before finalizing, name the evidence and its boundary: command output, report path, trace artifact, coverage result, parity audit, human/founder status, CI job, or explicit not-run status.
