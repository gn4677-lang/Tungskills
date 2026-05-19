# Motion Feedback Contract

Use this when a UI claim depends on animation, transition, microinteraction, loading feedback, or interaction response. Do not use it to demand animation everywhere.

## Contract

```text
Trigger: click | tap | hover | focus | drag | submit | navigation | async_start | success | error | cancel
Expected state change: ...
Motion meaning: feedback | causality | continuity | hierarchy | status | affordance | brand_tone | none
Physical model: press | lift | expand | collapse | slide | fade | snap | settle | handoff | none
Timing: immediate | brief | delayed | interruptible | blocks_user
Reduced-motion path: static_state | opacity_only | instant_transition | alternative_feedback | missing | not_needed
Evidence: video | Playwright trace | screenshot sequence | DOM state | user action log | not_run
Decision: pass | fail | narrow
```

## Pass Conditions

- The action receives immediate perceivable feedback.
- The transition helps the user understand what changed, where they came from, where they are going, or whether work is pending/done/failed.
- Direction, origin, easing, and timing match the interaction and hierarchy.
- Frequent interactions remain brief and do not make the user wait.
- Important information remains understandable when reduced motion is enabled.

## Fail Conditions

- Motion is decorative but presented as product polish.
- A button, form, navigation, save, delete, drag, or async action has no perceivable feedback.
- The animation implies the wrong hierarchy, direction, causality, or success state.
- The UI uses motion as the only way to communicate important information.
- Motion is slow, blocking, distracting, or impossible to interrupt.
- Reduced-motion behavior is missing for nonessential interaction-triggered animation.

## Source Basis

- Apple Human Interface Guidelines: Motion should convey status, provide feedback, be purposeful, realistic, brief, precise, optional, and cancelable. https://developer.apple.com/design/human-interface-guidelines/motion
- Material Design motion: Motion describes spatial relationships, functionality, and intention; transitions should be quick, clear, and cohesive. https://m1.material.io/motion/material-motion.html
- Material duration/easing: Motion should be fast enough not to cause waiting and slow enough to be understood. https://m1.material.io/motion/duration-easing.html
- WCAG 2.3.3: Interaction-triggered animation should be disableable unless essential to functionality or information. https://w3c.github.io/wcag/understanding/animation-from-interactions.html
