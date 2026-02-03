---
name: task-decomposition
description: Guidelines for breaking down features into well-organized tasks with proper dependencies and traceability
---

# Task Decomposition Guidelines

How to break down features into implementable tasks.

## Task Structure

Each task should be:

- **Atomic**: Completable in one session
- **Testable**: Has verifiable outcome
- **Independent**: Minimal dependencies
- **Traceable**: Maps to requirements

## Task ID Format

```
T001, T002, T003...
```

Sequential, zero-padded, never reused.

## Dependency Markers

| Marker    | Meaning                              |
| --------- | ------------------------------------ |
| `[P]`     | Parallel-safe, no dependencies       |
| `[B:T001]`| Blocked by T001                      |
| `[B:T001,T002]` | Blocked by multiple tasks      |

## Component Grouping

Group tasks by component/feature area:

```markdown
### User Authentication

- [ ] T001 [P] Create auth types and interfaces
- [ ] T002 [B:T001] Implement AuthService
- [ ] T003 [B:T002] Add auth middleware
- [ ] T004 [B:T002] Write AuthService tests
```

## Natural Order Within Groups

1. **Setup**: Configuration, dependencies
2. **Types**: Interfaces, type definitions
3. **Implementation**: Core logic
4. **Integration**: Connect to existing code
5. **Tests**: Unit and integration tests

## Task Description Format

```markdown
- [ ] T001 [P] {verb} {what} in {where}
```

**Good:**

```
- [ ] T001 [P] Create User interface in src/types/user.ts
- [ ] T002 [B:T001] Implement UserService with CRUD operations
```

**Bad:**

```
- [ ] T001 Do the user stuff
- [ ] T002 Fix things
```

## Requirements Coverage

Every task should trace to requirements:

```markdown
## Requirements Coverage

| Requirement | Tasks        | Status      |
| ----------- | ------------ | ----------- |
| FR-001      | T001, T002   | Covered     |
| FR-002      | T003, T004   | Covered     |
| AC-001      | T005         | Covered     |
```

## Quality Gates

Include quality gate commands at the end:

```markdown
## Quality Gates

Run after each task:
- `pnpm lint` (use `--fix` if available)
- `pnpm typecheck`
- `pnpm test` (for test tasks)
```

## Progress Tracking

```markdown
## Progress

Completed: 3 | Remaining: 5 | Blocked: 1
```

Update counters as tasks complete.

## Task Size Guidelines

| Size   | Time    | Scope                           |
| ------ | ------- | ------------------------------- |
| Small  | < 30min | Single file, simple change      |
| Medium | 30-60min| Multiple files, moderate logic  |
| Large  | > 60min | Should be split into subtasks   |

If a task feels too large, decompose further.
