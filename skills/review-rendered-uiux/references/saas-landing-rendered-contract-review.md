# SaaS Landing Rendered Contract Review

Use this when reviewing a rendered SaaS, product marketing, launch, waitlist, or landing page. Do not assign design levels or taste scores. Review concrete contracts against screenshots, browser behavior, and interaction states.

## Required Evidence

- Desktop screenshot, preferably around 1440px wide.
- Mobile screenshot, preferably around 390px wide.
- Section inventory from the rendered page.
- Interaction evidence for tabs, nav menus, carousels, buttons, and hover/focus states.
- Reduced-motion or pause/stop/hide evidence when motion is automatic, looping, or long-running.

If these are unavailable, mark the contract `not_run` instead of guessing.

## Output Shape

```text
Rendered artifact:
Section inventory:
Contract review:
- Requirement:
  Evidence:
  Pass/fail/not_run:
  Severity: must_fix | should_fix | human_judgment
  Fix if fail:
Evidence not run:
Decision: ready | revise | stop
```

## Contract Review Rows

### 1. First-Viewport Product Proof

Pass when:

- first screen identifies what the product is, who it is for, and the primary outcome
- first screen includes a product visual, workflow state, dashboard crop, or concrete product output
- primary CTA is visible and visually ranked above secondary actions
- mobile first screen still contains product/category signal and a cue that the next section exists

Fail when:

- visual proof is stock, abstract, decorative, fake-looking, unrelated, or only a gradient/illustration
- product is not visible in the first viewport
- hero could belong to a generic SaaS template after swapping logo and text

### 2. Section Inventory And Pattern Variety

Pass when:

- each major section has a named purpose
- section order forms a narrative path
- repeated layout skeletons are justified by content rather than template convenience

Fail when:

- three consecutive sections repeat text/image or card-grid structure with no reason
- feature cards, bento blocks, or proof sections are interchangeable
- page order could be shuffled without changing meaning

### 3. CTA And Navigation Hierarchy

Pass when:

- same destination uses consistent CTA labels
- primary, secondary, and tertiary actions have distinct visual weight
- important product/depth links are more findable than generic links

Fail when:

- all nav items have equal weight
- multiple CTAs compete as primary
- hero CTA and nav CTA imply different actions for the same destination

### 4. Clickable Section Completeness

Review tabs, segmented sections, multi-section panels, nav previews, accordions, and carousels.

Pass when:

- every option has real rendered content
- active, hover, focus, keyboard, and mobile states work
- state change does not cause disruptive layout shift

Fail when:

- only the first tab/panel is real
- inactive states are empty, placeholder, or unreachable
- click targets are unclear or keyboard-inaccessible

### 5. Product Visual Quality

Pass when:

- product screenshots are curated to show a specific workflow, decision, or output
- crops reveal important details instead of shrinking an unreadable full dashboard
- product visuals use credible data and domain-specific labels

Fail when:

- fake charts, impossible metrics, lorem ipsum, generic code panes, or unreadable shrunken dashboards carry trust
- screenshots do not match the promised feature

### 6. Copy Outcome And Scanability

Pass when:

- headline states a user/customer outcome
- section headings answer visitor questions or objections
- text blocks are short enough to scan
- visual hierarchy still works in grayscale or squint review

Fail when:

- headings are vague or only feature descriptions
- body copy must be read fully to understand the page
- color alone carries hierarchy

### 7. Motion Purpose And Accessibility

Pass when:

- each motion has a named purpose: focus, continuity, state change, hierarchy, feedback, or perceived loading
- desktop microinteractions are fast and do not delay action
- automatic or long-running motion has pause/stop/hide or reduced-motion handling when needed

Fail when:

- motion is only decorative fade/slide
- auto-scrolling logos or carousels distract without user control
- animations create blur, jank, layout shift, or delay task completion

### 8. Mobile Integrity

Pass when:

- product proof remains visible or quickly reachable
- CTAs remain tappable and not clipped
- text wraps without overflow or awkward single-word lines
- sticky elements do not hide content

Fail when:

- hero consumes the full screen with no product proof or next-section cue
- important visual proof disappears entirely on mobile
- card grids compress into unreadable columns

## Review Rule

The useful output is not "good/bad design." The useful output is a list of observable contract failures and exact repair moves.

If all objective contracts pass but the page still feels bland, classify the remaining issue as `human_judgment` and name the unresolved brand, novelty, emotional tone, or market-positioning decision.
