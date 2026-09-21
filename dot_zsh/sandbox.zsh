# Launch Claude Code inside a sandbox VM instead of on the host.
#
# Two entry points: `wtc` creates a worktree and starts Claude in it, `ccs`
# starts Claude in the current directory. Both boot a VM if one isn't already
# running for the right workspace.
#
# The workspace is what gets mounted into the guest, and it's mounted at its own
# absolute host path (/workspace is only a symlink to it), so paths need no
# translation on the way in. Granularity matters: git worktrees hold absolute
# gitdir pointers, so the mount has to cover the parent holding .bare and the
# worktrees, not an individual worktree.

# Only define anything if sandbox is available, the way wt.zsh:7 guards itself.
# Without this, `ccs` on a machine with no sandbox shadows nothing but fails
# deep inside a VM-boot path instead of simply not existing.
command -v sandbox >/dev/null 2>&1 || return 0

: ${SANDBOX_WORKSPACE:=$HOME/repos}
: ${SANDBOX_BOOT_TIMEOUT:=300}

# Print the pid of a running VM whose workspace is exactly $1, or nothing.
# `sandbox list` has no --json; rows are "PID RUNNING PORT BACKEND WORKSPACE"
# with the workspace last. Take it with substr() off the untouched record rather
# than by blanking fields: rebuilding $0 re-joins on OFS, which collapses runs
# of spaces and would make a workspace path containing spaces never match (so
# every call would boot a duplicate VM). The numeric-pid test skips the header
# and the Images section below it.
_sandbox_vm_for() {
    sandbox list 2>/dev/null | awk -v ws="$1" '
        match($0, /^[ \t]*[0-9]+([ \t]+[^ \t]+){3}[ \t]+/) {
            if (substr($0, RSTART + RLENGTH) == ws) { print $1; exit }
        }'
}

# Boot a VM for workspace $1 and print its pid.
#
# --background (not SANDBOX_BACKGROUND=1) is deliberate: the env-var path skips
# the credential re-sync, so a rotated OAuth token would surface as a /login
# prompt inside the guest with no obvious cause. --background also detaches into
# its own process group, so closing the terminal can't take the VM with it. It
# prints the pid only in a human banner, hence polling `sandbox list`.
_sandbox_start() {
    local ws="$1" pid waited=0
    print -u2 "sandbox: starting VM for $ws ..."
    sandbox --workspace "$ws" --background >&2 || return 1
    while (( waited < SANDBOX_BOOT_TIMEOUT )); do
        pid="$(_sandbox_vm_for "$ws")"
        [[ -n "$pid" ]] && { print -r -- "$pid"; return 0 }
        sleep 1
        (( ++waited ))
    done
    print -u2 "sandbox: VM for $ws did not appear in 'sandbox list' after ${SANDBOX_BOOT_TIMEOUT}s"
    return 1
}

# A long-lived VM over a multi-repo workspace accumulates 9p directory-handle
# fds and can wedge at FD_SETSIZE; `sandbox status` warns at 800 fds / 24h. Free
# to surface, and better seen early than as a hang.
_sandbox_warn() {
    if command -v jq >/dev/null 2>&1; then
        sandbox status "$1" --json 2>/dev/null \
            | jq -r '.warnings[]? | "sandbox: \(.)"' >&2
    else
        # Say so rather than dropping warnings silently — the thing they warn
        # about (fd exhaustion) surfaces otherwise as an unexplained hang.
        print -u2 "sandbox: jq not found, skipping warnings — see 'sandbox status $1'"
    fi
}

# _sandbox_claude <dir> [claude args...]
_sandbox_claude() {
    if (( $# == 0 )); then
        print -u2 "usage: _sandbox_claude <dir> [claude args...]"
        return 2
    fi
    local dir="${1:A}"; shift
    # Resolve the shared workspace once: every started/reaped comparison below
    # has to agree with the one that chose $ws, even if SANDBOX_WORKSPACE is
    # reassigned mid-session.
    local shared="${SANDBOX_WORKSPACE:A}"
    local ws pid started=0

    # "$shared" itself counts as inside, not just paths beneath it — otherwise
    # `ccs` run from ~/repos takes the ad-hoc branch and is only saved from
    # tearing down the shared VM by the two paths happening to be equal.
    if [[ "$dir" == "$shared" || "$dir" == "$shared"/* ]]; then
        ws="$shared"
    else
        # Outside the shared workspace: mount this directory's git root, so
        # Claude can still see sibling files it will reach for. Such a VM is
        # ad-hoc and gets torn down on exit, unlike the shared one.
        ws="$(git -C "$dir" rev-parse --show-toplevel 2>/dev/null)" || ws=""
        [[ -n "$ws" ]] || ws="$dir"
    fi

    pid="$(_sandbox_vm_for "$ws")"
    if [[ -z "$pid" ]]; then
        pid="$(_sandbox_start "$ws")" || return 1
        started=1
    fi

    _sandbox_warn "$pid"

    # --no-tmux is implied by `--`, but stated so the intent survives a future
    # change to that default. sandbox-shell.sh printf %q's these itself, so the
    # arguments need no quoting here.
    sandbox shell "$pid" --no-tmux --cwd "$dir" \
        -- claude --dangerously-skip-permissions "$@"
    local ret=$?

    # Only reap what this invocation created, and never the shared VM — other
    # Claude sessions live in it.
    if (( started )) && [[ "$ws" != "$shared" ]]; then
        print -u2 "sandbox: stopping ad-hoc VM $pid ($ws)"
        sandbox kill "$pid" >/dev/null 2>&1
    fi
    return $ret
}

# Create a worktree, then start Claude in it inside the sandbox.
#
# wt's shell wrapper cds into the new worktree and *then* sources the --execute
# payload, so $PWD in that payload is the worktree. Arguments here go to wt
# (branch name and friends), not to claude.
wtc() {
    wt switch --create --execute='_sandbox_claude "$PWD"' "$@"
}

# Start Claude in the current directory inside the sandbox.
ccs() {
    _sandbox_claude "$PWD" "$@"
}
