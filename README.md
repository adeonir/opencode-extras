# OpenCode Extras

A personal collection of commands and agents for OpenCode CLI.

## Available Packages

| Package                      | Description                                                     |
| ---------------------------- | --------------------------------------------------------------- |
| [git-helpers](./git-helpers) | Git workflow commands with confidence-scored code review        |
| [spec-driven](./spec-driven) | Specification-driven development with requirements traceability |

## Installation

Copy the commands and agents directories into your project's `.opencode/` folder:

```bash
# git-helpers
cp -r opencode-extras/git-helpers/commands .opencode/commands/git
cp -r opencode-extras/git-helpers/agents .opencode/agents/git

# spec-driven
cp -r opencode-extras/spec-driven/commands .opencode/commands/spec
cp -r opencode-extras/spec-driven/agents .opencode/agents/spec
```

This gives you:

```
.opencode/
  commands/
    git/
      commit.md       -> /git/commit
      review.md       -> /git/review
      push-pr.md      -> /git/push-pr
      summary.md      -> /git/summary
    spec/
      init.md         -> /spec/init
      clarify.md      -> /spec/clarify
      plan.md         -> /spec/plan
      tasks.md        -> /spec/tasks
      implement.md    -> /spec/implement
      validate.md     -> /spec/validate
      archive.md      -> /spec/archive
      specs.md        -> /spec/specs
  agents/
    git/
      code-reviewer.md      -> @git/code-reviewer
      guidelines-auditor.md -> @git/guidelines-auditor
    spec/
      researcher.md         -> @spec/researcher
      explorer.md           -> @spec/explorer
      architect.md          -> @spec/architect
      validator.md          -> @spec/validator
      tasker.md             -> @spec/tasker
      implementer.md        -> @spec/implementer
      archiver.md           -> @spec/archiver
```

## Requirements

- [OpenCode CLI](https://github.com/opencode-ai/opencode)
- `gh` CLI (for PR operations in git-helpers)

## License

MIT

## Credits

Based on [claude-code-extras](https://github.com/adeonir/claude-code-extras) workflows.
