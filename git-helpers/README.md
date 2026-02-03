# Git Helpers

Git workflow commands with confidence-scored code review for OpenCode CLI.

## Commands

| Command         | Description                                 |
| --------------- | ------------------------------------------- |
| `/git/commit`   | Create commits with auto-generated messages |
| `/git/review`   | Review changes with confidence scoring      |
| `/git/push-pr`  | Push branch and create PR                   |
| `/git/summary`  | Generate PR description to file             |

## Agents

| Agent                     | Description                                   |
| ------------------------- | --------------------------------------------- |
| `@git/code-reviewer`      | Analyzes code for bugs, security, performance |
| `@git/guidelines-auditor` | Checks compliance with CLAUDE.md guidelines   |

## Usage

### Code Review

```bash
/git/review              # Review uncommitted changes
/git/review main         # Compare against main branch
/git/review --comment    # Post review as PR comment
```

### Commit Workflow

```bash
/git/commit              # Stage all files and commit
/git/commit -s           # Commit only staged files
```

### PR Management

```bash
/git/summary             # Generate PR description to PR_DETAILS.md
/git/push-pr             # Push and create PR via gh cli
/git/push-pr main        # Create PR against main branch
```

## Installation

```bash
cp -r git-helpers/commands .opencode/commands/git
cp -r git-helpers/agents .opencode/agents/git
```

## Requirements

- OpenCode CLI
- `gh` CLI (for PR operations)
