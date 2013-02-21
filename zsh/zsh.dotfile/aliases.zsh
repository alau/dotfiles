# git
alias g='git status --short'
git-add-with-status() { git add "$@" && g }
alias ga='git-add-with-status'
alias gd='git diff --no-ext-diff'
alias gdc='gd --cached'
alias gb='git checkout -b'
alias gaa='git add . && g'
alias gc='git commit --verbose'
alias gca='gc --all'
alias gf='gc --all --amend'
alias gff='git pull --ff-only'
alias grm='git rebase origin/master'
alias gm='git merge --no-ff'
alias gl="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
alias gla="gl --all"
alias gs="git show"

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

# keyboard
alias qwerty='setxkbmap se'
alias custom='~/.xkb/custom.zsh'

# Override prezto, don't ask when removing files
alias rm='rm'

# npm
alias node-dev='node_modules/node-dev/node-dev'

# misc
alias dotup='cd ~/dotfiles/ && gff && ./install.sh'
alias follow='less +F'
alias p='ps aux'
alias top='htop'
alias avro="java -jar $HOME/Dropbox/utils/avro-tools-1.7.3.jar "$@""
