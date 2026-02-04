---
name: research-cache
description: Caching strategies for research findings with TTL and automatic invalidation
---

# Research Cache Guidelines

How to cache and reuse research findings across features.

## Cache File Structure

Research files must include YAML frontmatter with metadata:

```markdown
---
topic: totp-authentication
researched_at: 2024-01-15
version: "1.0.0"
sources_hash: "abc123def456"
ttl_days: 90
keywords:
  - totp
  - 2fa
  - authentication
---

# TOTP Authentication

> Researched: 2024-01-15

## Summary
...
```

## Metadata Fields

| Field | Required | Description |
|-------|----------|-------------|
| `topic` | Yes | Kebab-case topic name (matches filename) |
| `researched_at` | Yes | ISO 8601 date (YYYY-MM-DD) |
| `version` | No | Version of the technology researched |
| `sources_hash` | No | Hash of source URLs (for change detection) |
| `ttl_days` | Yes | Cache TTL in days (default: 90) |
| `keywords` | No | Array of related keywords for search |

## Cache Check Process

Before researching, check for existing cache:

```bash
# 1. Check if file exists
if [ -f "docs/research/{topic}.md" ]; then
  # 2. Extract metadata
  researched_at=$(grep "researched_at:" docs/research/{topic}.md | head -1 | cut -d: -f2 | tr -d ' ')
  ttl_days=$(grep "ttl_days:" docs/research/{topic}.md | head -1 | cut -d: -f2 | tr -d ' ')
  
  # 3. Calculate age
  days_since=$(echo $(($(date +%s) - $(date -d "$researched_at" +%s))) / 86400 | bc)
  
  # 4. Check if still valid
  if [ "$days_since" -lt "$ttl_days" ]; then
    # Cache is valid, reuse it
    echo "Using cached research from $researched_at"
  else
    # Cache expired, needs refresh
    echo "Research cache expired, updating..."
  fi
fi
```

## Automatic Invalidation

Cache is automatically invalidated when:

1. **TTL expired**: `days_since > ttl_days`
2. **Source 404**: Main documentation URL returns 404
3. **Version mismatch**: Spec mentions different version than cached
4. **Breaking changes**: Changelog indicates breaking changes since research date

## Cache Reuse Strategy

### Exact Match
Topic in spec matches cached topic exactly:
- Reuse cache if valid

### Partial Match
Topic is related to cached topic:
- Check keywords overlap
- Review cache content for relevance
- Extend cache if applicable

### No Match
No relevant cache exists:
- Conduct new research
- Save with proper metadata

## Research File Template

```markdown
---
topic: {kebab-case-topic}
researched_at: {YYYY-MM-DD}
version: "{x.y.z}"
sources_hash: "{hash}"
ttl_days: 90
keywords:
  - {keyword1}
  - {keyword2}
---

# {Topic Title}

> Researched: {YYYY-MM-DD}

## Summary

{2-3 sentences of key findings}

## Key Information

- {bullet points}

## Implementation Notes

- {specific guidance}

## Gotchas

- {warnings}

## Recommendations

{specific suggestions}

## Uncertainties

{topics needing verification}

## Sources

- [{title}]({url})
```

## Rules

1. **Always check cache first**: Before webfetch, check docs/research/
2. **Include metadata**: Every research file must have YAML frontmatter
3. **Respect TTL**: Don't use expired cache without verification
4. **Version matters**: If spec mentions version, verify cache matches
5. **Update, don't duplicate**: Refresh existing files instead of creating new ones
