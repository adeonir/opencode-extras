# Git Helpers

Git workflow commands with confidence-scored code review for OpenCode CLI.

## Commands

| Command        | Description                                 |
| -------------- | ------------------------------------------- |
| `/git-commit`  | Create commits with auto-generated messages |
| `/git-review`  | Review changes with confidence scoring      |
| `/git-push-pr` | Push branch and create PR                   |
| `/git-summary` | Generate PR description to file             |

## Agents

| Agent                    | Description                                   |
| ------------------------ | --------------------------------------------- |
| `@git-code-reviewer`     | Analyzes code for bugs, security, performance |
| `@git-guidelines-auditor`| Checks compliance with CLAUDE.md guidelines   |

## Skills

| Skill                    | Description                                   |
| ------------------------ | --------------------------------------------- |
| `conventional-commits`   | Commit message guidelines and rules           |
| `code-review-guidelines` | Code review best practices and scoring        |
| `git-workflow-patterns`  | Standardized patterns for git diff analysis   |

## Usage

### Code Review

```bash
/git-review              # Review uncommitted changes
/git-review main         # Compare against main branch
/git-review --comment    # Post review as PR comment
```

### Commit Workflow

```bash
/git-commit              # Stage all files and commit
/git-commit -s           # Commit only staged files
```

### PR Management

```bash
/git-summary             # Generate PR description to PR_DETAILS.md
/git-push-pr             # Push and create PR via gh cli
/git-push-pr main        # Create PR against main branch
```

## Installation

```bash
cp -r git-helpers/commands/* .opencode/commands/
cp -r git-helpers/agents/* .opencode/agents/
cp -r git-helpers/skills/* .opencode/skills/
```

## Agent Configuration

All agents include optimized settings for performance:

| Agent | Steps | Temperature | Focus |
|-------|-------|-------------|-------|
| `git-code-reviewer` | 15 | 0.1 | Bug detection, security |
| `git-guidelines-auditor` | 12 | 0.1 | CLAUDE.md compliance |

- **permission.bash**: Restricted to safe commands (git, find, cat)

### Override Settings

In your `opencode.json`:

```json
{
  "agent": {
    "git-code-reviewer": {
      "temperature": 0.2,
      "steps": 30
    }
  }
}
```

## Requirements

- OpenCode CLI v1.0+
- `gh` CLI (for PR operations)
