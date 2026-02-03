# Changelog

## 2026-02-03

### Changed

- Commands renamed with prefix to avoid path-like naming (`/git-commit` instead of `/git/commit`)
- Updated all internal references in commands and agents
- Simplified installation: files copy directly to `.opencode/commands/` without subdirectories

## 2026-02-02

### Added

- Initial release with pure markdown structure (no dependencies)
- git-helpers commands: `/git-commit`, `/git-review`, `/git-push-pr`, `/git-summary`
- git-helpers agents: `@git/code-reviewer`, `@git/guidelines-auditor`
- spec-driven commands: `/spec-init`, `/spec-clarify`, `/spec-plan`, `/spec-tasks`, `/spec-implement`, `/spec-validate`, `/spec-archive`, `/spec-specs`
- spec-driven agents: `@spec/researcher`, `@spec/explorer`, `@spec/architect`, `@spec/validator`, `@spec/tasker`, `@spec/implementer`, `@spec/archiver`
- Installation instructions using `cp -r` into `.opencode/` directories
