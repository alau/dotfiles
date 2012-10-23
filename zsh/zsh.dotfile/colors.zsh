# Solarized dark color theme
gconftool-2 --set /apps/gnome-terminal/profiles/Default/foreground_color --type string "#708183"
gconftool-2 --set /apps/gnome-terminal/profiles/Default/background_color --type string "#001E26"
gconftool-2 --set /apps/gnome-terminal/profiles/Default/bold_color --type string "#81908F"
gconftool-2 --set /apps/gnome-terminal/profiles/Default/palette --type string "#002731:#D01B24:#728905:#A57705:#2075C7:#C61B6E:#259185:#E9E2CB:#001E26:#BD3612:#465A61:#52676F:#708183:#5856B9:#81908F:#FCF4DC"

# And better ls-colors
eval `dircolors ~/.zsh/colors/dircolors-solarized/dircolors.ansi-dark`

# Color partial completions
zstyle -e ':completion:*:default' list-colors 'reply=("${PREFIX:+=(#bi)($PREFIX:t)(?)*==34=00}:${(s.:.)LS_COLORS}")';
