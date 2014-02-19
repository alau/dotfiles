bindkey -M viins "$key_info[Control]R" history-incremental-pattern-search-backward

insert_sudo () { zle beginning-of-line; zle -U "sudo " }
bindkey -M viins "$key_info[Control]s" insert-sudo
