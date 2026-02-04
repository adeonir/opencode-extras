---
description: Push branch and create PR with generated details
agent: build
---

# Push PR Command

Push current branch and create Pull Request via `gh` cli.

## Arguments

- **No argument**: Auto-detect base branch (main > master > develop)
- **`base-branch`**: Use specified branch as base

## Process

1. **Check gh cli availability**:
   ```bash
   which gh
   ```
   If not available, stop and inform user to install `gh` cli.

2. **Detect base branch** (if not specified):
   ```bash
   git branch -a | grep -E "(main|master|develop)$" | head -1
   ```

3. **Gather context**:
   ```bash
   git branch --show-current
   git log {base}..HEAD --oneline
   git diff {base}...HEAD --stat
   git diff {base}...HEAD
   ```

4. **Analyze changes**:
   - Review commits and diff
   - Determine appropriate PR type

5. **Create PR**:
   ```bash
   gh pr create --title "type: description" --body "..."
   ```

## PR Types

| Type | Use when |
|------|----------|
| `feat` | Adding new functionality |
| `fix` | Fixing a bug |
| `refactor` | Restructuring code without changing behavior |
| `chore` | Maintenance tasks, dependencies, configs |
| `docs` | Documentation changes |
| `test` | Adding or updating tests |

## Format

**Title:** `type: concise description` or `type(scope): concise description`

**Body:**

```markdown
Brief summary of what this PR does (2-3 sentences max).

## Changes

- Key change 1
- Key change 2
- Key change 3
```

## Guidelines

- Analyze commits and diff, not conversation context
- Title and description reflect current implementation
- Be specific about functionality
- Focus on WHAT, not HOW
- Use imperative mood: "add", "fix", "implement"
- Keep changes list to 3-5 key items
- No risk assessment or testing instructions
- **Scope in title is allowed** - both `feat:` and `feat(scope):` are valid
- **NEVER add attribution lines**

## Task

Generate PR details for current branch with $ARGUMENTS and create PR using `gh pr create`.

Output the PR URL when done.
