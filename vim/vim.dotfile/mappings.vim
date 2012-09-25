" Create and close tabs
nnoremap <C-t> :tabnew<CR>
nnoremap Q :tabclose<CR>

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
nmap <C-s> :w<CR>

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
