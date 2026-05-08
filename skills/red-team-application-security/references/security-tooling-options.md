# Security Tooling Options

Use tools to increase coverage and repeatability, not to avoid thinking.

## Tool choice rule

Choose tooling from the trust boundary and evidence need:

- code-centric, repo-first review -> Codex Security
- interactive runtime web/API probing -> Burp
- repeatable DAST or import-driven scanning -> ZAP
- Supabase posture review -> Supabase docs/advisors
- AI/LLM branch -> Promptfoo, PyRIT, or garak
- small or ambiguous scope -> manual Codex-only pass first

Do not let the tool determine the scope. Threat model first, tooling second.

## Codex Security

Use when:

- the task is repository, PR, commit, or diff security review
- you need codebase threat modeling, isolated validation, and minimal patch suggestions

Why:

- OpenAI's workflow is threat model -> discover -> validate in isolation -> propose minimal patch -> human review -> revalidate

Do not use as the only method when:

- the main question is runtime browser behavior, auth/session state, request tampering, or deployment surface behavior

## Burp Suite

Use when:

- you need interactive runtime testing of web apps or APIs
- auth/session, cookies, CSRF, access control, request tampering, and browser-driven flows are central

Why:

- PortSwigger's methodology and docs are optimized for hands-on testing of the running application boundary

Do not use as the only method when:

- you need code-path ownership or PR/diff-centric bug discovery

## OWASP ZAP

Use when:

- you need repeatable DAST or pre-prod scanning
- you can describe targets via site navigation or OpenAPI/GraphQL/Postman definitions
- you want automation via a YAML plan and explicit exit codes

Why:

- ZAP's Automation Framework supports environment definitions, passive/active scan jobs, import jobs, report jobs, and exit-status control

Do not use as the only method when:

- the target needs heavy authenticated/manual reasoning or business-logic judgment that scanners often miss

## Supabase secure-data guidance and Security Advisor

Use when:

- the app depends on Supabase data, auth, storage, or generated APIs
- you need quick posture checks for RLS, exposed auth data, public buckets, security-definer misuse, or privilege drift

Why:

- Supabase explicitly recommends RLS and least privilege for frontend access
- Security Advisor can surface issues such as improperly set-up RLS policies and public exposure risks

Do not use as the only method when:

- you still have not tested how the application actually uses those policies and boundaries at runtime

## Promptfoo

Use when:

- the AI/LLM branch needs repeatable red-team suites
- you want structured adversarial tests for LLM apps, RAG, agents, or MCP

Why:

- Promptfoo provides repeatable red-team guides and configuration for application, guardrail, RAG, agent, and MCP testing

## PyRIT

Use when:

- the AI/LLM branch needs adaptive multi-turn probing
- single-turn prompt sets are too shallow

Why:

- PyRIT adapts tactics based on target responses, supports single and multi-turn interactions, and keeps memory for later analysis

## garak

Use when:

- the AI/LLM branch needs broad, automated vulnerability probing against model-specific risks
- you need structured logs, hit reports, or soak-style scanning

Why:

- garak focuses on LLM-native risks such as prompt injection, jailbreaks, guardrail bypass, replay, and related weaknesses

## Manual Codex-only path

Use when:

- the scope is still ambiguous
- you first need a threat model, attack-surface inventory, or code-path hypothesis pass
- adding a scanner would create more setup noise than value

Good uses:

- attack-surface enumeration
- trust-boundary mapping
- code-path tracing
- bounded test-case design
- finding triage and regression drafting

Do not let this become:

- unsupported exploit claims
- blind trust in model-generated findings
- auto-merge remediation without human review

## Source basis

- Codex Security: [help.openai.com/en/articles/20001107-codex-security](https://help.openai.com/en/articles/20001107-codex-security)
- Burp docs: [portswigger.net/burp/documentation/contents](https://portswigger.net/burp/documentation/contents)
- Burp testing methodologies: [portswigger.net/support/burp-testing-methodologies](https://portswigger.net/support/burp-testing-methodologies)
- ZAP Automation Framework: [zaproxy.org/docs/automate/automation-framework](https://www.zaproxy.org/docs/automate/automation-framework/)
- Supabase secure data: [supabase.com/docs/guides/database/secure-data](https://supabase.com/docs/guides/database/secure-data)
- Supabase Security Advisor: [supabase.com/docs/guides/database/database-advisors](https://supabase.com/docs/guides/database/database-advisors)
- Promptfoo red teaming: [promptfoo.dev/docs/red-team/guides](https://www.promptfoo.dev/docs/red-team/guides/)
- PyRIT: [microsoft.com/security/blog/2024/02/22/announcing-microsofts-open-automation-framework-to-red-team-generative-ai-systems](https://www.microsoft.com/en-us/security/blog/2024/02/22/announcing-microsofts-open-automation-framework-to-red-team-generative-ai-systems/)
- garak: [docs.garak.ai/garak/overview/our-features](https://docs.garak.ai/garak/overview/our-features)
