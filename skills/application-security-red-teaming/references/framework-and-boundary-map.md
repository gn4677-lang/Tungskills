# Framework and Boundary Map

Use this map when the security task is broad and you need to decide what kind of testing, evidence, and owner model should lead.

## Why this skill exists

`application-security-red-teaming` is the top-level owner for authorized adversarial review of websites, web apps, APIs, data boundaries, deployment surfaces, and AI-enabled application features.

It is intentionally broader than:

- `codex-security:security-scan`, which is strongest for repository, PR, commit, and diff-centered code security review
- `agentic-security` style concerns, which are only one attack family inside a larger application security surface

## Framework roles

| Source | What it is good for | How to use it here |
| --- | --- | --- |
| OWASP Web Security Testing Guide (WSTG) | Coverage-driven testing guide for web applications and web services | Use it to map runtime web testing across information gathering, config/deployment, identity, auth, authz, session, input handling, error handling, business logic, and client-side checks. |
| OWASP API Security Top 10 (2023) | API-specific attack families | Use it when the surface is API-first, especially for BOLA, broken authentication, property/function-level authorization, resource consumption, business-flow abuse, SSRF, misconfiguration, inventory, and unsafe API consumption. |
| OWASP ASVS | Verification baseline and rigor checklist | Use it to turn "secure enough" into explicit control expectations and exit criteria. |
| NIST SP 800-115 | Test planning, scope discipline, evidence collection, and reporting | Use it for rules of engagement, method selection, evidence discipline, and report structure. |
| OpenAI Codex Security | Repo threat modeling, isolated validation, minimal patch proposals, human review | Use it when the main question is "what bugs exist in this codebase or PR?" rather than "how do I red-team the running application boundary?" |
| OpenAI red-teaming and prompt-injection guidance | Threat-model-first AI testing and source/sink reasoning | Use it only for the AI-enabled branch of the application, not as the whole AppSec methodology. |
| Supabase secure-data and Security Advisor docs | RLS, least privilege, storage/auth posture, exposed data paths | Use it when the application depends on Supabase for data, auth, storage, or API exposure. |

## Ownership map

| Primary problem | Primary owner |
| --- | --- |
| Repository, PR, commit, or diff-only security scan | `codex-security:security-scan` |
| Running application, web/API/auth/runtime attack surface | `application-security-red-teaming` |
| Supabase RLS, storage, auth, or role posture inside a broader app review | `application-security-red-teaming` with `supabase:supabase` for implementation/detail work |
| AI agent, prompt injection, tool misuse, MCP, or memory branch inside an app review | `application-security-red-teaming` with `llm-deterministic-boundary` or `agentic-eval-development` as remediation owners |
| Merge, deploy, or release gate for security evidence | `delivery-pipeline-governance` |
| Rollout permission after testing | `agent-runtime-activation-ladder` |

## AI/Codex execution best practices

Use AI as a force multiplier, not as the final security oracle.

1. Threat model first.
   Name the target, trust boundary, attacker goal, and highest-value sinks before scanning or probing.

2. Keep scope authorized and bounded.
   Use local, staging, sandboxed, or otherwise approved targets whenever possible. Do not treat "live production unless told otherwise" as acceptable.

3. Let AI expand hypotheses and compress review cost.
   Good uses of Codex/AI include:
   - attack-surface enumeration
   - code-path tracing
   - targeted test-case generation
   - clustering likely finding families
   - drafting replay/regression suites

4. Do not let AI claims outrun evidence.
   A model can suggest likely weaknesses, but exploitability, impact, and closure still need artifacts, traces, or direct validation.

5. Separate discovery from remediation.
   Codex Security guidance is useful here: threat model, discover, validate in isolation, propose minimal fix, then revalidate after remediation instead of collapsing the steps.

6. Preserve artifacts and review them.
   Save traces, code paths, HTTP captures, scan outputs, and replay cases. Findings without evidence decay into folklore quickly.

7. Keep human review in the loop.
   Findings, patches, and rollout claims should still go through the normal engineering review process.

## What this skill owns vs what it does not own

| This skill owns | This skill does not own |
| --- | --- |
| Choosing the primary app security boundary | Auto-merging fixes |
| Choosing the primary attack family | Offensive operations outside approved scope |
| Planning bounded red-team / white-hat probes | Treating scanner output as automatic proof |
| Separating plausible from validated findings | Deployment approval by itself |
| Routing remediation to the right owner | Replacing specialized code-fix or platform-configuration skills |

## Source basis

- OWASP WSTG: [owasp.org/www-project-web-security-testing-guide](https://owasp.org/www-project-web-security-testing-guide/)
- OWASP API Security: [owasp.org/www-project-api-security](https://owasp.org/www-project-api-security/)
- OWASP ASVS: [owasp.org/www-project-application-security-verification-standard](https://owasp.org/www-project-application-security-verification-standard/)
- NIST SP 800-115: [csrc.nist.gov/pubs/sp/800/115/final](https://csrc.nist.gov/pubs/sp/800/115/final)
- OpenAI Codex Security: [help.openai.com/en/articles/20001107-codex-security](https://help.openai.com/en/articles/20001107-codex-security)
- OpenAI red teaming: [openai.com/index/advancing-red-teaming-with-people-and-ai](https://openai.com/index/advancing-red-teaming-with-people-and-ai/)
- OpenAI prompt injection guidance: [openai.com/index/designing-agents-to-resist-prompt-injection](https://openai.com/index/designing-agents-to-resist-prompt-injection/)
- Supabase secure data: [supabase.com/docs/guides/database/secure-data](https://supabase.com/docs/guides/database/secure-data)
- Supabase Security Advisor: [supabase.com/docs/guides/database/database-advisors](https://supabase.com/docs/guides/database/database-advisors)
