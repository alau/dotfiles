---
name: wayfinder
description: "Wayfinder on a ClickUp epic: the map and its decision tickets as subtasks, laid out for to-spec, to-tickets and implement-stack."
argument-hint: "<epic-or-map-ClickUp-url>"
disable-model-invocation: true
---

Read and follow the upstream `wayfinder` skill at the newest `~/.claude/plugins/cache/mattpocock/mattpocock-skills/*/skills/engineering/wayfinder/SKILL.md`. It is user-invoked, so the Skill tool can't load it. The tracker is ClickUp, and everything below overrides upstream where they differ.

## Epic layout

```
<epic>                         ← the user's; read-only
├── [Claude Spec] …            ← written later by to-spec
├── Wayfinder Map              ← the map
│   └── <decision tickets>
└── <implementation tickets>   ← to-tickets, then implement-stack
```

The epic description belongs to the user. Chart from it: the Destination from its User stories and Scope, **Out of scope** from its "Out of scope:" part, and tickets or fog from its numbered Questions (struck-through ones are already answered).

Modify only tasks under the epic you were given. The epic may be a copy on the user's Personal List whose links still lead to the Main originals; read those, write only here.

## The map

A subtask of the epic named exactly `Wayfinder Map`; its body is the task description. Given an epic URL, find it among the epic's subtasks, or create it with `create_subtask` when charting.

- **Destination** also says where the spec goes, so a fresh `to-spec` session finds it: "a `[Claude Spec] <epic title minus [Analysis]>` subtask of the epic, sibling to this map, headed `**Map:** [Wayfinder Map](url) · **Story:** [epic](url)`."
- **Notes** carry only what is specific to this effort: the list's in-progress and closed status names, domain pointers (`CONTEXT.md`, `docs/adr/`, repos), skills to consult, and what was settled while charting. Status names vary per list (`doing`/`Closed` on Main, `done` on Tech backlog), so look them up while charting.

Tags simply inherit from the parent: the `wayfinder:` labels upstream describes have no ClickUp form here, and nothing else is tagged.

## Tickets

Subtasks of the map, titled as the question they resolve, with no ticket numbers. The body carries what upstream puts in labels and native blocking:

```markdown
**Type:** <research | prototype | grilling | task> (<AFK | HITL>)
**Revisits:** [<closed ticket title>](url)

## Question

<the decision or investigation this ticket resolves>

## Blocked by

None | - [<ticket title>](url)
```

`**Revisits:**` appears only on a ticket that reopens a closed decision. A ticket is **unblocked** when every task linked under its `## Blocked by` is closed; key on the task IDs in the links, since link text drifts.

**Claim**: re-fetch the ticket, skip it if it has an assignee, assign the user (`get_current_user`), then re-fetch to confirm they are the only assignee.

**Resolve**: post a `## Resolution` comment, set the closed status, and add `- [title](url): gist` under the map's Decisions so far. Later comments use these markers:

- `**Addendum:** …` on a closed ticket whose answer has changed in detail.
- `**Superseded** by [title](url)` on a closed ticket whose decision a newer ticket replaced.
- `**Input from** [title](url): …` on an open ticket that a resolution feeds.

## Research tickets

When charting, claim every research ticket up front, then dispatch one background subagent per ticket with `isolation: worktree`. Each subagent:

- works on branch `CU-<epic-id>-research-<slug>` in `/home/alau/repos/<repo>/CU-<epic-id>-research-<slug>`, where `<repo>` is the repo the question concerns;
- writes its findings to `docs/research/<slug>.md`, commits, and pushes the branch, opening no PR;
- posts the resolution comment ending in a pointer to the branch and file, closes the ticket, and reports a one-line gist.

Then add every gist to Decisions so far in one map edit.

## Reaching the destination

The session that closes the last ticket, with no fog left, sets the map to the closed status, tells the user the way is clear, suggests `/to-spec <map-url>`, and stops.

A decision that changes after the map is closed reopens it: set it back to the in-progress status, add a ticket with a `**Revisits:**` line, and resolve it. Then edit the `[Claude Spec]` in place, name the implementation tickets the change touches, and close the map again. Work discovered during implementation becomes an epic ticket, outside the map.

## ClickUp operations

- **Map edits**: `update_task` replaces the whole description and other sessions edit concurrently, so re-read the map right before every edit and re-fetch afterwards to verify (`update_task` returns `markdown_description: null`).
- **Reading**: read `markdown_description`; the plain `description` drops link URLs, and links carry the blocking edges. `get_task` on a map, epic or spec often overflows into a saved file: extract `markdown_description` from it with `jq`.
- **Bodies**: plain markdown sections. ClickUp merges HTML comments into the adjacent heading, so leave out the upstream template's comments.
- **Limits**: the MCP can't rename, re-parent, tag or set dependencies. When one of these is needed, ask the user to do it.
