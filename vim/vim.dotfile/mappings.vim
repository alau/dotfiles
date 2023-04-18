" Disable arrow keys
map <Up> <nop>
map <Down> <nop>
map <Left> <nop>
map <Right> <nop>
imap <Up> <nop>
imap <Down> <nop>
imap <Left> <nop>
imap <Right> <nop>

" Pane handling
nnoremap Q :close<CR>

" Window navigation
nnoremap <silent> <C-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <C-j> :TmuxNavigateDown<cr>
nnoremap <silent> <C-k> :TmuxNavigateUp<cr>
nnoremap <silent> <C-l> :TmuxNavigateRight<cr>

" Remove trailing spaces
nnoremap <silent> <F5> :EraseBadWhitespace<CR>

" Quickfix navigation
nmap <s :cprev<CR>
nmap >s :cnext<CR>

" Saving file
nmap <C-s> :write<CR>
imap <C-s> <Esc>:write<CR>a

" Reloading vimrc
map <Leader>so :so ~/.vimrc<CR>

" Fugitive
nmap <C-g> :Git<CR>)
map <Leader>d :Git diff %<CR>
map <Leader>D :Git diff<CR>

" ctrlp
let g:ctrlp_map = '<leader>t'
map <Leader>b :CtrlPBuffer<CR>

" NERDTree
nmap <silent> <F10> :NERDTreeToggle<CR>

" NERDCommentator
map <Leader>x <plug>NERDCommenterToggle

" ctags
map <Leader>rt :!ctags -R *<CR><CR>
map ! <C-]>
map & :pop<CR>

" Json formatting
noremap <Leader>J :% !python -m json.tool<CR>:set ft=json<CR>

" easymotion
nmap L <Plug>(easymotion-j)
nmap H <Plug>(easymotion-k)

" Number toggle
let g:NumberToggleTrigger="<F6>"

" Ultisnips
let g:UltiSnipsExpandTrigger="<F6>"
let g:UltiSnipsJumpForwardTrigger="<F6>"

" yankstack
nmap <C-p> <Plug>yankstack_substitute_older_paste
nmap <C-P> <Plug>yankstack_substitute_newer_paste

