# Utils from Dropbox
alias avro="java -jar $HOME/Dropbox/utils/avro-tools-1.7.7.jar "$@""
alias http="$HOME/Dropbox/utils/python/bin/http "$@""
for bin in 'csv2sc' 'gh' 'git-wtf' 'heroku' 'jq' 'sbt' 'xflux' 'zeal'; do
  alias $bin="$HOME/Dropbox/bin/$bin "$@""
done

# git
alias git="gh"
if type compdef > /dev/null; then
  compdef gh=git
fi
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

# Amazon
function s3cat { s3cmd get $1 - }
function s3json { s3cat $1 | jq . }

# Inspection
alias p='ps aux'
function pg { p | grep "$@" }
alias pt='pstree -a'
alias netstatc='netstat -ntulp'

# Misc
alias dotup='cd ~/dotfiles/ && gff && ./install.sh'
alias follow='less +F'
alias sum="awk '{ sum += \$1 } END { print sum }' "$@""
function zebra { awk 'NR%2 == 1 { printf("\033[48;5;237m%s\033[0m\n", $0); next}; 1'; }
function csv { sed 's/,/, /g' "$@" | column -s, -t | zebra | less -S }
function csv2 { csv2sc "$@" | sc }
