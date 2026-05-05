# Private/Free GitHub Delivery Patterns

Use this reference when CI/CD decisions depend on GitHub plan limits, repository visibility, workflow permissions, or delivery claims.

## Source Anchors

- OpenAI skill guidance: `description` is the primary trigger; keep `SKILL.md` concise and move detailed variants to references.
- GitHub protected branches: public repositories can use protected branches on Free; private repositories require GitHub Pro, Team, Enterprise Cloud, or Enterprise Server.
- GitHub deployment environments: environment secrets in private/internal repositories require Pro, Team, or Enterprise; required reviewers and other protection rules have limited private-repo availability outside Enterprise.
- GitHub Actions secure use: prefer least-privilege `GITHUB_TOKEN`, keep default contents read-only when possible, escalate permissions per job, and avoid exposing secrets in logs.
- GitHub Actions third-party actions: full-length commit SHA pinning is the immutable option; tags are convenient but movable.
- DORA continuous delivery: CI/CD should keep software deployable, provide fast feedback, and distinguish continuous delivery from continuous deployment.
- DORA deployment automation: deployable packages, scripts/config in version control, smoke tests, environment-specific config outside packages, idempotent steps, and rollback/recovery evidence are core practices.

## Platform Control Taxonomy

| Control | What It Proves | Private/free caveat |
| --- | --- | --- |
| Workflow exists | Automation is defined in `.github/workflows`. | Does not prove it is required before merge or deploy. |
| CI run green | The named jobs completed under that trigger and commit. | Does not prove branch protection, deployability, or product readiness. |
| Branch protection / ruleset | GitHub enforces merge requirements. | Private/free may return 403 and require Pro/public visibility. |
| Required checks | Specific status checks must pass before merge. | Only meaningful when branch protection/rulesets are actually active. |
| Environment | Workflow job can target a named deployment environment. | Secrets/protection rules may be plan-limited for private/free. |
| Workflow permissions | Default or job-level `GITHUB_TOKEN` posture. | Read-only default is safer, but write jobs must be explicit. |
| Action pinning | Supply-chain immutability posture for actions. | Full SHA pinning is strongest but adds maintenance overhead. |
| Artifact/log retention | Evidence availability window. | Retention does not make evidence complete or valid. |

## Private/Free Decision Pattern

When branch protection API returns `403` after the expected user is authenticated with `repo` scope:

```yaml
platform_controls_unavailable:
  branch_protection: unavailable_on_current_plan_or_visibility
  required_status_checks: not_platform_enforced
evidence:
  - gh_auth_account
  - repo_visibility
  - branch_protection_api_error
fallback_required: true
```

Do not ask for a stronger PAT unless authentication is actually wrong. A token cannot unlock a feature that the plan or visibility does not provide.

## Fallback Governance For Private/Free Repos

Use these controls when GitHub cannot enforce the gate:

- Draft PR as the default publish shape, even for solo work.
- Manual merge checklist that names required local and CI evidence.
- Explicit no-direct-main-push discipline unless the user overrides it.
- Fresh `gh workflow` or CI run evidence before merge-ready claims.
- Release checklist that separates "CI green", "deploy workflow exists", "smoke tested", and "rollback known".
- Manual human approval before deploy, live provider activation, user-facing rollout, or mutation-bearing changes.
- Artifact/log retention review so evidence is not lost before review.
- CODEOWNERS or review convention may help discovery, but without platform enforcement it is still a convention.

## Claim Boundaries

| Evidence | Allowed Claim | Forbidden Claim |
| --- | --- | --- |
| CI jobs green | Named CI jobs passed on the observed ref. | Merge is protected, deploy is safe, production is ready. |
| `cd.yml` echoes placeholder text | A manual placeholder workflow exists. | CD is implemented. |
| Branch protection API 403 | Platform merge enforcement is unavailable under current plan/visibility. | Token is definitely broken. |
| No environments returned | No environments are configured. | Deployment protection is configured. |
| Read-only workflow token | Default token posture is safer. | All workflow jobs are safe or least-privilege. |
| Artifacts uploaded | Reports are available for review. | Reports prove the product is ready. |

## Checklist

1. Read workflow files and identify trigger scope: `push`, `pull_request`, `workflow_dispatch`, `workflow_call`, `schedule`.
2. Check repo visibility and branch protection/ruleset status.
3. Check environments and whether deploy protection/secrets are actually configured.
4. Check Actions permissions: allowed action sources, full-SHA pinning requirement, artifact/log retention, fork PR settings, default `GITHUB_TOKEN`.
5. Classify CD as one of: absent, placeholder, diagnostic-only, staging deploy, production deploy, or release packaging.
6. Name fallback controls when platform enforcement is unavailable.
7. Route readiness claims to `evidence-claim-integrity`.
8. Route runtime rollout stage decisions to `agent-runtime-activation-ladder`.

## Sources

- https://github.com/openai/skills/blob/main/skills/.system/skill-creator/SKILL.md
- https://docs.github.com/en/repositories/configuring-branches-and-merges-in-your-repository/managing-protected-branches
- https://docs.github.com/en/actions/reference/workflows-and-actions/deployments-and-environments
- https://docs.github.com/en/actions/reference/security/secure-use
- https://dora.dev/capabilities/continuous-delivery/
- https://dora.dev/capabilities/deployment-automation/
