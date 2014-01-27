# git
alias git="hub"
alias g='git status --short'
git-add-with-status() { git add "$@" && g }
alias ga='git-add-with-status'
alias gd='git diff --no-ext-diff'
alias gdc='gd --cached'
alias gb='git checkout -b'
alias gpub='git push --set-upstream origin `git rev-parse --abbrev-ref HEAD` && git pull-request'
alias gaa='git add . && g'
alias gc='git commit --verbose'
alias gca='gc --all'
alias gf='gc --all --amend'
alias gff='git pull --ff-only'
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

# bundle
alias be='bundle exec'

# rails
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

# npm
alias node-dev='node_modules/node-dev/node-dev'

# Amazon
function s3cat { s3cmd get $1 - }
function s3json { s3cat $1 | $HOME/Dropbox/utils/jq . }

# Inspection
alias p='ps aux'
function pg { p | grep "$@" }
alias pt='pstree -a'
alias top='htop'
alias netstatc='netstat -ntulp'

# Salt
alias sync='sudo salt-call deploy.sync'
function activate { sudo salt-call deploy.activate "$@" }

# Misc
alias dotup='cd ~/dotfiles/ && gff && ./install.sh'
alias follow='less +F'
alias avro="java -jar $HOME/Dropbox/utils/avro-tools-1.7.3.jar "$@""
alias http="$HOME/Dropbox/utils/python/bin/http "$@""
alias staging="MAGINE_ENV=staging sbt"
function zebra { awk 'NR%2 == 1 { printf("\033[48;5;237m%s\033[0m\n", $0); next}; 1'; }
function csv { sed 's/,/, /g' "$@" | column -s, -t | zebra | less -S }
function csv2 { csv2sc "$@" | sc }
