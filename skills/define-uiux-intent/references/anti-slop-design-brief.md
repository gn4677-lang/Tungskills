# Anti-Slop Design Brief

Use this when the requested UI is likely to drift into generic AI output.

Read `anti-slop-direction-examples.md` when you need concrete bad-vs-better contrast before choosing a layout direction. If the distinction is still too abstract, read `../../review-rendered-uiux/references/visual-example-index.md` and inspect the paired SVG gallery.

## Add These Inputs Before Exploring Layout

- Unique product signal:
  - What must be obvious on the first screen that would not be true of a random SaaS template?
- Literal proof shown early:
  - real screenshot, believable workflow state, concrete output, domain object, or operational view
- Density target:
  - sparse/editorial, guided/product-led, or dense/operational
- Trust posture:
  - what evidence makes the interface credible for this domain?
- Visual anti-goals:
  - what should this not look like?
- Trope ban list:
  - specific patterns to avoid when they are not justified

## Common AI-Slop Tropes To Name Explicitly

- oversized hero with weak literal explanation
- decorative gradient or glow as substitute for product identity
- card piles and bento grids with no task logic
- fake charts, fake dashboards, or fake code panes used as decoration
- social-proof badges replacing product explanation
- generic "clean modern" visuals with no domain cues
- productivity-tool layout pasted onto a domain that needs warmth, trust, or explanation
- landing-page structure used for an operational app surface

## Required Anti-Slop Questions

- What would make this feel like a random AI-generated template?
- Which design move would be visually trendy but wrong for this domain?
- What must be shown literally instead of implied with marketing language?
- Which one or two domain signals should appear early so the product has a point of view?

## Output Add-On

When slop risk is high, add:

- `Anti-slop constraints: ...`
- `Tropes explicitly avoided: ...`
- `Literal proof shown early: ...`
