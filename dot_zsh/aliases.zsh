# git
alias g='git status --short'
git-add-with-status() { git add "$@" && g }
alias ga='git-add-with-status'
alias gd='git diff --no-ext-diff'
alias gdc='gd --cached'
alias gb='git checkout -b'
alias gpush='git push --set-upstream origin `git rev-parse --abbrev-ref HEAD`'
alias gpub='gpush && gh pr create --draft'
alias gaa='git add . && g'
alias gc='git commit --verbose'
alias gca='gc --all'
alias gff='git pull --ff-only'
alias gup='git pull --rebase'
alias grm='git rebase origin/main'
alias gm='git merge --strategy-option=patience --no-ff'
alias gl="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
alias gla="gl --all"
alias gs="git show"
alias gfix='gc --fixup'
alias gsquash='git rebase -i --autosquash'
alias prs='gh dash'

alias main="gco main"
alias git-prune-remote="git remote prune origin"
git-prune-local-branches() { git fetch -p ; git branch -r | awk '{print $1}' | egrep -v -f /dev/fd/0 <(git branch -vv | grep origin) | awk '{print $1}' | xargs git branch -d }
alias git-prune="git-prune-local-branches"
alias gbd='git branch -d'

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

# AWS
function s3cat { s3cmd get $1 - --no-progress }
function s3json { s3cat $1 | jq . }
alias aws-p2='export instanceId=`aws ec2 describe-instances --filters "Name=instance-state-name,Values=stopped,Name=instance-type,Values=p2.xlarge" --query "Reservations[0].Instances[0].InstanceId"` && echo $instanceId'
alias aws-start='aws ec2 start-instances --instance-ids $instanceId && aws ec2 wait instance-running --instance-ids $instanceId && export instanceIp=`aws ec2 describe-instances --filters "Name=instance-id,Values=$instanceId" --query "Reservations[0].Instances[0].PublicDnsName"` && echo $instanceIp'
alias aws-status='aws ec2 describe-instance-status --include-all-instances'
alias aws-ssh='ssh -i ~/.ssh/aws-key-fast-ai.pem -L localhost:8888:localhost:8888 ubuntu@$instanceIp'
alias aws-stop='aws ec2 stop-instances --instance-ids $instanceId'
alias aws-ip='export instanceIp=`aws ec2 describe-instances --filters "Name=instance-id,Values=$instanceId" --query "Reservations[0].Instances[0].PublicIpAddress"` && echo $instanceIp'

# Inspection
alias p='ps aux'
function pg { p | grep "$@" }
alias pt='pstree -a'
alias netstatc='netstat -ntulp'

# Vim
alias v="vim"
function vq { nvim -q <($(fc -nl -1)) +cw }
alias vim="nvim"

# Docker
alias docker=podman

# Kubernetes
alias kx='kubectl ctx'

# Anaconda
function anaconda-deactivate { path=("${(@)path:#$HOME/anaconda*/bin}") }
function anaconda-activate { path=("/home/alau/anaconda2/bin" "/home/alau/anaconda3/bin" $path) }

# node
alias nr='npm run'
alias nu='nvm use'
alias mwa='mocha --watch'

# poetry
alias pr='poetry run'

# Disabled corrections
alias gulp='nocorrect gulp'
alias eslint='nocorrect eslint'

# Misc
alias dotup='chezmoi update --recurse-submodules=false'
alias follow='less +F'
alias top='htop'
alias sum="awk '{ sum += \$1 } END { print sum }' "$@""
alias avro=avro-tools
alias hdmi-sound=pavucontrol
timestamp() { date -d @"$@" }
