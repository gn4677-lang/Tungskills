# Rendered UI Review Protocol

Use this when a local app, URL, Storybook, prototype, or screenshots are available.

## Steps

1. Open or capture the real rendered UI. If none is available, ask for a screenshot, local URL, prototype, generated files, or command to run the app before critiquing.
2. Review at minimum desktop and mobile viewports.
3. Capture or inspect the first screen before scrolling.
4. Exercise the primary task path.
5. Check key states: hover, focus, loading, empty, error, success.
6. If motion exists, review normal and reduced-motion behavior.
7. Run available automated checks, but report their limits.
8. Summarize issues by severity.

## Useful Tools

- Browser or Playwright screenshots for rendered reality.
- Playwright `toHaveScreenshot()` for visual regression, not taste.
- Axe or Lighthouse for accessibility signals.
- Keyboard-only smoke test for focus and reachability.
- DOM inspection for labels, roles, and disabled state.

## Evidence Standard

When making a claim, mention the evidence:

- "Observed in screenshot at 390px wide..."
- "Keyboard focus reached..."
- "Lighthouse flagged..."
- "Could not verify because no runnable UI or screenshot was available..."

## Missing Artifact Response

Use this pattern when the user asks for objective UI review without providing a UI:

> I can review it objectively, but I need a rendered surface first. Send a screenshot, local URL, prototype, generated files, or run command. Without that, the only objective finding is that review is blocked by missing artifact; anything else would be guesswork.
