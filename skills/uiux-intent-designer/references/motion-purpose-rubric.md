# Motion Purpose Rubric

Motion is allowed only when it serves a user-facing purpose.

## Valid Purposes

- Feedback: confirms an action was received.
- Continuity: explains where an object came from or went.
- Causality: shows what changed because of user action.
- Attention: points to something important at the right moment.
- Spatial model: teaches the structure of the interface.
- Brand tone: adds character without slowing or confusing the task.

## Premium Motion Defaults

Use restrained defaults unless the product has a strong motion system:

- Hover, focus, and pressed feedback: 120-180ms.
- Small state changes and inline feedback: 150-220ms.
- Modal, drawer, panel, route, or card transitions: 180-260ms.
- Use transform and opacity before layout-affecting properties.
- Use easing that starts responsive and settles calmly; avoid bouncy easing unless the brand is playful.
- Use stagger only when it communicates sequence or causality.

"Premium" usually means restraint, responsiveness, continuity, tactility, and confidence. It does not mean more movement.

## Rejection Criteria

Avoid or remove motion when:

- It starts before the user knows what the page is.
- It steals attention from the primary task.
- It repeats without new information.
- It makes the UI feel slower.
- It is the only way important feedback is communicated.
- It ignores reduced-motion preferences.

## Reduced-Motion Rule

Every nonessential animation needs a reduced-motion fallback. The fallback may use instant state change, opacity, color, icon, text, or static position change.

When planning motion, include the fallback in the interaction feedback map before implementation.
