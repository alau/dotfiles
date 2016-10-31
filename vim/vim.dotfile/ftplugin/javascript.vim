set tabstop=8 expandtab shiftwidth=2 softtabstop=2

" tern
setlocal omnifunc=ternComplete
nnoremap <silent> <buffer> ! :TernDef<CR>

autocmd BufEnter * if expand("%:p:h") !~ '^/tmp' | silent! lcd %:p:h | endif
