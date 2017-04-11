set tabstop=8 expandtab shiftwidth=2 softtabstop=2

" tern
let g:deoplete#omni#functions.javascript = [
  \ 'tern#Complete',
  \ 'jspc#omni'
\]
nnoremap <silent> <buffer> ! :TernDef<CR>
