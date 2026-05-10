# Research Basis

This skill exists because several external practices converge on the same pattern: clarify the customer or product goal, state the current blocker, challenge alternatives early, choose the right-sized meaningful slice, and keep written decision context.

## Product Goal Before Solution

- AWS Working Backwards starts with the final customer outcome before code. Amazon writes a PR/FAQ before building so teams stay rooted in customer value, test assumptions early, and converge on the simplest effective solution.
- This skill borrows that shape: product goal first, proposal second, challenge third.

## Smallest Safe Slice

- Google recommends small, self-contained changes because large changes waste more work when the overall direction is wrong, are harder to design well, and are harder to merge and roll back.
- Trunk-Based Development recommends short-lived branches and incremental, independently shippable steps instead of one branch per big story.
- This skill uses "right-sized slice" as a first-class output, not as an afterthought. Right-sized may mean smaller, larger, or more coherent depending on blocker link, reviewability, rollback value, and integration risk.

## Written Decision Basis

- Software Engineering at Google recommends design documents for major work and explicitly says strong design docs should cover goals, implementation strategy, and alternatives with trade-offs.
- Architectural Decision Records are a lightweight way to retain decision context, alternatives, and justification.
- This skill therefore requires both source-of-truth basis and alternative challenge, not just a preferred solution.

## Contrarian Preflight

- Atlassian's premortem guidance pushes teams to surface what could go wrong before commitments are made, and to revisit those risks rather than assuming planning is complete once work starts.
- This skill adapts that spirit to slice selection: challenge the direction before implementation, not only after drift is expensive.

## AI Workflow Basis

- OpenAI recommends using reasoning models for ambiguous tasks, multistep planning, and clarifying questions before guessing.
- Anthropic recommends incremental refinement, clear objectives, context management, and explicit anti-overengineering guidance in agentic coding.
- This skill therefore prefers a fresh contrarian subagent for risky slice decisions and fixed challenge outputs over freeform justification.

## What This Skill Owns

- whether the proposed slice should exist now
- whether it is mainline or future-wave
- whether it is too large, too early, or too speculative
- what more-coherent/smaller/later/different alternatives deserve challenge
- what exact implementation boundary should be preserved if the slice proceeds

## What This Skill Does Not Own

- detailed implementation planning
- dependency ordering among already accepted slices
- architecture design once the slice boundary is accepted
- code quality review
- CI, merge, or deploy readiness

## Source Map

- AWS Working Backwards / start with why
- Google Small CLs
- Trunk-Based Development short-lived branches
- Software Engineering at Google design docs
- ADR / MADR
- Atlassian premortem
- OpenAI reasoning best practices
- Anthropic Claude Code / agentic coding best practices
