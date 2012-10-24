# Git
alias g='git status --short'
alias gd='git diff --no-ext-diff'
alias gb='git checkout --track origin -b'
alias gaa='git add . && g'
alias gc='git commit --verbose'
alias gf='git commit --all --amend'
alias gff='git pull --ff-only'
alias gm='git merge --no-ff'
alias gl="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
unalias gs

# cd
alias u='cd ..'
alias uu='cd ../..'
alias uuu='cd ../../..'

# bundle
alias be='bundle exec'

# zsh
alias so='source ~/.zshrc'
