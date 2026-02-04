---
name: codebase-exploration
description: Standardized patterns and templates for codebase analysis and exploration
---

# Codebase Exploration Guidelines

Standardized approach for analyzing codebases to extract patterns, conventions, and architecture insights.

## Quick Start Commands

Use these commands to explore the codebase efficiently:

```bash
# Find documentation files
find . -type f \( -name "README.md" -o -name "CLAUDE.md" -o -name "*.md" \) | grep -E "^(./docs/|./.docs/|./architecture/)" | head -20

# Find configuration files
find . -maxdepth 2 -type f \( -name "package.json" -o -name "tsconfig.json" -o -name "*.config.*" \) | head -10

# Find test configuration
find . -type f \( -name "jest.config.*" -o -name "vitest.config.*" -o -name "pytest.ini" -o -name "*.test.*" -o -name "*.spec.*" \) | head -10

# Find source files for a feature
find . -type f \( -name "*.ts" -o -name "*.tsx" -o -name "*.js" -o -name "*.jsx" \) | grep -i {feature_name} | head -20
```

## Exploration Template

Use this exact structure for all exploration outputs:

```markdown
## Documentation Findings

List all documentation files found with their purpose:
- `path/to/README.md`: Brief description of what it documents

## Entry Points

| File | Line | Purpose |
|------|------|---------|
| `src/api/routes.ts` | 45 | API endpoint definitions |

## Code Flow

1. **Entry**: `file.ts:line` - Description
2. **Transform**: `file.ts:line` - Description
3. **Output**: `file.ts:line` - Description

## Architecture

- **Pattern**: (e.g., MVC, Clean Architecture)
- **Layers**: List abstraction layers
- **Key Abstractions**: Wrapper libraries used

## Conventions

| Aspect | Project Uses | Avoid | Reference File |
|--------|--------------|-------|----------------|
| Env vars | `t3-env` | `process.env` | `src/env.ts` |

## Test Infrastructure

- **Framework**: (jest, vitest, etc.)
- **Location**: `__tests__/` or `*.test.*`
- **Command**: `npm test`

## Essential Files

List 5-10 files essential for understanding this feature:
1. `src/core/feature.ts` - Core implementation
```

## Pattern Extraction Checklist

When exploring, extract these patterns:

- [ ] **Configuration**: How does the project handle config?
- [ ] **Validation**: What validation library is used?
- [ ] **Error Handling**: Patterns for error handling
- [ ] **Logging**: How is logging implemented?
- [ ] **State Management**: Context, Redux, Zustand, etc.
- [ ] **API Calls**: Fetch, Axios, React Query, etc.
- [ ] **Database**: ORM, raw SQL, patterns
- [ ] **Testing**: Unit, integration, e2e patterns
- [ ] **Imports**: Absolute vs relative, aliases
- [ ] **Types**: TypeScript patterns, strictness

## Output Rules

1. **Be specific**: Always include file:line references
2. **Be concise**: Focus on what's needed for implementation
3. **Use tables**: Structure data in tables when possible
4. **No assumptions**: Only document what you find
5. **Follow template**: Use the exact sections above
