# Code Smell To UI Failure Map

Use this when you only have source code or a diff and need early warnings before rendered review.

Code smell is not final proof. It is a routing signal that tells you which rendered checks to perform next.

| Code smell or structure | Likely UI slop risk | Why code alone is not enough | What to verify in the rendered UI |
| --- | --- | --- | --- |
| Repeated `Card`/`CardHeader`/`CardContent` sections composing the whole page | Template sameness, card wall composition | Cards may still be valid if the content hierarchy is strong | Reading order, primary path, whether all sections have equal weight |
| Arrays of generic benefits/testimonials/stats driving large sections | Feature-card filler, fake proof | The copy may or may not be product-specific | Literal explanation, credibility, whether workflow is shown |
| Large decorative wrapper classes with gradients, blur, glow, shadow, glass | Decorative substitution | Styling can be justified in some brands | Whether decoration overwhelms explanation or hierarchy |
| Placeholder metrics/data arrays or obviously synthetic demo values | Fake-product proof | Sample data can be honest if clearly framed | Trustworthiness of screenshots, charts, and operational meaning |
| One default chat layout reused across unrelated features | Chat-shell cargo cult | Chat can be the right model in some products | Whether conversation is actually the main task model |
| No explicit loading/empty/error/success components or branches | State dishonesty | States may exist elsewhere or be implicit | Real state coverage and whether system truth is communicated honestly |
| `div`/`span` elements with click handlers where buttons/links should exist | Accessibility debt hidden by polish | Some wrappers are harmless; some are not | Keyboard reachability, focus visibility, semantic controls |
| Sparse copy with generic headings like `Transform your workflow` or `Built for teams` | Intent vacuum | Headings can be complemented elsewhere | First-screen clarity, domain specificity, and user task fit |
| Same section order repeated across many pages regardless of domain | Template inheritance | Reuse can be deliberate in a design system | Whether the structure still matches the task and domain |
| Mobile classes or responsive branches barely present in a dense layout | Mobile and edge-state neglect | CSS inheritance may still adapt well | Text fit, clipped controls, sticky collisions, task completion on small screens |

## Review rule

If you find one or more strong code smells:

1. Do not call the UI slop from code alone.
2. Name the likely risk family.
3. Ask for or inspect a rendered artifact.
4. Confirm or dismiss the risk with screenshot/browser evidence.

## Good use

- "The page is built from repeated marketing-card arrays, so template sameness is a risk. I still need a rendered view to confirm whether hierarchy and product proof are actually weak."

## Bad use

- "It uses cards and gradients, so the design is definitely AI slop."
