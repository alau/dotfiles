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

" Up/down movement for long lines
nmap j gj
nmap k gk

" Window navigation
nnoremap <silent> <C-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <C-j> :TmuxNavigateDown<cr>
nnoremap <silent> <C-k> :TmuxNavigateUp<cr>
nnoremap <silent> <C-l> :TmuxNavigateRight<cr>

" Remove trailing spaces
nnoremap <silent> <F5> :EraseBadWhitespace<CR>

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

" Reloading vimrc
map <Leader>so :so ~/.vimrc<CR>

" Fugitive
nmap <C-g> :Gstatus<CR><C-W>_<C-n>

" Gitv
map <Leader>v :Gitv<CR>
map <Leader>c :Gitv!<CR>
map <Leader>d :call Gitv_OpenGitCommand("diff --no-color " . expand("%:p"), 'new')<CR>
map <Leader>D :call Gitv_OpenGitCommand("diff --no-color", 'new')<CR><C-W>_

" ctrlp
let g:ctrlp_map = '<leader>t'

" NERDTree
nmap <silent> <F10> :NERDTreeToggle<CR>

" NERDCommentator
map <Leader>x <plug>NERDCommenterToggle

" ctags
map <Leader>rt :!ctags -R *<CR><CR>
map ! <C-]>
map & :pop<CR>

" CamelCaseMotion
map <silent> w <Plug>CamelCaseMotion_w
map <silent> b <Plug>CamelCaseMotion_b
map <silent> e <Plug>CamelCaseMotion_e
sunmap w
sunmap b
sunmap e
" Fix cw, which otherwise eats linebreaks
nmap cw ce

" Json formatting
noremap <Leader>J :% !python -m json.tool<CR>:set ft=json<CR>

" easymotion
nmap H <Plug>(easymotion-j)
nmap L <Plug>(easymotion-k)

" incsearch
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

" Number toggle
let g:NumberToggleTrigger="<F6>"

