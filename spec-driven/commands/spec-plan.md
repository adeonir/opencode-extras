---
description: Explore codebase and generate technical plan
agent: plan
---

# Plan Command

Analyze the codebase and create a comprehensive technical plan for implementing the feature.

## Arguments

- `[ID]` - Feature ID (optional if branch is associated)
- `[additional instructions]` - Extra context for research or planning

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
  - If multiple, list them and ask user to specify

### Step 2: Load Specification

Read `.specs/{ID}-{feature}/spec.md`

If file doesn't exist, inform user to run `/spec-init` first.

### Step 3: Check for Clarifications

Search for `[NEEDS CLARIFICATION]` in the spec.

If found:

- List the items needing clarification
- Suggest running `/spec-clarify` first
- Exit

### Step 4: Research External Information

Determine if web research is needed by checking:

1. **User provided additional instructions** with the `/spec-plan` command
2. **Spec mentions external technologies**: libraries, frameworks, APIs, services
3. **Spec references standards or protocols** that need verification

If research is needed:

- Check if `docs/research/{topic}.md` already exists for the technology
- If exists, use existing research
- If not, invoke the `@spec-researcher` agent

The researcher will create `docs/research/{topic}.md` with findings (shared across features).

Skip research if:

- The spec is purely about internal code changes
- No external dependencies mentioned
- Research already exists for all mentioned technologies

### Step 5: Check for MCPs

Detect available MCPs for enhanced code analysis:

```bash
# Check for Serena MCP in opencode config
CONFIG_FILE="${HOME}/.config/opencode/opencode.json"
SERENA=$(grep -q '"serena"' "$CONFIG_FILE" 2>/dev/null && echo "true" || echo "false")
```

Inform user which MCPs are available before exploration.

### Step 6: Explore Codebase

Invoke the `@spec-explorer` agent with:

- Feature name and context from spec.md
- MCP availability status
- Explicit instruction to READ file contents, not just list them

The explorer will:
1. Find and read documentation files
2. Identify similar existing features
3. Read 3-5 reference files to extract actual code patterns
4. Document conventions with file:line references
5. Map entry points and dependencies
6. Identify files to modify and create

### Step 7: Review Exploration Results

Read the explorer's output carefully, focusing on:

**Conventions Table:**
- Naming conventions (functions, classes, variables)
- Import/export patterns
- Error handling approach
- Type definitions style

**Essential Files:**
- **Reference Files**: Patterns to follow (with specific file:line examples)
- **Files to Modify**: Existing files that need changes
- **Files to Create**: New files to be added
- **Dependencies**: Files that will be imported

If the explorer output lacks specific file:line references or pattern details, invoke it again with more specific instructions.

### Step 8: Generate Plan

Invoke the `@spec-architect` agent with:

- The specification (spec.md)
- Research summary (from docs/research/ if applicable)
- Exploration insights
- Consolidated critical files list
- Feature ID and name

The architect will create `.specs/{ID}-{feature}/plan.md`

Include a Research Summary section if external research was used:

```markdown
## Research Summary

> From [docs/research/totp-authentication.md]

Key points:

- {relevant findings}
```

### Step 9: Update Status

Update spec.md frontmatter:

- Set `status: ready`

### Step 10: Report

Inform the user:

- Research conducted (if applicable) at `docs/research/{topic}.md`
- Plan created at `.specs/{ID}-{feature}/plan.md`
- Key architectural decisions made
- Suggest running `/spec-validate` to validate the plan against documentation (optional)
- Next step: `/spec-tasks` to generate task list

## Error Handling

- **Feature not found**: List available features or suggest `/spec-init`
- **Spec not found**: Inform user to run `/spec-init` first
- **Clarifications pending**: Suggest `/spec-clarify` first
- **Codebase unclear**: Ask user for guidance on patterns to follow
