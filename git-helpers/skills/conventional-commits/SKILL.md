---
name: conventional-commits
description: Guidelines for writing conventional commit messages with proper types, formatting, and best practices
---

# Conventional Commits

Guidelines for writing consistent, meaningful commit messages.

## Commit Types

| Type       | Use when                                     |
| ---------- | -------------------------------------------- |
| `feat`     | Adding new functionality                     |
| `fix`      | Fixing a bug                                 |
| `refactor` | Restructuring code without changing behavior |
| `chore`    | Maintenance tasks, dependencies, configs     |
| `docs`     | Documentation changes                        |
| `test`     | Adding or updating tests                     |
| `style`    | Code style changes (formatting, semicolons)  |
| `perf`     | Performance improvements                     |
| `ci`       | CI/CD configuration changes                  |
| `build`    | Build system or external dependencies        |

## Message Format

```
type: concise description in imperative mood

- Optional: key change 1
- Optional: key change 2
```

## Rules

1. **Use imperative mood**: "add", "fix", "implement" (not "added", "fixes")
2. **Be concise**: First line under 72 characters
3. **Focus on WHAT**: Describe the change, not the implementation
4. **No scope in type**: Use `feat:` not `feat(scope):`
5. **No file names**: Don't mention specific files in the message
6. **No versions**: Don't mention package versions
7. **No attribution**: Never add Co-Authored-By or similar lines

## Body Guidelines

Include a body only when:

- Change spans 3+ functional areas
- Complex change needs explanation
- Breaking change needs documentation

Keep body to 3-4 concise list items.

## Examples

**Good:**

```
feat: add user authentication flow

- Support email/password login
- Add session management
- Include remember me option
```

**Bad:**

```
feat(auth): Added authentication to src/auth.ts

Updated lodash to 4.17.21 for security.
Co-Authored-By: AI Assistant
```
