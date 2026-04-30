---
name: evidence-claim-integrity
description: Use when claiming or summarizing done, complete, fixed, ready, safe, all passed, green, can proceed, no issues, test/eval/CI/benchmark status, runner reports, trace evidence, parity, coverage, human review, production readiness, skipped tests, timeouts, mocks, partial failures, repeated strict passes, model portability, or incomplete reports. Use when Codex encounters 可以說完成嗎, ready 嗎, 能不能上傳, 有證據嗎, 連續多輪都過, 測試沒跑, or 不要亂說全過.
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

## Heuristics

| If you see | Allowed claim | Forbidden claim |
| --- | --- | --- |
| Pytest or unit tests passed | The named tests passed. | Feature complete. |
| Runner green but trace missing | Runner completed its visible checks. | Full eval pass. |
| Bundle P0 passed but founder review not run | P0 runner passed; founder status not run. | Ready for E2E or bundle complete. |
| One benchmark case fixed | That case is fixed. | Failure family closed. |
| All visible checks passed | Visible checks passed. | No issues or production ready. |
| Timeout, skipped tests, mocks, or partial report | Evidence is incomplete. | All passed. |
| Repeated strict harness runs passed | That harness passed under those model/scaffold/environment settings. | Generally stable, model-portable, production ready, or architecture optimal. |

## Stop Signals

Stop or narrow when:

- mixed status is being compressed into `all good`
- missing artifacts are hidden in a success summary
- green infrastructure is treated as product correctness
- a local test result is used as architecture, readiness, or production evidence
- a report says pass but also says partial, interrupted, skipped, mocked, or not run

## Verification

Before finalizing, name the evidence and its boundary: command output, report path, trace artifact, coverage result, parity audit, human/founder status, CI job, or explicit not-run status.
