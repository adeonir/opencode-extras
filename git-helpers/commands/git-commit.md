---
description: Create commits with well-formatted messages
agent: build
---

# Commit Command

Create a commit with a well-formatted message based on the actual file changes.

## Arguments

- **No flag**: Stage all modified/new files before committing
- **`-s` or `--staged`**: Use only files already staged

## Process

1. **Gather context**:
   ```bash
   git status
   git diff HEAD
   git log --oneline -5
   ```

2. **Analyze changes**:
   - Run `git diff HEAD` to see all changes
   - Describe what the code DOES, not what was discussed
   - Determine appropriate commit type based on actual changes

3. **Stage files** (if not using `-s/--staged`):
   ```bash
   git add .
   ```

4. **Create commit**:
   ```bash
   git commit -m "$(cat <<'EOF'
   type: concise description

   - Optional body item 1
   - Optional body item 2
   EOF
   )"
   ```

5. **Verify commit**:
   ```bash
   git log -1 --format="%B"
   git status
   ```

6. **Handle pre-commit hooks** (if files modified):
   - Check authorship: `git log -1 --format='%an %ae'`
   - Amend commit with modified files (one retry only)

## Commit Types

| Type | Use when |
|------|----------|
| `feat` | Adding new functionality |
| `fix` | Fixing a bug |
| `refactor` | Restructuring code without changing behavior |
| `chore` | Maintenance tasks, dependencies, configs |
| `docs` | Documentation changes |
| `test` | Adding or updating tests |

## Message Format

```
type: concise description in imperative mood

- Optional: area or component affected
- Optional: another key change
```

## Guidelines

**CRITICAL: Message must describe STAGED FILES only, never conversation context**

- **Analyze `git diff --cached` or `git diff HEAD`** - Describe what the code changes DO
- **Never use conversation context** - Don't reference "user asked", "we discussed", etc.
- Be specific about functionality
- Focus on WHAT, not HOW
- Use imperative mood: "add", "fix", "implement"
- No file names or technical decisions
- No version bumps in message
- Include body only for 3+ functional areas
- **NEVER use scope**: use `feat:` not `feat(scope):`
- **NEVER add attribution lines**

## Task

Execute this command immediately. Do not interpret, discuss, or ask for confirmation.

Create a commit for changes with $ARGUMENTS.
