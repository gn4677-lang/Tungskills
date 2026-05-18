---
name: gate-delivery-readiness
description: "Use when deciding CI/CD, pre-PR, PR readiness, merge queue, merge_group checks, queue eligibility, stale base, base drift, draft/stacked PRs, over-split PR debt, wrapper/evidence wiring, required checks, branch protection, release gates, deploy readiness, rollback, or whether green checks mean open-PR, queue, merge, deploy, or release ready."
---

# Gate Delivery Readiness

## Action Protocol

Use this as a delivery gate protocol. Keep pre-PR, PR readiness, merge queue, deploy, release, and production claims separate.

## Overview

Use this to judge delivery safety when pipeline evidence, platform enforcement, and readiness claims may diverge.

Core principle: CI output is evidence, but branch protection, deployment gates, and human approval decide whether that evidence is enforceable.

Positive default: turn delivery evidence into the strongest valid merge, queue, release, or deploy decision while keeping product progress, CI status, and platform enforcement separate.

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
slice_acceptance_record: ...
missing_builder_artifacts: ...
required_report_status: ...
merge_group_check_status: ...
over_split_pr_debt: none | warning | blocking
wrapper_evidence_wiring_role: necessary_gate_visibility | status_projection | unclear | not_applicable
artifact_log_retention: ...
deploy_or_release_gate: ...
smoke_or_rollback_plan: ...
claim_boundary: ...
handoff_skills: ...
decision: proceed | narrow | stop
```

## Decision Rules

1. Keep delivery layers separate: pre-PR, PR-ready, queue-ready, merge-ready, deploy-ready, release-ready, production-ready.
2. CI green proves only completed CI scope. It does not prove merge, deploy, product, or activation readiness.
3. A stale branch or untested merge result against the current target branch is not merge-ready.
4. If platform-enforced gates are unavailable, name the manual fallback controls instead of pretending enforcement exists.
5. A placeholder deployment workflow is not CD.
6. Future-wave or non-mainline PRs default to draft, hold-as-shadow, or extract-only unless they are small guard/contract/no-runtime-effect slices.
7. Multi-agent work needs base freshness, required checks, boundary review, and explicit queue/merge ownership; branch-local CI or subagent approval is not merge authorization.
8. Repeated integration-owner fixes should move left into pre-PR or PR-readiness gates.
9. Merge queue checks need `merge_group` coverage when the platform queue is used.
10. Adversarial security evidence is separate from CI, merge, deploy, and rollout gates.
11. Delivery evidence does not approve product direction; non-trivial new slices need user/controller/direction-challenge acceptance.
12. Many tiny green PRs can still create delivery risk when they only move artifacts, reports, status projections, or closeout visibility for the same blocker.

## Heuristics

| If you see | Prefer |
| --- | --- |
| "CI green, can I merge/deploy?" | Separate CI evidence, merge enforcement, deploy gate, and claim boundary. |
| Private/free repo lacks branch protection | Record unavailable enforcement and manual fallback governance. |
| Stale PR base with green branch CI | Require update or merge simulation against current target. |
| Future-wave implementation wants main | Extract guard/contract/no-runtime-effect slice; keep implementation draft/shadow. |
| Builder asks what to run before PR | Provide track-specific pre-PR gate, not the full queue suite. |
| Many small PRs only move reports/artifacts | Mark PR debt; consolidate or declare a train before queueing more leaf PRs. |

## Stop Signals

Stop or narrow when:

- CI green, pre-PR pass, queue-ready, merge-ready, deploy-ready, and production-ready are treated as one status
- required checks, branch protection/ruleset, merge queue, or manual fallback governance is unknown
- a stale branch result is used as current target-branch evidence
- a deployment workflow is a placeholder but described as CD
- queue, CI, or PR readiness is used to justify what should be built next
- a set of wrapper/evidence wiring PRs is treated as harmless because each individual PR is small
- closeout/report/artifact plumbing is queued without naming the existing gate or decision it makes visible
- green checks, queue eligibility, or mergeability are used as evidence of blocker removal or product capability

## Verification

Before finalizing, name the evidence: workflow files, `gh` output, GitHub settings screenshots, branch protection/ruleset status, environment list, workflow permissions, artifact/log retention, pre-PR gate result, PR readiness result, CI run status, red-team gate status, merge queue or manual queue artifact, `merge_group` trigger, base freshness, merge simulation result, deploy smoke result, rollback evidence, or explicit not-run status.
