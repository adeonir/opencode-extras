# Spec-Driven Development

Specification-driven development workflow with requirements traceability and persistent artifacts for OpenCode CLI.

## Commands

| Command           | Description                            |
| ----------------- | -------------------------------------- |
| `/spec-init`      | Create feature specification           |
| `/spec-clarify`   | Resolve ambiguities in specification   |
| `/spec-plan`      | Generate technical implementation plan |
| `/spec-tasks`     | Create task list with dependencies     |
| `/spec-implement` | Execute implementation tasks           |
| `/spec-validate`  | Validate artifacts and code quality    |
| `/spec-archive`   | Generate documentation and archive     |
| `/spec-specs`     | List all features by status            |
| `/spec-branch`    | Create feature branch from spec        |
| `/spec-status`    | Show detailed status of a feature      |

## Agents

| Agent              | Description                               |
| ------------------ | ----------------------------------------- |
| `@spec-researcher` | External technology research              |
| `@spec-explorer`   | Codebase analysis and feature tracing     |
| `@spec-architect`  | Technical plan creation                   |
| `@spec-validator`  | Multi-mode artifact validation            |
| `@spec-tasker`     | Task decomposition and dependency mapping |
| `@spec-implementer`| Code execution with quality gates         |
| `@spec-archiver`   | Documentation generation                  |

## Skills

| Skill                | Description                               |
| -------------------- | ----------------------------------------- |
| `spec-writing`       | Specification writing guidelines          |
| `task-decomposition` | Task breakdown and dependency mapping     |

## Workflow

### 1. Initialize Feature

```bash
/spec-init "Add user authentication"     # Create spec from description
/spec-init @requirements.md              # Use file as context
/spec-init --link 001                    # Link to existing feature
```

### 2. Create Branch

```bash
/spec-branch                 # Create branch from current feature
/spec-branch 001             # Create branch for specific feature
```

### 3. Clarify and Plan

```bash
/spec-clarify            # Resolve marked ambiguities
/spec-plan               # Generate technical plan
```

### 4. Task Management

```bash
/spec-tasks              # Create task list
/spec-implement T001     # Execute specific task
/spec-implement --all    # Execute all pending tasks
```

### 5. Quality and Documentation

```bash
/spec-validate           # Multi-mode validation
/spec-archive            # Generate documentation
/spec-specs              # List all features
/spec-status             # Detailed feature status
```

## Features

- **Requirements Traceability**: Map requirements to implementation tasks
- **Multi-mode Validation**: spec -> plan -> tasks -> full validation
- **Persistent Artifacts**: spec.md, plan.md, tasks.md files
- **Task Dependencies**: Automatic dependency management with [P] and [B:Txxx] markers
- **Quality Gates**: Lint, typecheck, test automation after each task
- **Branch Integration**: Automatic branch creation and linking

## Installation

```bash
cp -r spec-driven/commands/* .opencode/commands/
cp -r spec-driven/agents/* .opencode/agents/
cp -r spec-driven/skills/* .opencode/skills/
```

## Agent Configuration

All agents include optimized settings:

- **temperature**: 0.1-0.2 (deterministic output)
- **steps**: Limited iterations per agent type
- **permission.bash**: Restricted to safe commands where applicable

### Override Settings

In your `opencode.json`:

```json
{
  "agent": {
    "spec-implementer": {
      "temperature": 0.3,
      "steps": 60
    }
  }
}
```

## Requirements

- OpenCode CLI v1.0+
