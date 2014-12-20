" Sort imports
autocmd BufWritePre * :silent! undojoin | silent! SortScalaImports
nnoremap <silent> <F5> :EraseBadWhitespace<CR>:SortScalaImports<CR>
