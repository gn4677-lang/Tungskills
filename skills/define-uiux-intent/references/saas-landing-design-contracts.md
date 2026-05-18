# SaaS Landing Design Contracts

Use this before designing or redesigning a SaaS, product marketing, waitlist, launch, or landing page. The goal is not to rate taste; it is to turn product-led design craft into contracts the implementation can satisfy and the rendered review can verify.

Do not output design maturity levels or numeric scores. Output explicit requirements with evidence and fail conditions.

## Required Output Add-On

```text
Landing/page contract:
Page promise:
Target visitor:
Primary conversion action:
Product proof visual:
Section inventory:
CTA/navigation map:
Reference extraction:
Interaction completeness:
Motion purpose:
Mobile first-viewport requirement:
Human judgment still needed:
```

## Contract Rows

Use this row shape for each major requirement:

```text
Requirement:
Why it matters:
Planned evidence:
Pass condition:
Fail if:
Implementation note:
```

## Product Proof Contract

The first viewport should show a credible product signal, not only a style signal.

Pass condition:

- The hero shows a real product screen, dashboard, workflow state, generated product state, domain object, or tightly cropped feature close-up.
- The visual proves a specific user outcome or product mechanism.
- The product visual remains identifiable on mobile.

Fail if:

- Stock image, abstract blob, decorative gradient, generic illustration, or unrelated screenshot carries the hero.
- The dashboard/chart/code pane looks fake, impossible, low-fidelity, or disconnected from the promised outcome.
- The hero could swap logos with another SaaS product and still make sense.

## Section Pattern Contract

Plan section patterns before implementation so the page does not become repeated template blocks.

Use only patterns that serve the product story:

- product hero with proof visual
- logo or social-proof strip
- clickable multi-section or tabs
- simple bento for grouped feature proof
- straight-line grid for structure and responsive rhythm
- visual navigation or mega menu with destination previews
- proof-backed CTA section

Pass condition:

- Each section has a named purpose and pattern.
- Pages with more than four major sections use more than one layout skeleton.
- Pattern changes follow the narrative, not decoration.

Fail if:

- Three consecutive major sections use the same text/image skeleton.
- Bento cards, feature cards, or grids have no task logic.
- A trend is used only because it is common.

## Clickable Section Completeness

If using tabs, multi-section panels, carousels, segmented controls, or visual nav, design every state.

Pass condition:

- Every option has real content.
- Active, hover, focus, keyboard, empty, and mobile behavior are named.
- The content changes without large layout shift.

Fail if:

- Only the first tab is designed.
- Inactive states are placeholders.
- Mobile collapses into an unreadable or missing experience.

## Copy Outcome Contract

Copy should move from feature description to user outcome.

Pass condition:

- Hero headline states who gets what outcome.
- Section headings answer a visitor question or objection.
- Body copy is scannable and shorter than the visual explanation where possible.

Fail if:

- The headline only says what the product does, not what it helps users achieve.
- Paragraphs are long enough that visitors must read instead of scan.
- The page repeats company or feature names instead of advancing the story.

## CTA And Navigation Contract

Pass condition:

- Primary CTA text is consistent across hero and navigation when it leads to the same action.
- Primary, secondary, and tertiary actions have visibly different weight.
- Navigation highlights the product/depth links that matter most.

Fail if:

- All nav items have equal weight.
- Multiple primary CTAs compete.
- CTA labels imply different destinations for the same action.

## Page Flow Contract

Every major section should answer the next visitor question:

```text
What is it?
Why should I trust it?
How does it work?
What can I do with it?
What proof exists?
What should I do next?
```

Pass condition:

- Section order has a reason.
- Moving or removing a section would weaken the story.
- The first viewport leaves a visible cue that more relevant content follows.

Fail if:

- Sections feel stacked, interchangeable, or report-like.
- The page relies on a single hero claim with no proof path.

## Motion Purpose Contract

Name motion only when it helps comprehension or feedback.

Allowed purposes:

- focus
- continuity
- state change
- hierarchy
- interaction feedback
- perceived loading

Fail if:

- motion is only decorative fade/slide
- animation delays task completion
- looping or auto-updating motion lacks pause, stop, hide, or reduced-motion handling when required

## Reference Extraction Contract

When using external references, extract patterns rather than copy layout.

```text
Reference:
Pattern extracted:
Why applicable:
What not to copy:
Evidence needed in our page:
```

Use official design/accessibility guidance for principles, live products or screenshots for pattern references, and local product truth for final behavior.

## Source Basis

- YouTube transcript provided by the user: "The 4 Levels of SaaS Landing Page UI Design"
- YouTube transcript provided by the user: "7 Modern UI Layouts from 50 Top Software Companies"
- Material Design motion guidance: motion should communicate focus, hierarchy, spatial relationship, state, and intent.
- WCAG 2.2 Pause, Stop, Hide: moving or auto-updating content may need user control.
- Nielsen Norman Group visual-design principles and scanning guidance: visual hierarchy, concise content, and informational images matter more than decorative placement.
