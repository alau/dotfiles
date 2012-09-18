" Don't create backup/swap files
set nobackup
set nowritebackup
set noswapfile

" Indentation
set shiftwidth=2
set softtabstop=2
set expandtab
set autoindent

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
