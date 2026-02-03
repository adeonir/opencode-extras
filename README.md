# OpenCode Extras

A personal collection of commands, agents, and skills for OpenCode CLI.

## Available Packages

| Package                      | Version | Description                                                     |
| ---------------------------- | ------- | --------------------------------------------------------------- |
| [git-helpers](./git-helpers) | 1.3.0   | Git workflow commands with confidence-scored code review        |
| [spec-driven](./spec-driven) | 2.7.0   | Specification-driven development with requirements traceability |

## Installation

### Using install script (recommended)

The install script creates symlinks, so updates to the repo are automatically reflected.

```bash
# Clone the repo
git clone https://github.com/adeonir/opencode-extras.git
cd opencode-extras

# Global install (default: ~/.config/opencode)
./install.sh

# Or install to a specific project
./install.sh /path/to/project/.opencode
```

### Manual copy

If you prefer copying files instead of symlinks:

```bash
# Global install
cp -r git-helpers/commands/* ~/.config/opencode/commands/
cp -r git-helpers/agents/* ~/.config/opencode/agents/
cp -r git-helpers/skills/* ~/.config/opencode/skills/
cp -r spec-driven/commands/* ~/.config/opencode/commands/
cp -r spec-driven/agents/* ~/.config/opencode/agents/
cp -r spec-driven/skills/* ~/.config/opencode/skills/

# Per-project install
cp -r git-helpers/commands/* .opencode/commands/
cp -r git-helpers/agents/* .opencode/agents/
cp -r git-helpers/skills/* .opencode/skills/
cp -r spec-driven/commands/* .opencode/commands/
cp -r spec-driven/agents/* .opencode/agents/
cp -r spec-driven/skills/* .opencode/skills/
```

This gives you:

```
.opencode/
  commands/
    git-commit.md              -> /git-commit
    git-review.md              -> /git-review
    git-push-pr.md             -> /git-push-pr
    git-summary.md             -> /git-summary
    spec-init.md               -> /spec-init
    spec-clarify.md            -> /spec-clarify
    spec-plan.md               -> /spec-plan
    spec-tasks.md              -> /spec-tasks
    spec-implement.md          -> /spec-implement
    spec-validate.md           -> /spec-validate
    spec-archive.md            -> /spec-archive
    spec-specs.md              -> /spec-specs
    spec-branch.md             -> /spec-branch
    spec-status.md             -> /spec-status
  agents/
    git-code-reviewer.md       -> @git-code-reviewer
    git-guidelines-auditor.md  -> @git-guidelines-auditor
    spec-researcher.md         -> @spec-researcher
    spec-explorer.md           -> @spec-explorer
    spec-architect.md          -> @spec-architect
    spec-validator.md          -> @spec-validator
    spec-tasker.md             -> @spec-tasker
    spec-implementer.md        -> @spec-implementer
    spec-archiver.md           -> @spec-archiver
  skills/
    conventional-commits/SKILL.md    -> Commit message guidelines
    code-review-guidelines/SKILL.md  -> Code review best practices
    spec-writing/SKILL.md            -> Specification writing guidelines
    task-decomposition/SKILL.md      -> Task breakdown guidelines
```

## What's Included

### Commands

Commands are triggered with `/command-name` in the TUI.

**git-helpers:**

| Command       | Description                              |
| ------------- | ---------------------------------------- |
| `/git-commit` | Create commits with auto-generated messages |
| `/git-review` | Review changes with confidence scoring   |
| `/git-push-pr`| Push branch and create PR via gh cli     |
| `/git-summary`| Generate PR description to PR_DETAILS.md |

**spec-driven:**

| Command          | Description                              |
| ---------------- | ---------------------------------------- |
| `/spec-init`     | Create feature specification             |
| `/spec-clarify`  | Resolve ambiguities in specification     |
| `/spec-plan`     | Generate technical implementation plan   |
| `/spec-tasks`    | Create task list with dependencies       |
| `/spec-implement`| Execute implementation tasks             |
| `/spec-validate` | Validate artifacts and code quality      |
| `/spec-archive`  | Generate documentation and archive       |
| `/spec-specs`    | List all features by status              |
| `/spec-branch`   | Create feature branch from spec          |
| `/spec-status`   | Show detailed status of a feature        |

### Agents

Agents are invoked with `@agent-name` or automatically by commands.

**git-helpers:**

| Agent                    | Mode     | Description                              |
| ------------------------ | -------- | ---------------------------------------- |
| `@git-code-reviewer`     | subagent | Analyzes code for bugs, security, performance |
| `@git-guidelines-auditor`| subagent | Checks compliance with CLAUDE.md guidelines |

**spec-driven:**

| Agent              | Mode     | Description                              |
| ------------------ | -------- | ---------------------------------------- |
| `@spec-researcher` | subagent | External technology research             |
| `@spec-explorer`   | subagent | Codebase analysis and feature tracing    |
| `@spec-architect`  | subagent | Technical plan creation                  |
| `@spec-validator`  | subagent | Multi-mode artifact validation           |
| `@spec-tasker`     | subagent | Task decomposition and dependency mapping|
| `@spec-implementer`| subagent | Code execution with quality gates        |
| `@spec-archiver`   | subagent | Documentation generation                 |

### Skills

Skills are loaded on-demand by agents via the `skill` tool.

| Skill                    | Description                              |
| ------------------------ | ---------------------------------------- |
| `conventional-commits`   | Commit message guidelines and rules      |
| `code-review-guidelines` | Code review best practices and scoring   |
| `spec-writing`           | Specification writing guidelines         |
| `task-decomposition`     | Task breakdown and dependency mapping    |

## Configuration

### Agent Options

All agents include:

- `temperature`: Low values (0.1-0.2) for deterministic tasks
- `steps`: Maximum iterations to control cost
- `permission.bash`: Granular command restrictions

### Command Options

All commands specify:

- `agent`: Which agent to use (build/plan)
- `subtask`: Run in isolated context (for review commands)

## Requirements

- [OpenCode CLI](https://github.com/opencode-ai/opencode) v1.0+
- `gh` CLI (for PR operations in git-helpers)

## Customization

### Override Agent Settings

You can override agent settings per-project in `opencode.json`:

```json
{
  "$schema": "https://opencode.ai/config.json",
  "agent": {
    "git-code-reviewer": {
      "temperature": 0.2,
      "steps": 30
    }
  }
}
```

### Skill Permissions

Control skill access per-agent:

```json
{
  "permission": {
    "skill": {
      "*": "allow",
      "experimental-*": "deny"
    }
  }
}
```

## License

MIT

## Credits

Based on [claude-code-extras](https://github.com/adeonir/claude-code-extras) workflows.
