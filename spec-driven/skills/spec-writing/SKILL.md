---
name: spec-writing
description: Guidelines for writing clear, complete feature specifications with proper requirements and acceptance criteria
---

# Specification Writing Guidelines

How to write clear, actionable feature specifications.

## Content Separation

Each artifact has a distinct purpose. Never mix these concerns.

| File     | Purpose                                            |
| -------- | -------------------------------------------------- |
| spec.md  | WHAT to build (requirements, acceptance criteria)  |
| plan.md  | HOW to build (architecture, files, implementation) |
| tasks.md | WHEN to build (ordered tasks with dependencies)    |

## What spec.md MUST Contain

- User stories (As a... I want... so that...)
- Functional requirements (what the system must do)
- Acceptance criteria (verifiable conditions)
- Business rules and constraints
- For brownfield: current behavior description (high-level, no code)

## What spec.md MUST NOT Contain

- Code snippets or examples
- File paths or directory structures
- Technology choices (React, Node, etc.)
- Implementation approaches
- Database schemas or API designs
- Architecture decisions

## User Story Format

```
As a {user_type}, I want {goal} so that {benefit}
```

**Good:**
```
As a user, I want to reset my password via email so that I can regain access to my account
```

**Bad:**
```
As a user, I want a POST /reset-password endpoint that sends an email using SendGrid
```

## Functional Requirements

Use checkboxes with sequential IDs:

```markdown
- [ ] FR-001: System must allow users to request password reset
- [ ] FR-002: Reset link must expire after 24 hours
- [ ] FR-003: System must invalidate old reset links when new one is requested
```

**Rules:**

- Start with "System must..." or "User must be able to..."
- Be specific and measurable
- One requirement per line
- No implementation details

## Acceptance Criteria

Verifiable conditions for completion:

```markdown
- [ ] AC-001: User receives reset email within 1 minute of request
- [ ] AC-002: Reset link works only once
- [ ] AC-003: Expired links show appropriate error message
```

**Rules:**

- Must be testable (yes/no answer)
- Include edge cases
- Cover error scenarios
- Map to functional requirements

## Handling Ambiguity

Mark unclear items for resolution:

```markdown
- [ ] FR-004: [NEEDS CLARIFICATION: Should reset require account verification?]
```

Run `/spec-clarify` before proceeding to plan phase.

## Brownfield Baseline

For changes to existing systems, document current behavior:

```markdown
## Baseline

### Current Behavior
- Password reset sends email with permanent link
- No expiration on reset links

### Gaps / Limitations
- Links never expire (security risk)
- No rate limiting on reset requests
```

**Important:** Describe BEHAVIOR, not implementation. No file paths, no code.
