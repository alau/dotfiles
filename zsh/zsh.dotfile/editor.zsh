bindkey -M viins "$key_info[Control]R" history-incremental-pattern-search-backward

insert-sudo () { zle beginning-of-line; zle -U "sudo " }
zle -N insert-sudo
bindkey -M viins "$key_info[Control]s" insert-sudo

bindkey "^W" backward-kill-word
bindkey "^U" backward-kill-line

bindkey -M vicmd 'yy' vi-yank-whole-line
