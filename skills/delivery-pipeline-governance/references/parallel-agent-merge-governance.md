# Parallel Agent Merge Governance

Use this reference when several agents, teams, capabilities, or domains are producing PRs against the same trunk and merge readiness is no longer equivalent to branch-local completion.

## Core Principle

Parallel development should optimize for trunk-safe integration, not for maximizing open implementation PRs.

A PR is merge-ready only when the current target branch plus the PR has been validated. A green check on an old branch ref is evidence for that branch ref, not for the current merge result.

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

- Use `capability-dependency-build-order` to decide whether the work belongs to the current mainline or a future wave.
- Use `architecture-boundary-governance` when active routes, public APIs, data models, imports, schedulers, or ownership boundaries change.
- Use `agent-runtime-activation-ladder` when a PR would move a capability from contract or shadow toward live, user-facing, or mutation-bearing behavior.
- Use `evidence-claim-integrity` before saying a PR is green, merge-ready, deploy-ready, or safe.
