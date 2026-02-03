# OpenCode Extras

A personal collection of commands and agents for OpenCode CLI.

## Available Packages

| Package                      | Version | Description                                                     |
| ---------------------------- | ------- | --------------------------------------------------------------- |
| [git-helpers](./git-helpers) | 1.2.3   | Git workflow commands with confidence-scored code review        |
| [spec-driven](./spec-driven) | 2.6.1   | Specification-driven development with requirements traceability |

## Installation

### Global (all projects)

Copy to `~/.config/opencode/`:

```bash
# git-helpers
cp -r opencode-extras/git-helpers/commands/* ~/.config/opencode/commands/
cp -r opencode-extras/git-helpers/agents/* ~/.config/opencode/agents/

# spec-driven
cp -r opencode-extras/spec-driven/commands/* ~/.config/opencode/commands/
cp -r opencode-extras/spec-driven/agents/* ~/.config/opencode/agents/
```

### Per-project

Copy to your project's `.opencode/` folder:

```bash
# git-helpers
cp -r opencode-extras/git-helpers/commands/* .opencode/commands/
cp -r opencode-extras/git-helpers/agents/* .opencode/agents/

# spec-driven
cp -r opencode-extras/spec-driven/commands/* .opencode/commands/
cp -r opencode-extras/spec-driven/agents/* .opencode/agents/
```

This gives you:

```
.opencode/
  commands/
    git-commit.md          -> /git-commit
    git-review.md          -> /git-review
    git-push-pr.md         -> /git-push-pr
    git-summary.md         -> /git-summary
    spec-init.md           -> /spec-init
    spec-clarify.md        -> /spec-clarify
    spec-plan.md           -> /spec-plan
    spec-tasks.md          -> /spec-tasks
    spec-implement.md      -> /spec-implement
    spec-validate.md       -> /spec-validate
    spec-archive.md        -> /spec-archive
    spec-specs.md          -> /spec-specs
  agents/
    git-code-reviewer.md      -> @git-code-reviewer
    git-guidelines-auditor.md -> @git-guidelines-auditor
    spec-researcher.md        -> @spec-researcher
    spec-explorer.md          -> @spec-explorer
    spec-architect.md         -> @spec-architect
    spec-validator.md         -> @spec-validator
    spec-tasker.md            -> @spec-tasker
    spec-implementer.md       -> @spec-implementer
    spec-archiver.md          -> @spec-archiver
```

## Requirements

- [OpenCode CLI](https://github.com/opencode-ai/opencode)
- `gh` CLI (for PR operations in git-helpers)

## License

MIT

## Credits

Based on [claude-code-extras](https://github.com/adeonir/claude-code-extras) workflows.
