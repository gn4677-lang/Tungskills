# Human-AI Product Patterns

Use this file when the question is not only "can the agent do it" but "will people understand, trust, and keep using it".

These sources are product-design guidance, not runtime source-of-truth:

- Microsoft Research, *Guidelines for Human-AI Interaction*
- Google HEART framework
- Baymard UX research
- Fogg Behavior Model

## Microsoft HAI guidance

Use these principles as the primary design layer for frictionless human-AI interaction:

- make clear what the system can do
- make clear how well it can do it
- time assistance to the current context
- support efficient invocation when the user wants help
- support efficient dismissal when the user does not
- support correction and graceful recovery when the AI is wrong
- update behavior carefully over time so the user does not feel the system changed personalities overnight

What this changes in agentic products:

- do not hide capability boundaries behind a single magical input box
- do not make the user guess whether the agent is still thinking, blocked, or done
- do not make interruption, undo, or correction expensive

## Baymard-style friction heuristics

Use these as secondary product heuristics for agent surfaces:

- progressive disclosure beats front-loaded setup
- ask for the minimum needed to get first value
- preserve state when users back out or correct a step
- make the next action obvious after an error or ambiguous result
- keep validation close to the moment of input rather than punishing the user later

What this changes in agentic products:

- onboarding should unlock one successful outcome fast
- clarification should happen late and narrowly, not as a questionnaire up front
- retry and correction flows should preserve prior work instead of restarting the whole interaction

## Google HEART for agentic UX

Use HEART as the measurement layer, not the design layer.

- Happiness:
  - satisfaction after assisted tasks
  - user trust after corrections or fallbacks
- Engagement:
  - repeated use of proactive suggestions or saved flows
- Adoption:
  - time to first successful assisted outcome
- Retention:
  - continued use after the first failure or correction event
- Task success:
  - completion rate
  - recovery rate
  - clarification burden
  - time to useful answer

Translate HEART into agent-specific metrics:

- time to first value
- number of clarification turns before success
- abandoned runs
- user takeover rate
- correction success rate
- percent of proactive suggestions accepted, snoozed, or dismissed

## Fogg as a narrow helper

Use Fogg for prompts and next-step design, not as the main trust model.

- behavior happens when motivation, ability, and a prompt align
- lower the effort of the next step before adding more reminders
- prompts should arrive when the user is ready to act, not merely when the system can send one

What this changes in agentic products:

- reduce approval friction before increasing reminder frequency
- make corrective actions tiny and obvious
- prefer one clear next step over three optional branches
