# Parallel Agent Merge Governance

Use this reference when several agents, teams, capabilities, or domains are producing PRs against the same trunk and merge readiness is no longer equivalent to branch-local completion.

## Core Principle

Parallel development should optimize for trunk-safe integration, not for maximizing open implementation PRs.

A PR is merge-ready only when the current target branch plus the PR has been validated. A green check on an old branch ref is evidence for that branch ref, not for the current merge result.

## Shift-Left Gate Layers

Move repeatable integration feedback as early as possible while leaving combined-target validation to the merge queue.

| Layer | Purpose | Typical checks | Allowed claim |
| --- | --- | --- | --- |
| `pre_pr_gate` | Contributor or agent can self-check before opening a PR. | Targeted tests, lint or diff hygiene, required report completeness, ownership/boundary/dependency checks, parent/base signal. | Ready to open PR. |
| `pr_readiness_gate` | Open PR is eligible to enter an integration queue. | Required checks, required report present, parent/stack dependency declared, no child queued before parent, no blocking label or review state. | Queue-ready. |
| `merge_queue_gate` | Combined target-branch candidate can land. | `merge_group` required checks, combined integration tests, branch protection/ruleset, target branch candidate evidence. | Merge-ready. |

Keep the layers intentionally different. A fast pre-PR gate helps builders avoid obvious misses; it should not become the full merge queue suite. The merge queue should validate the combined candidate, not discover missing reports, missing parent declarations, or basic boundary evidence that could have been caught earlier.

## Recommended Classifications

| Situation | Preferred verdict | Reason |
| --- | --- | --- |
| Current mainline capability, current base, required checks pass | `merge_candidate` | The slice is aligned with trunk and backed by current evidence. |
| Current mainline capability, stale base | `rebase_required` | Branch-local evidence may not apply to the target branch. |
| Required check failed, pending, or missing | `fix_gate` | Merge safety is not established. |
| Future-wave implementation with runtime effects | `hold_as_shadow` | The code may be useful, but it is not mainline-ready. |
| Future-wave guard, contract, schema, or no-runtime-effect slice | `extract_only` | Keep integration value without activating the future capability. |
| Missing track report or unclear owner | `needs_review` | The merge surface is underspecified. |
| Direct mutation, active route, scheduler, DB migration, or truth-owner change without approval | `stop` | Runtime authority is changing before governance catches up. |

## Merge Debt Matrix Fields

When building or reviewing a matrix, prefer explicit fields:

```yaml
pr_number:
track:
base_branch:
head_branch:
stack_role: root | middle | leaf | standalone
mainline_status: mvp_mainline | future_shadow | governance_guard | dependency_bump | unknown
ci_status: pass | fail | pending | incomplete
base_drift_status: current | stale_to_main | stale_contract_detected
pre_pr_gate_status: pass | fail | not_run | not_applicable
pr_readiness_status: pass | fail | incomplete | not_applicable
merge_queue_status: pass | fail | pending | not_run | not_applicable
queue_eligibility: eligible | blocked | not_applicable
parent_dependency_status: declared | missing | blocked | not_applicable
required_report_status: complete | incomplete | missing | not_applicable
missing_builder_artifacts: []
merge_group_check_status: configured | missing_trigger | unavailable | unknown
boundary_status: pass | fail | needs_review
deterministic_boundary_status: pass | fail | needs_review
runtime_activation_status: inactive | suspicious | active
size_budget_status: pass | warning | fail
recommended_verdict: merge_candidate | extract_only | rebase_required | fix_gate | hold_as_shadow | needs_review | stop
blocking_reasons: []
safe_next_action:
```

## Rules

1. Do not classify a PR as `merge_candidate` if it is stale to the current target branch.
2. Do not classify a PR as `merge_candidate` if any required check is failed, pending, missing, or not run on the merge result.
3. Do not merge future-wave implementation just because it is useful later; extract guard, contract, schema, or no-runtime-effect integration slices.
4. Do not let a draft PR become implicit scope commitment. Draft means evidence and design can continue without mainline merge permission.
5. Limit stacks. If a stack is too deep or too old to keep realigned, stop adding leaves and pay down base drift first.
6. Require human approval before rebase, force-push, branch rewrite, merge, push, or PR publication on another agent's branch.
7. If GitHub merge queue is unavailable, use a scripted matrix plus manual approval as the queue substitute.
8. Do not make the merge queue discover mechanical PR incompleteness; repeated integration-owner repairs should become pre-PR or PR-readiness gates.
9. Do not confuse gate claims: pre-PR pass means ready to open PR, PR-readiness pass means eligible for queue, merge-queue pass means the combined target candidate can land.
10. GitHub Actions workflows used as required merge queue checks need a `merge_group` trigger.

## Gate Design Rules

- Keep pre-PR gates fast, local, and track-specific.
- Put required reports, dependency declarations, obvious boundary checks, and targeted tests before PR publication or queue entry.
- Put expensive combined integration checks in the merge queue or manual queue simulation.
- Let the integration owner maintain gate definitions and resolve queue ordering; do not rely on the integration owner to repeatedly patch missing builder artifacts by hand.
- If the same queue failure appears more than twice, turn it into an earlier gate or an explicit report field.

## Track Report Minimum

Every PR that participates in a parallel train should state:

```yaml
track:
capability_layer:
mainline_status:
runtime_truth_changed: true | false
user_facing_changed: true | false
mutation_changed: true | false
manager_or_orchestration_changed: true | false
db_or_migration_changed: true | false
product_readiness_claimed: true | false
```

## Handoffs

- Use `sequence-capability-work` to decide whether the work belongs to the current mainline or a future wave.
- Use `check-architecture-boundaries` when active routes, public APIs, data models, imports, schedulers, or ownership boundaries change.
- Use `gate-agent-activation` when a PR would move a capability from contract or shadow toward live, user-facing, or mutation-bearing behavior.
- Use `narrow-evidence-claims` before saying a PR is green, merge-ready, deploy-ready, or safe.
