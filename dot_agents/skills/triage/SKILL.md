---
name: triage
description: Use this skill when the user invokes "/triage"
disable-model-invocation: true
allowed-tools: Bash(gh pr view:*), Bash(gh pr diff:*), Bash(gh api:*), mcp__github__pull_request_read, mcp__github__update_pull_request, mcp__github__add_issue_comment, mcp__github__add_reply_to_pull_request_comment
---

## Context

- Current PR: !`gh pr view --json number,title,body,url 2>/dev/null || echo "No PR found for current branch"`
- PR comments: !`gh pr view --json comments,reviews,reviewRequests 2>/dev/null || echo "No PR found"`

## Your task

Use the `mcp__github__pull_request_read` tool to fetch full PR details including inline review comments before triaging.

Review PR comments produced by copilot and alau and triage them according to:

1. **Categorize** each comment as one of:
   - **Must fix**: Blocking issues, bugs, security concerns
   - **Should fix**: Code quality, style, best practices
   - **Consider**: Non-blocking suggestions, nitpicks
   - **Question**: Clarification requests from reviewers
   - **Resolved**: Already addressed
   - **Incorrect**: Based on an incorrect understanding

2. **Summarize** the overall state of the PR review

3. **Plan**: Plan how to resolve the comments. Include in the plan that fixes should be pushed to the PR, the PR description should be updated, and comments should be responded to. The comment should begin with "[claude code]" to indicate the origin of the comment.

Present the triage as a structured list grouped by category.
