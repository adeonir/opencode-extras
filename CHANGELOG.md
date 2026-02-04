# Changelog

## 2026-02-04

### Added

- **spec-driven v2.8.0**: Performance optimization release
  - 4 new skills: `codebase-exploration`, `output-templates`, `validation-checklists`, `research-cache`
  - All agents optimized with reduced steps (30-40% reduction)
  - Automatic validation mode detection
  - Research caching with TTL and metadata

## 2026-02-03

### Added

- **Skills**: New reusable instruction files for agents
  - `conventional-commits`: Commit message guidelines and rules
  - `code-review-guidelines`: Code review best practices and scoring
  - `spec-writing`: Specification writing guidelines
  - `task-decomposition`: Task breakdown and dependency mapping
- **New commands**:
  - `/spec-branch`: Create feature branch from spec and link them
  - `/spec-status`: Show detailed status with task progress
- **Agent improvements**:
  - Added `temperature` (0.1-0.2) for deterministic output
  - Added `steps` limit to control cost per agent
  - Added granular `permission.bash` restrictions for security
  - Added `permission.webfetch: allow` for researcher agent
- **Command improvements**:
  - Added `agent` specification (build/plan) to all commands
  - Added `subtask: true` to review commands for isolated context

### Changed

- Commands renamed with prefix to avoid path-like naming (`/git-commit` instead of `/git/commit`)
- Agents renamed with prefix for consistency (`@git-code-reviewer` instead of `@git/code-reviewer`)
- Updated all internal references in commands and agents
- Simplified installation: files copy directly to `.opencode/commands/`, `.opencode/agents/`, and `.opencode/skills/`
- Updated READMEs with skills documentation and agent configuration examples
- Bumped git-helpers to v1.3.0
- Bumped spec-driven to v2.7.0

## 2026-02-02

### Added

- Initial release with pure markdown structure (no dependencies)
- git-helpers commands: `/git-commit`, `/git-review`, `/git-push-pr`, `/git-summary`
- git-helpers agents: `@git/code-reviewer`, `@git/guidelines-auditor`
- spec-driven commands: `/spec-init`, `/spec-clarify`, `/spec-plan`, `/spec-tasks`, `/spec-implement`, `/spec-validate`, `/spec-archive`, `/spec-specs`
- spec-driven agents: `@spec/researcher`, `@spec/explorer`, `@spec/architect`, `@spec/validator`, `@spec/tasker`, `@spec/implementer`, `@spec/archiver`
- Installation instructions using `cp -r` into `.opencode/` directories
