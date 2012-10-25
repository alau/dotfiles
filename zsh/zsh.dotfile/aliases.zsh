# git
alias g='git status --short'
alias gd='git diff --no-ext-diff'
alias gb='git checkout -b'
alias gaa='git add . && g'
alias gc='git commit --verbose'
alias gca='gc --all'
alias gf='gc --all --amend'
alias gff='git pull --ff-only'
alias grm='git rebase origin/master'
alias gm='git merge --no-ff'
alias gl="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
alias git-prune="git branch --merged | grep -v 'master$' | grep -v 'production$' | xargs git branch -d"
alias git-prune-remote="git remote prune origin"
unalias gs

# cd
alias u='cd ..'
alias uu='cd ../..'
alias uuu='cd ../../..'

# bundle
alias be='bundle exec'

# rails
alias rt='RAILS_ENV=test rake'
alias cuc='CUCUMBER_FORMAT=pretty be cucumber --drb'

# zsh
alias so='source ~/.zshrc'
