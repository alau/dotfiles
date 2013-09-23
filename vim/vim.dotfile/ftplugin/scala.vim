" snipmate
ino <buffer> <silent> ý <c-r>=TriggerSnippet()<cr>
snor <buffer> <silent> ý <esc>i<right><c-r>=TriggerSnippet()<cr>

" Sort imports
autocmd BufWritePre * :silent! undojoin | silent! SortScalaImports
nnoremap <silent> <F5> :EraseBadWhitespace<CR>:SortScalaImports<CR>
