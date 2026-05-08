# Skill Map

Use this file to route a broad request to the right runtime capability.

## `design-agent-context`

Primary symptoms:
- forgetting user preferences or goals
- mixing users, channels, or sessions
- carrying too much raw history
- lacking compaction, summaries, or context packing

Do not route here when the main complaint is:
- search quality
- RAG boundaries
- external document lookup
- provider/model failure

## `design-agent-retrieval`

Primary symptoms:
- search does not work
- RAG boundaries are unclear
- too much is being solved with docs
- deterministic state and retrieval are mixed together

Do not route here when the main complaint is:
- session leakage across users or channels
- memory schema confusion without search problems
- scheduled follow-ups
- retry or failover policy

## `design-agent-durability`

Primary symptoms:
- background memory extraction or consolidation is missing or unsafe
- team memory or shared state sync is inconsistent
- snapshots, resume, or crash recovery are unclear
- token, quota, or cost guardrails are missing
- long-running background subsystems need gates, locks, debounce, rollback, or suppression rules

Do not route here when the main complaint is:
- the agent forgets or packs context badly in a single session
- search quality or RAG scope is wrong
- reminders, follow-ups, or autonomy tiers are undefined
- provider/model retry or failover policy is unclear
- onboarding friction or UX heaviness

## `design-proactive-agents`

Primary symptoms:
- the system only reacts after the user asks
- reminders, follow-ups, or weekly jobs are missing
- autonomy and approvals are undefined

Do not route here when the main complaint is:
- provider/model outages
- trace taxonomy
- ordinary context packing
- onboarding friction without background behavior

## `design-agent-fallbacks`

Primary symptoms:
- provider or model failures break the experience
- retries are ad hoc
- degraded modes are unclear
- traces and eval loops are weak

Do not route here when the main complaint is:
- when to send reminders
- search versus docs
- memory schema design
- first-run UX or clarification burden

## `reduce-agent-friction`

Primary symptoms:
- onboarding is heavy
- clarification loops are annoying
- users feel latency or uncertainty
- surface choice between chat, form, and notification is poor

Do not route here when the main complaint is:
- session isolation
- retrieval boundaries
- scheduled autonomy
- retry and failover policy

## Tie-breakers

- If the user says "it forgets" or "wrong context", prefer `design-agent-context`.
- If the user says "search", "RAG", "docs", or "lookup", prefer `design-agent-retrieval`.
- If the user says "sync", "recovery", "snapshot", "budget", "quota", "ETag", "background job", or "long-running", prefer `design-agent-durability`.
- If the user says "remind", "follow up", "weekly review", or "autonomous", prefer `design-proactive-agents`.
- If the user says "provider failed", "timeout", "fallback", "degrade", or "trace", prefer `design-agent-fallbacks`.
- If the user says "too many questions", "too slow", "too much setup", or "wrong surface", prefer `reduce-agent-friction`.
