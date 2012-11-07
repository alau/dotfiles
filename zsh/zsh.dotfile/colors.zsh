# Load color helpers
autoload -U colors && colors

# Better ls-colors
eval `dircolors ~/.zsh/colors/dircolors-solarized/dircolors.ansi-dark`

# Color partial completions
zstyle -e ':completion:*:default' list-colors 'reply=("${PREFIX:+=(#bi)($PREFIX:t)(?)*==34=00}:${(s.:.)LS_COLORS}")';
