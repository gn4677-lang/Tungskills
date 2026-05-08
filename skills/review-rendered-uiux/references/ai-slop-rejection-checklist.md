# AI Slop Rejection Checklist

Use this to catch generic AI-generated UI patterns that look plausible but communicate poorly, mislead users, or hide missing design intent behind fashionable decoration.

Read `ai-slop-example-gallery.md` when you need paired bad-vs-better examples. Read `visual-example-index.md` when you want a paired visual example. Read `code-smell-to-ui-failure-map.md` when you only have source code and need early warning signs before rendered review.

## The Main Failure Families

### 1. Intent vacuum

Reject when:

- the first screen does not say what the product is, who it is for, and why it matters
- headings sound aspirational but not literal
- every section promises benefits while none shows the workflow

Typical signals:

- "clean modern" look with no product point of view
- generic benefit cards replacing concrete explanation

### 2. Template sameness

Reject when:

- the layout reads like a stock SaaS landing page or dashboard unrelated to the domain
- one product could swap logos with another and still look unchanged

Typical signals:

- bento cards with no task logic
- giant hero, feature grid, testimonial band, FAQ band, CTA footer sequence with no system reason

### 3. Decorative substitution

Reject when:

- gradients, glow, glass, heavy shadows, floating cards, or oversized illustration blocks do the work that product explanation should do
- motion appears before context and steals attention from comprehension

Typical signals:

- purple/blue gradient as default personality
- dramatic depth and blur with weak hierarchy

### 4. Fake-product proof

Reject when:

- screenshots, dashboards, charts, code panes, or terminal views look fabricated, unrelated, or too low-fidelity to build trust
- logos, badges, YC mentions, or social proof replace showing the product itself

Typical signals:

- impossible metrics
- generic chart shapes
- obviously placeholder UI inside device mockups

### 5. Domain mismatch

Reject when:

- the information density, tone, or structure is wrong for the job
- the interface feels like a marketing page when it should be an operational tool, or vice versa

Typical signals:

- editorial whitespace in an operations dashboard
- dense tables in an onboarding or discovery flow with no guidance

### 6. Accessibility debt hidden by pretty pixels

Reject when:

- semantic structure, keyboard access, visible focus, or reduced-motion handling is missing
- controls look interactive but do not behave accessibly

Typical signals:

- click-only divs
- weak focus styles
- state shown only by color or animation

### 7. State dishonesty

Reject when:

- loading, success, empty, error, or disabled states are missing or misleading
- the UI implies work has completed when it has not

Typical signals:

- fake loaders with no scope
- disabled actions with no explanation
- optimistic-looking confirmations without recovery path

### 8. Mobile and edge-state neglect

Reject when:

- text wraps badly, controls clip, hierarchy collapses, or sticky UI hides important actions
- the UI looks fine in one hero screenshot but falls apart in real use

Typical signals:

- compressed cards
- long labels breaking buttons
- no empty/error views

### 9. Derivative mimicry

Reject when:

- the output appears to imitate a familiar app or visual trope too directly
- the design feels borrowed instead of product-fit

Typical signals:

- iconic patterns copied without domain reason
- weather-app, finance-dashboard, or AI-chat shell reused as default answer

## Fast Repair Moves

- Add a literal subheadline.
- Show the actual product, workflow, or output.
- Replace generic claims with domain-specific task examples.
- Reduce decorative gradients, blur, and shadows.
- Use one coherent visual system.
- Move motion to action feedback or state transition.
- Add proof where the user needs trust, not where the layout needs decoration.
- Swap fake demos for believable screenshots or honest placeholders.
- Recheck keyboard, semantics, focus, and state truth before calling the UI polished.

## Why this matters

External evidence consistently points to the same pattern:

- Figma notes that teams are still figuring out how AI is actually useful in design and need iteration rather than hype-led adoption.
- Research reviews of generative no-code UI systems report structural and functional errors, missing elements, incorrect component mappings, navigation inconsistencies, and accessibility/usability issues.
- Frontend-focused accessibility reviews show that AI-generated interfaces often optimize visual output while missing semantic structure, keyboard behavior, and accessibility-tree correctness.
- Practical guidance for AI UI generators repeatedly warns about vague prompts, design-system mismatch, and the need to audit accessibility and brand fit.

## Source basis

- Figma: [AI + design: Navigating the promise and pitfalls of AI](https://www.figma.com/blog/ai-design-navigating-the-promise-and-pitfalls-of-ai/)
- Smashing Magazine: [When “Production-Ready” Becomes A Design Deliverable](https://www.smashingmagazine.com/2026/04/production-ready-becomes-design-deliverable-ux/)
- Frontend Masters: [AI-Generated UI Is Inaccessible by Default](https://frontendmasters.com/blog/ai-generated-ui-is-inaccessible-by-default/)
- Hack Design / v0: [v0 for Designers](https://www.hackdesign.org/toolkit/v0/)
- MDPI review: [Design Behaviour and Interface Consistency in Generative No-Code Tools](https://www.mdpi.com/2073-431X/15/4/238)
