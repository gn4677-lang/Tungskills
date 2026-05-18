# Independent Browser Evaluator

Use this only for high-risk user-facing browser or agentic flows. Do not require it for small deterministic refactors, copy changes, or pure backend units.

## When To Use

Use an independent evaluator subagent when:

- tests are green but manual use feels fake, templated, or fallback-like
- the builder is claiming a browser workflow, assistant workflow, or user-visible product capability
- buttons, forms, routes, agents, or state changes can look done without real behavior
- activation, canary, readiness, or capability realism depends on user-perceived behavior

## Minimal Protocol

1. Builder writes a Done Contract before implementation or before final claim.
2. Evaluator challenges the Done Contract if it misses user-visible outcomes or state truth.
3. Builder implements or fixes.
4. Evaluator uses the real entrypoint and browser/Playwright when available.
5. Evaluator reports blocker findings with evidence only; no broad redesign unless the contract is wrong.
6. Builder fixes blockers or narrows the claim.

## Done Contract Template

```text
User task: ...
Real entrypoint: ...
Expected visible behavior: ...
Expected state/backend effect: ...
Non-template / non-fallback signal: ...
Critical interactions: ...
Must not break: ...
Evidence required: screenshot | DOM | network | console | DB/state | trace
```

## Evaluator Rubric

```text
Functionality: controls, routes, forms, and keyboard/mouse actions actually work.
Product realism: no dead buttons, placeholder-only paths, fixture-only success, or fake data claims.
State truth: UI response matches backend/app state where state is part of the claim.
Agent realism: intended semantic owner ran; final response is not just deterministic template text.
Visual usability: primary path is visible; layout/text do not block completion.
Evidence: steps, screenshot/DOM/network/console/state/trace are named or explicitly not run.
```

## Claim Boundary

- Browser evaluator pass proves only the tested flow, viewport, state, and evidence surface.
- It does not prove whole-product readiness, all agent behavior, security, performance, or production safety.
- If Playwright/browser was not available, report the evaluator as not run rather than replacing it with builder self-check.
