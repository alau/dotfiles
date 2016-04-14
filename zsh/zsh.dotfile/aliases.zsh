# git
if (( $+commands[gh] )); then
  alias git="gh"
  if type compdef > /dev/null; then
    compdef gh=git
  fi
fi
alias g='git status --short'
git-add-with-status() { git add "$@" && g }
alias ga='git-add-with-status'
alias gd='git diff --no-ext-diff'
alias gdc='gd --cached'
alias gb='git checkout -b'
alias gpush='git push --set-upstream origin `git rev-parse --abbrev-ref HEAD`'
alias gpub='gpush && git pull-request'
alias gaa='git add . && g'
alias gc='git commit --verbose'
alias gca='gc --all'
alias gf='gc --all --amend'
alias gff='git pull --ff-only'
alias gup='git pull --rebase'
alias grm='git rebase origin/master'
alias gm='git merge --strategy-option=patience --no-ff'
alias gl="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
alias gla="gl --all"
alias gs="git show"
alias gfix='gc --fixup'
alias gsquash='git rebase -i --autosquash'

alias master="gco master"
alias git-prune="git branch --merged | grep -v 'master$' | grep -v 'production$' | xargs git branch -d"
alias git-prune-remote="git remote prune origin"
git-delete() { git push origin :"$@" }

# Navigation
alias u='cd ..'
alias uu='cd ../..'
alias uuu='cd ../../..'
alias t='tree'
alias l='ls'

# ruby-related
alias be='bundle exec'
alias rt='RAILS_ENV=test rake'
alias cuc='CUCUMBER_FORMAT=pretty be cucumber --drb'

# zsh
alias so='source ~/.zshrc'

# Keyboard
alias qwerty='setxkbmap se -option caps:swapescape'
alias custom='~/.xkb/custom.zsh'
alias keycodes='xkbprint -label name $DISPLAY - | gv -orientation=seascape -'

# Override prezto, don't ask when removing files
alias rm='rm'

# Amazon
function s3cat { s3cmd get $1 - --no-progress }
function s3json { s3cat $1 | jq . }

# Inspection
alias p='ps aux'
function pg { p | grep "$@" }
alias pt='pstree -a'
alias netstatc='netstat -ntulp'

# Vim
if [ -f "$HOME/bin/nvim" ]; then
  alias vim="VIM=$HOME/workspace/neovim/runtime/ nvim"
elif (( $+commands[gvim] )); then
  alias vim="gvim -v"
fi

# Anaconda
function anaconda-deactivate { path=("${(@)path:#$HOME/anaconda*/bin}") }
function anaconda-activate { path=("/home/alau/anaconda2/bin" "/home/alau/anaconda3/bin" $path) }

# Misc
alias dotup='cd ~/dotfiles/ && gff && ./install.sh'
alias follow='less +F'
alias sum="awk '{ sum += \$1 } END { print sum }' "$@""
function zebra { awk 'NR%2 == 1 { printf("\033[48;5;237m%s\033[0m\n", $0); next}; 1'; }
function csv { sed 's/,/, /g' "$@" | column -s, -t | zebra | less -S }
function csv2 { csv2sc "$@" | sc }
alias avro=avro-tools
timestamp() { date -d @"$@" }
