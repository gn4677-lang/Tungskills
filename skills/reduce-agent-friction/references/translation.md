# Translation

Use this file to extract low-friction product capabilities.

## Capability: fast first value

- Runtime pattern:
  - explicit onboarding and prepared context
- Product capability:
  - users reach the first useful outcome before finishing a full setup ritual
- Surface shape:
  - setup surfaces should expose only the minimum decisions needed to unlock the first successful run
- Keep deterministic:
  - safety-critical prerequisites
- Make agentic:
  - what can be inferred or delayed until after first value
- Failure mode if missing:
  - onboarding becomes homework

## Capability: low-effort clarification

- Runtime pattern:
  - the system prepares context and only asks high-value follow-ups
- Product capability:
  - fewer annoying clarification loops and less repeated effort
- Surface shape:
  - clarification should arrive in the same channel and at the latest safe moment
- Keep deterministic:
  - the boundaries where guessing would be unsafe
- Make agentic:
  - which single next question reduces ambiguity the most
- Failure mode if missing:
  - users feel interrogated instead of assisted

## Capability: visible responsiveness

- Runtime pattern:
  - typing, progress, and presence cues
- Product capability:
  - users trust that the agent is alive and working even when the answer takes time
- Surface shape:
  - cues should match actual runtime phases such as thinking, streaming, waiting, or silent housekeeping
- Keep deterministic:
  - when cues start and stop
- Make agentic:
  - none; this is mostly a runtime/display policy
- Failure mode if missing:
  - users assume the system is slow, stuck, or broken

## Capability: deterministic reply surfaces

- Runtime pattern:
  - routing is host-controlled and channel-native
- Product capability:
  - users know where replies, follow-ups, and notifications will appear
- Surface shape:
  - the product should feel channel-first, not like a floating agent that might answer anywhere
- Keep deterministic:
  - reply target selection
  - channel routing rules
- Make agentic:
  - almost nothing; this is mainly surface discipline
- Failure mode if missing:
  - users lose trust because replies appear in the wrong place or with inconsistent visibility

## Capability: calibrated expectations

- Runtime pattern:
  - the system makes its scope, confidence, and likely next steps legible before and during interaction
- Product capability:
  - users know what the agent can help with, when to trust it, and when they still need to review or decide
- Surface shape:
  - capability boundaries and uncertainty should appear in the same surface as the work, not buried in docs
- Keep deterministic:
  - safety boundaries
  - confidence labels
  - escalation rules
- Make agentic:
  - how to explain the current limitation or next best action in context
- Failure mode if missing:
  - users overtrust, undertrust, or abandon the product because its behavior feels arbitrary

## Capability: cheap correction

- Runtime pattern:
  - the product supports efficient dismissal, undo, edit, and recovery
- Product capability:
  - users can steer the agent without paying the cost of restarting the interaction
- Surface shape:
  - correction should be one step away from the generated result or action
- Keep deterministic:
  - undo semantics
  - correction entry points
  - preserved state
- Make agentic:
  - how to recover gracefully after the user corrects the system
- Failure mode if missing:
  - one bad guess turns into a full restart and destroys trust

## Capability: measurable friction

- Runtime pattern:
  - interaction quality is measured through user-centric task and trust metrics, not only backend uptime
- Product capability:
  - teams can improve onboarding, clarification, and correction flows based on evidence
- Surface shape:
  - friction metrics should connect directly to real user journeys and concrete repair opportunities
- Keep deterministic:
  - metric definitions
  - event schema
  - experiment boundaries
- Make agentic:
  - almost nothing; this layer should stay explicit and measurable
- Failure mode if missing:
  - the product ships "improvements" that feel smoother internally but worse to users

## Capability: inspectable user sessions

- Runtime pattern:
  - traces and session inspection let operators debug a user's experience without reconstructing it from scattered logs
- Product capability:
  - when a user says "it was slow" or "it got weird," the team can inspect the actual run and reduce friction based on evidence
- Surface shape:
  - operators need session-level and run-level views that preserve the interaction path, not only backend events
- Keep deterministic:
  - trace and session identifiers
  - retention policy
- Make agentic:
  - almost nothing; the point is to make the user journey inspectable
- Failure mode if missing:
  - friction reports turn into guesswork and anecdotal debugging

## Capability: fast operator feedback loop

- Runtime pattern:
  - bad runs, prompts, datasets, and feedback labels are linked closely enough that teams can iterate without losing context
- Product capability:
  - friction can be improved quickly after launch because operators move directly from a bad interaction to a concrete fix
- Surface shape:
  - prompt iteration and labeling should feel like a continuation of run inspection, not a separate archaeology project
- Keep deterministic:
  - prompt versioning
  - labeling workflow
  - handoff from run view to fix surface
- Make agentic:
  - almost nothing; this is mainly operator-product design
- Failure mode if missing:
  - teams see friction but fix it slowly because evidence and edit surfaces are disconnected
