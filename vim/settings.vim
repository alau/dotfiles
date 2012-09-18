" Don't create backup/swap files
set nobackup
set nowritebackup
set noswapfile

" Indentation
set shiftwidth=2
set softtabstop=2
set expandtab
set autoindent

" Highlight trailing whitespaces
match ErrorMsg /\s\+$/
autocmd BufWinEnter * match ErrorMsg /\s\+$/
autocmd InsertEnter * match ErrorMsg /\s\+\%#\@<!$/
autocmd InsertLeave * match ErrorMsg /\s\+$/
autocmd BufWinLeave * call clearmatches()

" Remove trailing whitespaces upon write
autocmd BufWritePre * :call StripTrailingWhitespaces()

" Ignore case when searching
set ignorecase

" Automatically load changed files
set autoread

" Use , as <Leader> and <LocalLeader>
let mapleader=","
let maplocalleader=","

" Colorscheme
colorscheme vividchalk

" Ignore for ctrlp
set wildignore=.git,vendor

" Change the position of NERDTree
let NERDTreeWinPos = 'right'

" Syntastic
let g:syntastic_check_on_open=1
let g:syntastic_quiet_warnings=1
