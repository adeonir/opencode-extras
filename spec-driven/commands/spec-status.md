---
description: Show detailed status of a specific feature
agent: plan
---

# Status Command

Show detailed progress and status of a specific feature, including task completion.

## Arguments

- `[ID]` - Feature ID (optional if branch is associated or only one feature exists)

Arguments received: $ARGUMENTS

## Process

### Step 1: Resolve Feature

If ID provided (numeric or full like `002-add-2fa`):

- Use that feature directly

If no ID:

- Get current git branch
- Search `.specs/*/spec.md` for matching `branch:` in frontmatter
- If found, use that feature
- If not found:
  - If only one feature exists, use it
  - If multiple, list them with `/spec-specs` output and ask user to specify

### Step 2: Load Artifacts

Read from `.specs/{ID}-{feature}/`:

- `spec.md` - Extract frontmatter (status, branch, created, type)
- `plan.md` - Check if exists
- `tasks.md` - Parse task completion if exists

### Step 3: Parse Task Progress

If `tasks.md` exists:

- Count total tasks (lines matching `- [ ] T` or `- [x] T`)
- Count completed tasks (lines matching `- [x] T`)
- Calculate percentage

### Step 4: Determine Next Action

Based on artifacts and status:

| Artifacts        | Status      | Next Action          |
| ---------------- | ----------- | -------------------- |
| spec only        | draft       | `/spec-clarify` or `/spec-plan` |
| spec + plan      | ready       | `/spec-tasks`        |
| spec + plan + tasks | ready    | `/spec-implement`    |
| all              | in-progress | `/spec-implement`    |
| all              | to-review   | `/spec-validate`     |
| all              | done        | `/spec-archive`      |

### Step 5: Display Status

## Output Format

```markdown
## Feature: {ID}-{feature}

| Property | Value           |
| -------- | --------------- |
| Status   | {status}        |
| Type     | {greenfield/brownfield} |
| Branch   | {branch or -}   |
| Created  | {YYYY-MM-DD}    |

### Artifacts

| File     | Status    |
| -------- | --------- |
| spec.md  | Present   |
| plan.md  | Present/Missing |
| tasks.md | Present/Missing |

### Progress

{progress_bar} {completed}/{total} tasks ({percentage}%)

Completed:
- [x] T001 - {description}
- [x] T002 - {description}

Remaining:
- [ ] T003 - {description}
- [ ] T004 - {description}

### Next Step

Run `{next_command}` to {action_description}.
```

## Progress Bar Format

```
[=========>          ] 50%
[====================] 100%
[                    ] 0%
```

## Error Handling

- **Feature not found**: List available features or suggest `/spec-init`
- **No .specs/ directory**: Suggest `/spec-init`
