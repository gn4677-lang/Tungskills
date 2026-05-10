---
name: red-team-application-security
description: "Use when running authorized defensive security review or red-team testing for websites, web apps, APIs, auth/session flows, file upload/storage, Supabase/RLS, deployment surfaces, agentic/prompt-injection surfaces, or post-fix regression. Trigger on red team, white hat, pentest, AppSec, OWASP, prompt injection, XSS, SQLi, SSRF, IDOR/BOLA, 資安測試, 紅隊, 白帽."
---

# Red-Team Application Security

## Action Protocol

Use this as an authorized defensive security protocol. Confirm scope, choose one primary attack surface, record evidence/proof gaps, and route remediation or regression.

## Overview

Use this to run authorized adversarial security reasoning for websites, apps, APIs, and AI-enabled application surfaces.

Core principle: threat model first, pick one primary trust boundary and one primary attack family, and keep discovery, validation, remediation, and rollout claims separate.

Positive default: find the most decision-relevant security weakness in authorized scope, validate what is actually exploitable, and route fixes without turning plausible risk into an overclaim.

This is not a generic code-review skill and not a malware-writing skill.

## Operating Mode

`adversarial security workflow + evidence guard`

## Read First

- Read `references/framework-and-boundary-map.md` when the scope, system type, or ownership line between web/API/AppSec, Supabase, agentic security, and delivery governance is unclear.
- Read `references/attack-family-catalog.md` when more than one attack family seems plausible or when you need a bounded probe shape.
- Read `references/security-tooling-options.md` only when you need to choose between Codex Security, Burp, ZAP, Supabase Security Advisor, Promptfoo, PyRIT, garak, or a manual Codex-only pass.

## Workflow

1. Confirm the target is authorized for defensive review or controlled red teaming.
2. Classify the primary system type and trust boundary: browser/UI, API, auth/session, storage/database, deployment/CI, business logic, or agentic/LLM.
3. Choose one primary attack family before designing probes.
4. Decide probe style: static/code review, runtime/manual, automated, or mixed.
5. Use AI/Codex to expand hypotheses, trace code paths, cluster likely findings, and draft bounded probes, but do not treat model output as proof.
6. Record observed evidence and proof gaps separately. Name the environment, tested surface, and whether the result is plausible or validated.
7. Route remediation to the correct owner instead of fixing by convenience.
8. Require replay, regression, monitoring, or revalidation before calling the issue closed.

## Default Output

Keep the answer compact:

```text
Authorized target: ...
System type: website | web app | API | auth/session | storage/database | deployment/CI | business logic | agentic/LLM
Primary trust boundary: ...
Primary threat family: ...
Attacker goal: ...
Test mode: static | runtime | automated | mixed
Available capabilities/permissions: ...
Evidence source: threat model | code path | HTTP trace | browser trace | tool transcript | artifact | none
Observed weakness: ...
Exploitability claim: plausible | validated | blocked | unknown
Impact class: auth bypass | data exposure | unauthorized action | privilege escalation | integrity loss | availability/cost | unknown
Immediate containment: ...
Fix owner: codex-security | supabase | assign-decision-ownership | runtime skill | pipeline skill | human
Regression requirement: ...
Decision: proceed | narrow | stop
```

## Attack Family Selector

| If the main risk is | Prefer this family first |
| --- | --- |
| Login, session, token, cookie, CSRF, MFA, password reset, or account recovery weakness | Authentication/session failure |
| User-supplied identifiers or object/property/function access may cross account boundaries | Authorization failure, IDOR, BOLA, or BOPLA |
| Browser-rendered content or client-side behavior may execute unsafe input | XSS, output handling, open redirect, or client trust failure |
| Server or API input may reach queries, file paths, commands, URLs, or parsers unsafely | Injection, traversal, SSRF, deserialization, or unsafe outbound |
| Workflow rules, ordering, rate limits, quotas, or state transitions can be abused | Business-logic abuse or resource consumption |
| Uploads, buckets, object storage, CDN paths, or media processing may expose data or execute unsafe content | File upload or storage boundary failure |
| Database exposure, RLS, roles, service keys, or least-privilege boundaries are weak | Data access or policy boundary failure |
| Secrets, environment variables, workflow permissions, deployment configs, or dependencies are exposed | Deployment, CI, or supply-chain boundary failure |
| Prompt injection, tool misuse, memory/RAG poisoning, or MCP manipulation is in scope | Agentic/LLM attack surface |

## Stop Signals

Stop or narrow when:

- the request is offensive, unauthorized, or aimed at live exploitation outside approved testing
- the target is a real live system and no explicit defensive scope or approval boundary is named
- the user asks for malware, persistence, stealth, credential theft, or operational evasion
- a possible weakness is being described as a validated exploit without direct evidence
- AI-generated output is being treated as sufficient proof without validation artifacts
- the real work is repository, PR, commit, or diff-only scanning rather than application/runtime/security-boundary work
- a tool choice is driving the scope before the trust boundary and attack family are named

## Verification

Before claiming anything beyond hypothesis, name:

- the exact authorized target and environment
- the tested system type and trust boundary
- the primary attack family and attacker goal
- the evidence source and proof gap
- the immediate containment if the weakness is real
- the required replay, regression, or revalidation so the issue can stay closed

## Handoffs

- Repository, PR, commit, or diff-only vulnerability scanning goes to `codex-security:security-scan`.
- Fixing an already identified security bug goes to `codex-security:fix-finding`.
- Supabase policy, RLS, storage, auth, or database configuration work goes to `supabase:supabase` and `supabase:supabase-postgres-best-practices` once the boundary is identified.
- Prompt-vs-code ownership, guards becoming semantic owners, or agentic decision-boundary fixes go to `assign-decision-ownership`.
- Adversarial regression design, attack replay, poisoned-context replay, and holdout suites go to `design-agentic-evals`.
- Rollout, canary, merge, deploy, or release gating for security results goes to `gate-agent-activation` or `gate-delivery-readiness`.
- Runtime retries, failover, degraded mode, or operational recovery issues go to the relevant runtime skill instead of staying here.
