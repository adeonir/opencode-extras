---
description: Create and checkout feature branch from spec
agent: build
---

# Branch Command

Create a git branch based on the feature spec and link them together.

## Arguments

- `[ID]` - Feature ID (optional if only one feature exists)

Arguments received: $ARGUMENTS

## Process

### Step 1: Resolve Feature

If ID provided (numeric or full like `002-add-2fa`):

- Use that feature directly

If no ID:

- If only one feature exists in `.specs/`, use it
- If multiple, list them and ask user to specify

### Step 2: Load Specification

Read `.specs/{ID}-{feature}/spec.md`

If file doesn't exist, inform user to run `/spec-init` first.

### Step 3: Check Current Branch

```bash
git branch --show-current
```

If already on a feature branch for this spec (frontmatter `branch` matches current), inform user and exit.

### Step 4: Check for Existing Branch

Check if branch already exists:

```bash
git branch -a | grep "feature/{feature}"
```

If exists:

- Ask user: "Branch `feature/{feature}` already exists. Checkout? (Yes/No)"
- If yes: checkout existing branch
- If no: exit

### Step 5: Create Feature Branch

Determine base branch:

```bash
git branch -a | grep -E "(main|master|develop|development)$" | head -1
```

Create and checkout new branch:

```bash
git checkout -b feature/{feature}
```

### Step 6: Update Spec Frontmatter

Update `.specs/{ID}-{feature}/spec.md` frontmatter:

- Set `branch: feature/{feature}`

### Step 7: Report

Inform the user:

- Branch created: `feature/{feature}`
- Based on: `{base-branch}`
- Spec updated with branch association
- Next step: `/spec-plan` to generate technical plan (if not done)

## Branch Naming

Format: `feature/{feature-name}`

Examples:

- `feature/user-auth`
- `feature/add-2fa`
- `feature/payment-flow`

## Error Handling

- **Feature not found**: List available features or suggest `/spec-init`
- **Spec not found**: Inform user to run `/spec-init` first
- **Uncommitted changes**: Warn user and suggest committing or stashing
- **Branch exists**: Offer to checkout existing branch
