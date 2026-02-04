---
name: output-templates
description: Standardized output templates for plan.md, tasks.md, and exploration results
---

# Output Templates

Pre-defined templates for consistent agent outputs. Use these exact formats.

## Template: plan.md

```markdown
# Technical Plan: {feature_name}

## Context

- Feature: {ID}-{feature}
- Created: {date}
- Spec: .specs/{ID}-{feature}/spec.md

## Research Summary

> From [docs/research/{topic}.md]

Key points:

- {key_point_1}
- {key_point_2}

## Documentation Context

> Sources reviewed: {list}

Key insights:

- {insight_1}
- {insight_2}

## Critical Files

### Reference Files

| File | Purpose |
|------|---------|
| {path} | {why} |

### Files to Modify

| File | Reason |
|------|--------|
| {path} | {what} |

### Files to Create

| File | Purpose |
|------|---------|
| {path} | {responsibility} |

## Codebase Patterns

{patterns with file:line references}

## Architecture Decision

{chosen_approach_with_rationale}

## Component Design

| Component | File | Responsibility |
|-----------|------|----------------|
| {name} | {path} | {what_it_does} |

## Implementation Map

{specific files with descriptions}

## Data Flow

{flow from entry to output}

## Requirements Traceability

| Requirement | Component | Files | Notes |
|-------------|-----------|-------|-------|
| FR-001 | {comp} | {paths} | {note} |

## Test Strategy

### Existing Infrastructure

| Aspect | Detail |
|--------|--------|
| Framework | {jest/vitest/etc} |
| Location | {__tests__/etc} |
| Command | {npm test/etc} |

### Reference Tests

| Test file | Demonstrates |
|-----------|--------------|
| {path} | {pattern} |

### New Tests

| Component | Test file | What to test |
|-----------|-----------|--------------|
| {comp} | {path} | {scenarios} |

## Considerations

- Error Handling: {approach}
- Security: {concerns}
```

## Template: tasks.md

```markdown
# Tasks: {feature_name}

Feature: {ID}-{feature}
Total: {count} | Completed: 0 | Remaining: {count}

## Artifacts

- Spec: .specs/{ID}-{feature}/spec.md
- Plan: .specs/{ID}-{feature}/plan.md
- Research: docs/research/{topic}.md (if exists)

## Quality Gates

Run after completing each task or range of tasks:

```bash
{detected_quality_commands}
```

## Tasks

- [ ] T001 [P] {verb} {what} in {where}
- [ ] T002 [B:T001] {verb} {what} in {where}

---

Legend: [P] = parallel-safe, [B:Txxx] = blocked by task(s)

## Requirements Coverage

| Requirement | Task(s) | Description |
|-------------|---------|-------------|
| FR-001 | T001, T002 | {brief} |
| AC-001 | T003 | {how_validated} |
```

## Template: Exploration Output

```markdown
## Documentation Findings

- `path/to/file.md`: Description

## Entry Points

| File | Line | Purpose |
|------|------|---------|
| {path} | {line} | {desc} |

## Code Flow

1. **{step}**: `{path}:{line}` - {description}

## Architecture

- **Pattern**: {pattern}
- **Layers**: {layers}
- **Abstractions**: {wrappers}

## Conventions

| Aspect | Uses | Avoid | Reference |
|--------|------|-------|-----------|
| {aspect} | {use} | {avoid} | {file} |

## Test Infrastructure

- **Framework**: {framework}
- **Location**: {location}
- **Command**: {command}

## Essential Files

1. `{path}` - {purpose}
```

## Template: Validation Report

```markdown
## Validation: {ID}-{feature}

### Mode: {spec|plan|tasks|full}

### Artifact Structure

| File | Status | Issues |
|------|--------|--------|
| spec.md | {Valid/Warning/Error} | {issues} |
| plan.md | {Valid/Warning/Error} | {issues} |
| tasks.md | {Valid/Warning/Error} | {issues} |

### Consistency

| Check | Status |
|-------|--------|
| Requirements coverage | {Passed/Warning/Failed} |
| AC coverage | {Passed/Warning/Failed} |
| Task dependencies | {Passed/Warning} |
| Critical files | {Passed/Warning/Failed} |

### Summary

- Status: **{Ready/Needs fixes/Needs clarification}**
- Issues: {count}

### Next Steps

{suggestions}
```

## Usage Rules

1. **Use exact structure**: Don't add/remove sections
2. **Fill all fields**: Use "N/A" if not applicable
3. **Be consistent**: Same format across all outputs
4. **Use tables**: Prefer tables over lists for structured data
