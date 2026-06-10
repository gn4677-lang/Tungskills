---
name: application-abuse-review
description: "Use for authorized defensive review of product/business-logic abuse or agentic/LLM application attack surfaces that are not covered by Codex Security repo or diff scans: workflow abuse, tenant/action misuse, prompt/tool/memory/RAG abuse, or user-visible trust boundary risk."
---

# Application Abuse Review

## Core

Use this only for authorized defensive reasoning where product behavior, workflow rules, or agentic surfaces may be abused.

Primary owner: business-logic abuse, product workflow misuse, and agentic/LLM trust-boundary review not covered by Codex Security scans.

Does not own: repository-wide scans, PR/diff scans, validation, attack-path analysis, or security bug fixes. Use `codex-security:*` for those.

## Scope Rules

- Confirm the target and defensive scope.
- Pick one primary trust boundary: auth/session, tenant/object access, workflow state, storage/data exposure, prompt/tool boundary, memory/RAG boundary, or notification/action authority.
- Name the security invariant: no unauthorized read, mutation, impersonation, escalation, data leak, or unsafe action.
- Keep hypothesis, observed evidence, and validated exploit separate.
- Do not provide offensive operational guidance, persistence, stealth, credential theft, evasion, or live exploitation steps.

## Review Families

Choose one:

- Business logic: ordering, quota, approval, replay, workflow state, rate/limit bypass.
- Authorization: tenant, object, property, action, role, or capability boundary.
- Agentic/LLM: prompt injection, tool misuse, memory poisoning, RAG poisoning, MCP/tool boundary, hidden action.
- User trust: false success, unsafe notification, unapproved mutation, missing undo/suppression.

## Output

```text
Authorized target:
Trust boundary:
Abuse family:
Invariant:
Hypothesis:
Evidence/proof gap:
Owner/handoff:
```

Use prose for small checks.

## Handoffs

- Use `codex-security:security-scan` for repository or scoped-path scans.
- Use `codex-security:security-diff-scan` for PR/commit/branch diffs.
- Use `codex-security:validation` or `codex-security:attack-path-analysis` when already inside those phases.
- Use `assign-system-boundaries` when the issue is truth/action ownership rather than attacker behavior.
- Use `prove-agentic-capability` for adversarial regression or activation gates.

## Stop Signals

Stop or narrow when authorization is unclear, the target is live without approval, the ask requests offensive exploitation, or the evidence is only model speculation.
