---
name: validation-checklists
description: Structured validation checklists for spec, plan, tasks, and full validation modes
---

# Validation Checklists

Pre-defined checklists for each validation mode. Follow these exactly.

## Mode Spec (spec.md only)

Validate basic structure after `/spec-init`:

```markdown
### Structure Checks

- [ ] Valid YAML frontmatter with: id, feature, type, status, created
- [ ] Contains `## Overview` section
- [ ] Contains `## Functional Requirements` with FR-xxx items
- [ ] Contains `## Acceptance Criteria` with AC-xxx items
- [ ] FR-xxx numbering is sequential (FR-001, FR-002...)
- [ ] AC-xxx numbering is sequential (AC-001, AC-002...)
- [ ] If type=brownfield, contains `## Baseline` section

### Ambiguity Check

- [ ] Count `[NEEDS CLARIFICATION]` markers
- [ ] If > 0, suggest `/spec-clarify`
```

## Mode Plan (spec.md + plan.md)

Validate after `/spec-plan`:

```markdown
### Spec Structure (reuse Mode Spec checks)

### Plan Structure

- [ ] Contains `## Critical Files` section
- [ ] Has Reference Files table
- [ ] Has Files to Modify table  
- [ ] Has Files to Create table
- [ ] Contains `## Architecture Decision` section
- [ ] Contains `## Requirements Traceability` table
- [ ] Every FR-xxx appears in traceability table
- [ ] Every FR-xxx maps to at least one component

### Documentation Compliance

For each documentation file:
- [ ] Schema completeness: all documented fields present in plan
- [ ] Behavior coverage: all operations planned
- [ ] Constraints reflected in architecture

### Inconsistency Detection

| Severity | Issue |
|----------|-------|
| Critical | Missing required field, core behavior not planned |
| Warning | Optional feature not planned, minor difference |
```

## Mode Tasks (spec.md + plan.md + tasks.md)

Validate after `/spec-tasks`:

```markdown
### Spec + Plan (reuse Mode Plan checks)

### Tasks Structure

- [ ] Has sequential task IDs (T001, T002...)
- [ ] All tasks have valid markers ([P] or [B:Txxx])
- [ ] Checkboxes present for all tasks
- [ ] Contains `## Quality Gates` section

### Requirements Coverage

- [ ] Each FR-xxx has at least one task
- [ ] Each AC-xxx has validation approach

### Dependency Validation

- [ ] Each `[B:Txxx]` references existing task
- [ ] No circular dependencies detected
```

## Mode Full (all artifacts + code)

Validate after `/spec-implement`:

```markdown
### All Artifacts (reuse Mode Tasks checks)

### Code Analysis

**Diff Filtering** (only analyze files from plan.md):
```bash
# Get files from plan.md Critical Files section
# Filter git diff to only these files
git diff --name-only | grep -f plan_files.txt
```

### Acceptance Criteria Status

For each AC-xxx:
- [ ] Mark as: Satisfied / Partial / Missing
- [ ] Note specific evidence

### Architecture Compliance

- [ ] Decisions from plan.md were followed
- [ ] Patterns match plan specification
- [ ] Component structure as designed

### Code Issues (confidence >= 80 only)

Report only high-confidence issues:
- [ ] Project guidelines compliance (CLAUDE.md)
- [ ] Bug detection (logic errors, null handling)
- [ ] Security vulnerabilities

### Planning Gaps

- [ ] List new files not in plan.md (non-blocking)
- [ ] Note for future improvements
```

## Auto-Detection Logic

Validator automatically detects mode by file existence:

```
IF tasks.md exists → Mode Full (check for git diff)
ELSE IF plan.md exists → Mode Tasks
ELSE IF spec.md exists → Mode Plan
ELSE → Mode Spec
```

## Output Format

Use this exact format for all validation reports:

```markdown
## Validation: {ID}-{feature}

### Mode: {detected_mode}

### Artifact Structure

| File | Status | Issues |
|------|--------|--------|
| spec.md | {Valid/Warning/Error} | {count or -} |
| plan.md | {Valid/Warning/Error/N/A} | {count or -} |
| tasks.md | {Valid/Warning/Error/N/A} | {count or -} |

### Consistency Checks

| Check | Status | Details |
|-------|--------|---------|
| Requirements coverage | {Passed/Warning/Failed} | {X/Y FR} |
| AC coverage | {Passed/Warning/Failed} | {X/Y AC} |
| Task dependencies | {Passed/Warning} | - |
| Critical files | {Passed/Warning/Failed} | - |

### Summary

- Mode: {mode}
- Artifacts: {X valid, Y warnings, Z errors}
- Consistency: {X passed, Y warnings, Z failed}
- Issues: {count} (confidence >= 80)
- Status: **{Ready/Needs fixes/Needs clarification}**

### Next Steps

{based on findings}
```

## Rules

1. **Follow checklist order**: Don't skip sections
2. **Be specific**: Include file:line for issues
3. **Be actionable**: Every issue has a fix suggestion
4. **Minimize noise**: Only report confidence >= 80
5. **Auto-detect mode**: Based on file existence, not user input
