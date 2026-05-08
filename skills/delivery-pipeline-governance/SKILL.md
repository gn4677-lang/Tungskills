---
name: delivery-pipeline-governance
description: Use when designing, reviewing, or diagnosing CI/CD, GitHub Actions, pre-PR gates, PR readiness gates, merge queue gates, merge_group checks, queue eligibility, integration-owner workflows, release gates, deployment workflows, required checks, branch protection or ruleset availability, PR debt, stale base, base drift, draft PR, stacked PRs, parent dependencies, parallel PRs, multi-agent development, workflow permissions, artifacts, logs, smoke tests, rollback, red-team gates, AppSec gates, adversarial security gates, contract-hardening debt, semantic audit missing, or whether CI green means open-PR, queue, merge, deploy, or release ready. Do not use as primary for fixing failing PR logs; route that to gh-fix-ci.
---

# Delivery Pipeline Governance

## Overview

Use this to judge delivery safety when pipeline evidence, platform enforcement, and readiness claims may diverge.

Core principle: CI output is evidence, but branch protection, deployment gates, and human approval decide whether that evidence is enforceable.

Hard stop: CI green, pre-PR pass, queue-ready, merge-ready, deploy-ready, and production-ready are separate claims.

## Read First

Read `references/private-free-github-delivery-patterns.md` when the repo is private/free, branch protection or environments may be plan-limited, a workflow is only a placeholder, or a merge/deploy/readiness claim depends on GitHub Actions settings.

Read `references/parallel-agent-merge-governance.md` when multiple agents, capabilities, domains, draft PRs, stacked PRs, stale branches, future-wave work, pre-PR gates, PR readiness gates, merge queue gates, or manual queue decisions affect merge readiness.

## Default Output

```text
repo_visibility: public | private | unknown
platform_controls_available: ...
platform_controls_unavailable: ...
fallback_controls: ...
workflow_permission_posture: ...
required_checks_or_manual_equivalent: ...
pre_pr_gate: ...
pr_readiness_gate: ...
merge_queue_gate: ...
queue_eligibility: ...
missing_builder_artifacts: ...
required_report_status: ...
merge_group_check_status: ...
artifact_log_retention: ...
deploy_or_release_gate: ...
smoke_or_rollback_plan: ...
claim_boundary: ...
handoff_skills: ...
decision: proceed | narrow | stop
```

## Decision Rules

1. Do not assume protected branches, required status checks, rulesets, environment secrets, or required reviewers are available in a private/free repository.
2. Treat GitHub API `403` for branch protection as platform-capability evidence, not as a token problem, after `gh auth status` confirms the expected account and `repo` scope.
3. A placeholder deployment workflow is not CD. It can prove only that a manual placeholder workflow exists.
4. CI green proves the completed CI scope. It does not by itself prove merge-ready, deploy-ready, production-ready, or user-facing safe.
5. When platform-enforced gates are unavailable, name the fallback controls: draft PR, explicit human approval, no direct main push discipline, fresh CI evidence, release checklist, and rollback/no-deploy fallback.
6. Use `gh-fix-ci` when the primary task is failing PR check log inspection or repairing an observed Actions failure.
7. Use `evidence-claim-integrity` before claiming all green, ready, merge-safe, deploy-safe, or production-ready.
8. Use `agent-runtime-activation-ladder` when the pipeline would turn on shadow, canary, user-facing, live provider, or mutation-bearing behavior.
9. CI green does not make a merge safe when semantic audit, holdout coverage, legal-flow representability, or contract-hardening debt is unresolved.
10. When a PR tightens prompt, schema, guard, or runtime contract because of eval/live evidence, require the repo's manual or automated hardening gate before calling it merge-ready.
11. A PR with a stale base or untested merge result against the current target branch is not merge-ready even if its own branch checks are green.
12. Future-wave or non-mainline capability PRs default to draft, hold-as-shadow, or extract-only unless the change is a small guard, contract, schema, or no-runtime-effect integration slice.
13. In multi-agent development, do not let task completion, subagent approval, or branch-local CI imply merge authorization; require base freshness, required checks, boundary review, and explicit human merge choice.
14. If platform merge queue is unavailable, use a scripted merge-debt matrix or manual queue artifact as the fallback governance surface.
15. Shift repeated integration-owner fixes left: recurring missing artifacts, missing reports, wrong parent dependencies, stale-base issues, or boundary misses should become pre-PR or PR-readiness gates.
16. Keep gate layers distinct: pre-PR gate means ready to open a PR; PR readiness gate means eligible to enter an integration queue; merge queue gate means the combined target-branch candidate can land.
17. GitHub Actions workflows used as required merge queue checks need a `merge_group` trigger; otherwise queue checks may never report on the merge group.
18. Adversarial security evidence is a separate gate from CI, PR readiness, merge readiness, deploy readiness, and rollout permission; name where that gate is enforced and what it covers.

## Heuristics

| If you see | Prefer |
| --- | --- |
| Private repo + branch protection API 403 | Record platform enforcement unavailable; design fallback governance. |
| `cd.yml` only echoes placeholder text | Say CD is not implemented; do not infer deployability. |
| Actions default token is read-only | Keep as safer default; escalate job permissions only where required. |
| "CI green, can I merge/deploy?" | Separate CI evidence, merge enforcement, deployment gate, and claim boundary. |
| CI green but semantic or contract-hardening debt exists | Narrow; require the hardening gate or manual equivalent before merge-safe claims. |
| Required checks unavailable | Use manual equivalents; do not describe them as platform-enforced. |
| Multiple draft PRs from parallel agents | Build a PR debt matrix before merging by convenience or age. |
| Stale PR base with green branch CI | Require rebase/update or merge simulation against current target branch. |
| Future-wave implementation wants to enter main | Extract guard/contract/no-runtime-effect slice; keep implementation draft or shadow. |
| Integration owner repeatedly fixes the same missing PR artifact | Add a pre-PR or PR-readiness check instead of relying on human memory. |
| Builder asks what to run before opening PR | Provide a track-specific pre-PR gate, not the full merge queue suite. |
| PR is green but queue entry is blocked | Separate PR readiness from merge-group readiness and name the missing queue condition. |
| CI green but adversarial security evidence missing | Narrow; CI and red-team results are separate gates. |

## Stop Signals

Stop or narrow when:

- CI green, pre-PR pass, queue-ready, merge-ready, deploy-ready, and production-ready are treated as one status
- required checks, branch protection/ruleset, merge queue, or manual fallback governance is unknown
- a stale branch result is used as current target-branch evidence
- a deployment workflow is a placeholder but described as CD

## Verification

Before finalizing, name the evidence: workflow files, `gh` output, GitHub settings screenshots, branch protection/ruleset status, environment list, workflow permissions, artifact/log retention, pre-PR gate result, PR readiness result, CI run status, red-team gate status, merge queue or manual queue artifact, `merge_group` trigger, base freshness, merge simulation result, deploy smoke result, rollback evidence, or explicit not-run status.
