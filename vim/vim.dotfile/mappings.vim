" Create and close tabs
nnoremap <C-t> :tabnew<CR>
nnoremap Q :close<CR>
cabbrev q echoerr "Nope"

" Window navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Remove trailing spaces
nnoremap <silent> <F5> :call StripTrailingWhitespaces()<CR>

" Tab navigation
nmap <Tab> gt
nmap <S-Tab> gT

" Saving file
nmap <C-s> :write<CR>
imap <C-s> <Esc>:write<CR>i<Right>
cabbrev w echoerr "Nope"

" Fugitive
nmap <C-g> :Gstatus<CR>

" ctrlp
let g:ctrlp_map = '<leader>t'

" NERDTree
nmap <silent> <F11> :NERDTreeToggle<CR>

" NERDCommentator
map <Leader>x <plug>NERDCommenterToggle

" ctags
map <Leader>rt :!ctags --extra=+f --exclude=.git --exclude=log -R *<CR><CR>

" snipmate
ino <silent> ö <c-r>=TriggerSnippet()<cr>
snor <silent> ö <esc>i<right><c-r>=TriggerSnippet()<cr>

" CamelCaseMotion
map <silent> w <Plug>CamelCaseMotion_w
map <silent> b <Plug>CamelCaseMotion_b
map <silent> e <Plug>CamelCaseMotion_e
sunmap w
sunmap b
sunmap e
