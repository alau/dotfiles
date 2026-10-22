---
name: implement-stack
description: "Implement a ClickUp epic's tickets as stacked PRs, one per ticket."
argument-hint: "<epic-ClickUp-url>"
disable-model-invocation: true
---

You have been given a ClickUp epic. Its subtasks hold a spec, a map, and the tickets that implement the spec.

The goal is every buildable ticket implemented and reviewed as its own PR, **stacked** per repo: each PR targets the branch of the ticket below it, and the bottom PR targets `main`.

The tickets are not a list of steps. They are a **task graph** with blocking relationships between them. This means there is always a **frontier** of tickets which are ready to be grabbed.

Communication to and from subagents should be sparse. Communicate primarily through **context pointers**: to the spec, tickets, map, exploration notes, and previous commits. Don't duplicate information already available via pointers.

**Implementer subagents** should be run in the background where possible for maximum concurrency.

## Reading the epic

Read each subtask's `markdown_description`; the plain `description` drops link URLs, and links carry the blocking edges.

- **Spec**: the subtask named `[Claude Spec] …`.
- **Map**: the subtask named `Wayfinder Map`. Background on why decisions were made, not a ticket.
- **Tickets**: the subtasks whose body starts with `## Parent`.

A ticket's blockers are the task IDs in the links under its `## Blocked by` heading. Key on the IDs: link text drifts from task names. A blocker is **satisfied** once it is `Closed` in ClickUp or its PR has joined a stack in this run, in any repo.

## Stacks

Each repo gets one stack. Its **top** is the branch of the last ticket that joined, or `origin/main` while empty. Tickets join in the order they finish review, not in tracker order.

Branches are named `CU-<ticket-id>-<slug>`, with worktrees at `/home/alau/repos/<repo>/<branch>`.

## Steps

1. Read the epic and build the task graph.

2. **Triage.** Show the user a table of every ticket: build or skip, the reason for a skip, and the target repo. Skip human-driven work, `Placeholder:` and `(nice-to-have)` tickets, and tickets that already have an open PR. Infer the repo from the title, the body, or the files the ticket names. A skipped ticket's dependents can't be built, except when the skipped ticket has an open PR: that PR's branch becomes the top of its repo's stack, and the ticket counts as joined. The step is done when the user confirms the table.

3. (optional) Use an **exploration subagent** to conduct any exploration required by the tickets: relevant codebase files or external documentation. It saves its markdown notes in `/tmp/implement-stack/<epic-id>/`, where every later subagent can read them.

4. For each frontier ticket:
   - run `git fetch` in `/home/alau/repos/<repo>/main`, cloning the repo to that path first if it is missing;
   - `git worktree add -b <branch> /home/alau/repos/<repo>/<branch> <top>`, where `<top>` is the repo's stack top;
   - set the ticket's status to `in progress`;
   - dispatch an **implementer subagent** with pointers to the ticket, spec, map, notes directory, worktree, and its base commit.

   Each implementer subagent:
   - reads and follows the `implement` skill at the newest `~/.claude/plugins/cache/mattpocock/mattpocock-skills/*/skills/engineering/implement/SKILL.md`. It is user-invoked, so the Skill tool can't load it;
   - when `implement` calls `code-review`, reviews since its base commit, judging the spec axis against the ticket's acceptance criteria, with the spec as context only. It fixes every finding in one pass, commits, and stops: one review, one fix pass;
   - reports either ready to join or failed with a reason, then ends its turn.

5. **Join** a ready ticket to its repo's stack. Joins run one at a time per repo, so the top holds still. Message the waiting implementer to:
   - rebase onto the current top;
   - rerun the tests;
   - push;
   - open a draft PR targeting the top's branch (`main` for the bottom), writing the body with the `pr` skill.

   The join is done when the draft PR is open with tests green after the rebase. Then set the ticket's status to `review`, and its branch becomes the new top.

6. A join changes the **frontier**: kick off implementer subagents for newly unblocked tickets (step 4). When an implementer fails, at work or at its join, leave its worktree and branch as they are and its status `in progress`. Mark it and every ticket downstream of it as not built, and carry on with the rest of the graph.

7. Once no implementer is running and the frontier is empty, mark every draft PR ready for review.

8. Report:
   - each repo's stack, bottom to top, with ticket and PR;
   - skipped and not-built tickets, with reasons;
   - the restack recipe below.

   Keep every worktree: each PR has a checkout ready for review feedback.

## Restacking

The user restacks after this run, once a PR's branch changes or merges. Walk up the stack from the changed PR, one PR at a time:

- Lower PR changed: `git rebase --onto <parent-branch> <old-parent-tip> <branch>`, then `git push --force-with-lease`.
- Lower PR merged: retarget the next PR to `main`, then `git rebase --onto origin/main <merged-branch-old-tip> <branch>` and force-push.
