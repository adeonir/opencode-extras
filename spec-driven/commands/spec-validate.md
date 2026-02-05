---
description: Validate artifacts, code, and acceptance criteria
agent: build
subtask: true
---

# Validate Command

Validate feature artifacts at any workflow phase. Automatically detects which artifacts exist and runs appropriate validation mode.

## Arguments

- `[ID]` - Feature ID (optional if branch is associated)

Arguments received: $ARGUMENTS

## Process

### Step 1: Resolve Feature

If ID provided:

- Use that feature directly

If no ID:

- Get current git branch
- Search `.specs/*/spec.md` for matching `branch:` in frontmatter
- If found, use that feature
- If not found:
  - If only one feature exists, use it
  - If multiple, list them and ask user to specify

### Step 2: Detect Validation Mode

Check which artifacts exist in `.specs/{ID}-{feature}/`:

| Artifacts Present                     | Mode      | Description                |
| ------------------------------------- | --------- | -------------------------- |
| spec.md only                          | **Spec**  | Validate spec structure    |
| spec.md + plan.md                     | **Plan**  | + documentation compliance |
| spec.md + plan.md + tasks.md          | **Tasks** | + requirements coverage    |
| All + status is in-progress/to-review | **Full**  | + code validation          |

Inform user which mode will be used:

```
Detected mode: {mode} (found: spec.md, plan.md, tasks.md)
```

### Step 3: Load Context

Based on detected mode, read:

- **Mode Spec**: `spec.md`
- **Mode Plan**: `spec.md`, `plan.md`, docs files from plan.md references
- **Mode Tasks**: `spec.md`, `plan.md`, `tasks.md`
- **Mode Full**: All artifacts + filtered `git diff`

**For Mode Full, filter diff by plan.md files:**
```bash
# Extract files from plan.md Critical Files section
git diff --name-only | grep -f <(extract_from_plan_md)
```

### Step 4: Discover Documentation (Mode Plan+)

If mode is Plan or higher:

- Find docs/\*.md, README.md in project root
- Find files referenced in spec.md
- Look for architecture docs, ADRs

### Step 5: Invoke Validator

Invoke the `@spec-validator` agent with:

- Validation mode
- Feature ID and name
- Path to `.specs/{ID}-{feature}/`
- All artifact contents (spec.md, plan.md, tasks.md)
- For Mode Full:
  - Complete git diff output
  - List of files changed
  - Explicit instruction to compare with plan.md Files to Modify/Create
  - Explicit instruction to check all FRs have implementation
  - Explicit instruction to check all ACs have tests
  - Explicit instruction to identify implementation gaps

### Step 6: Present Results

Show validation results based on mode:

**Mode Spec:**

```markdown
## Validation: {ID}-{feature}

### Mode: Spec

### Artifact Structure

| File    | Status | Issues |
| ------- | ------ | ------ |
| spec.md | Valid  | -      |

### Summary

- Status: **Ready for /spec-plan** or **Needs clarification**

### Next Steps

- Run `/spec-clarify` if ambiguities found
- Run `/spec-plan` to generate technical plan
```

**Mode Plan:**

```markdown
## Validation: {ID}-{feature}

### Mode: Plan

### Artifact Structure

| File    | Status | Issues |
| ------- | ------ | ------ |
| spec.md | Valid  | -      |
| plan.md | Valid  | -      |

### Documentation Compliance

| Severity | Issue | Source |
| -------- | ----- | ------ |
| ...      | ...   | ...    |

### Summary

- Status: **Ready for /spec-tasks** or **Needs corrections**
```

**Mode Tasks:**

```markdown
## Validation: {ID}-{feature}

### Mode: Tasks

### Consistency

| Check                 | Status                     |
| --------------------- | -------------------------- |
| Requirements coverage | Passed (5/5 FR have tasks) |
| AC coverage           | Passed (4/4 AC addressed)  |
| Task dependencies     | Passed                     |

### Summary

- Status: **Ready for /spec-implement** or **Needs fixes**
```

**Mode Full:**

```markdown
## Validation: {ID}-{feature}

### Mode: Full

### Artifact Structure

| File | Status | Issues |
|------|--------|--------|
| spec.md | Valid | - |
| plan.md | Valid | - |
| tasks.md | Valid | - |

### Implementation Coverage

| Planned File | Status | Issue |
|--------------|--------|-------|
| src/api/routes.ts | Modified | OK |
| src/services/new.ts | Created | OK |
| src/utils/helpers.ts | NOT MODIFIED | **GAP** |

### Requirements Coverage

| Requirement | Status | Evidence | Issue |
|-------------|--------|----------|-------|
| FR-001 | Implemented | src/api.ts:45 | - |
| FR-002 | Partial | src/service.ts:23 | Missing error handling |
| FR-003 | **Missing** | - | **No implementation** |

### Acceptance Criteria Status

| AC | Status | Test Location | Issue |
|----|--------|---------------|-------|
| AC-001 | Satisfied | src/test.ts:34 | - |
| AC-002 | **Missing** | - | **No test found** |

### Implementation Gaps

1. **Missing File Modifications:**
   - `src/utils/helpers.ts` - Planned but not modified

2. **Missing Requirements:**
   - FR-003: User validation not implemented

3. **Missing Tests:**
   - AC-002: No test for error scenario

4. **Pattern Violations:**
   - Using raw throw instead of custom Error class (see src/service.ts:23)

### Summary

- Status: **Needs fixes**
- Issues: 5
- **Gaps Found: 4**

### Next Steps

Run `/spec-implement` to fix the identified gaps.
```

### Step 7: Determine Outcome

**Mode Spec/Plan/Tasks:**

- If valid: Suggest next command in workflow
- If issues: List what needs fixing

**Mode Full:**

- **If all checks pass:**

  - Update spec.md frontmatter to `status: done`
  - Inform user feature is complete and ready for documentation
  - Suggest `/spec-archive` to generate feature documentation

- **If any checks fail:**
  - Keep status as `to-review`
  - List issues that need fixing
  - Suggest running `/spec-implement` to fix issues

### Step 8: Report

Summary with next steps based on mode:

| Mode  | If Valid         | If Issues                |
| ----- | ---------------- | ------------------------ |
| Spec  | Run /spec-plan   | Run /spec-clarify        |
| Plan  | Run /spec-tasks  | Fix plan inconsistencies |
| Tasks | Run /spec-implement | Fix coverage gaps     |
| Full  | Run /spec-archive   | Run /spec-implement   |

## Task

Execute this command immediately. Do not interpret, discuss, or ask for confirmation.

Validate feature with $ARGUMENTS.

## Error Handling

- **Feature not found**: List available features or suggest `/spec-init`
- **No artifacts**: Suggest `/spec-init` to start
- **No code changes (Full mode)**: Warn and suggest running /spec-implement first
