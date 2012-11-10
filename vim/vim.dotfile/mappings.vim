" Create and close tabs
nnoremap <C-t> :tabnew<CR>
nnoremap Q :close<CR>

" Disable arrow keys
map <Up> <nop>
map <Down> <nop>
map <Left> <nop>
map <Right> <nop>
imap <Up> <nop>
imap <Down> <nop>
imap <Left> <nop>
imap <Right> <nop>

" Window navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Remove trailing spaces
nnoremap <silent> <F5> :call StripTrailingWhitespaces()<CR>

" Tab navigation
map <C-PageUp> <nop>
map <C-PageDown> <nop>
map <A-&> 1gt
map <A-[> 2gt
map <A-{> 3gt
map <A-=> 4gt
map <A-(> 5gt
map <A-}> 6gt
map <A-*> 7gt
map <A-)> 8gt
map <A-+> 9gt
map <A-]> 0gt

" Tags
nmap - <C-]>

" Quickfix navigation
nmap <C-@> :cprev<CR>
nmap <C-\> :cnext<CR>

" Saving file
nmap <C-s> :write<CR>
imap <C-s> <Esc>:write<CR>a

" Editing
imap <C-l> <Esc>o

" Reloading vimrc
map <Leader>so :so ~/.vimrc<CR>

" Fugitive
nmap <C-g> :Gstatus<CR><C-W>_<C-n>

" ctrlp
let g:ctrlp_map = '<leader>t'

" NERDTree
nmap <silent> <F11> :NERDTreeToggle<CR>

" NERDCommentator
map <Leader>x <plug>NERDCommenterToggle

" ctags
map <Leader>rt :!ctags --extra=+f --exclude=.git --exclude=tmp --exclude=log -R *<CR><CR>

" CamelCaseMotion
map <silent> w <Plug>CamelCaseMotion_w
map <silent> b <Plug>CamelCaseMotion_b
map <silent> e <Plug>CamelCaseMotion_e
sunmap w
sunmap b
sunmap e
" Fix cw, which otherwise eats linebreaks
nmap cw ce

" delimitMate
imap <S-Tab> <C-g>g
