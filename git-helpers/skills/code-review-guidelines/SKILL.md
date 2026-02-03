---
name: code-review-guidelines
description: Guidelines for performing effective code reviews with confidence scoring and prioritized focus areas
---

# Code Review Guidelines

Guidelines for performing thorough, actionable code reviews.

## Review Philosophy

Be conservative. Only report issues you are confident about. False positives waste developer time and erode trust in the review process.

## Confidence Scoring

Rate each finding 0-100:

| Score | Meaning           | Action                            |
| ----- | ----------------- | --------------------------------- |
| >= 80 | High confidence   | Report as issue                   |
| 50-79 | Medium confidence | Investigate more before reporting |
| < 50  | Low confidence    | Do not report                     |

**Only report issues with >= 80 confidence.**

## Focus Areas (Priority Order)

| Priority | Category    | What to Look For                                                     |
| -------- | ----------- | -------------------------------------------------------------------- |
| 1        | Security    | SQL injection, XSS, auth bypass, credential exposure, path traversal |
| 2        | Bugs        | Logic errors that WILL cause runtime failures, unhandled exceptions  |
| 3        | Data Loss   | Operations that could corrupt or lose user data                      |
| 4        | Performance | Only severe issues: N+1 queries, unbounded loops, memory leaks       |

## What NOT to Report

- Style preferences (naming, formatting, structure)
- Hypothetical issues under unlikely conditions
- Missing error handling for internal code
- Defensive programming for trusted data
- Framework lifecycle suggestions without concrete bugs
- Type suggestions unless they cause runtime errors
- "Could be simplified" suggestions
- Configuration files for local development

## Review Process

1. **Read the diff first** - understand what changed and why
2. **Read full files** when needed for context
3. **Check for patterns** - is this following codebase conventions?
4. **Verify assumptions** - don't assume code is wrong
5. **Score each finding** - only report >= 80 confidence

## Output Format

```markdown
## Issues

- **[{score}] [{file}:{line}]** Brief description
  - Why it's a problem and how to fix it

## Summary

X files reviewed | Y issues | Z suggestions
```

## Self-Check Questions

Before assigning a score, ask:

- "Will this actually cause a bug or security vulnerability?"
- "Do I have enough context to understand why the code is written this way?"
- "Is this a real problem or just a different coding style?"
