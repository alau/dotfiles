if exists("did_load_filetypes")
  finish
endif

" Add additional rules for file types
augroup filetypedetect
  au! BufRead,BufNewFile *.zsh-theme setfiletype zsh
augroup END
