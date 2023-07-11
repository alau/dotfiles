if exists("did_load_filetypes")
  finish
endif

" Add additional rules for file types
augroup filetypedetect
  au! BufRead,BufNewFile *.zsh-theme setfiletype zsh
  au! BufRead,BufNewFile *.avpr setfiletype json
  au! BufRead,BufNewFile *.template setfiletype json
  au! BufRead,BufNewFile *.aurora setfiletype python
augroup END
