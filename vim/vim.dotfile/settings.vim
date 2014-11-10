" Don't create backup/swap files
set nobackup
set nowritebackup
set noswapfile

" Indentation
set shiftwidth=2
set softtabstop=2
set expandtab
set autoindent

" Line numbers
set number

" Incremental searches + highlighting
set incsearch
set hlsearch

" Allow modelines
set modeline

" Ignore case when searching
set smartcase

" Automatically load changed files
set autoread

" Avoid redraw-flashing while doing stuff
set lazyredraw

" Use , as <Leader> and <LocalLeader>
let mapleader=","
let maplocalleader=","

" Colorscheme
set t_Co=256
colorscheme vividchalk

" Remove trailing whitespaces upon write
autocmd BufWritePre * EraseBadWhitespace

" ctrlp
set wildignore=.git,vendor,node_modules
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files']
let g:ctrlp_match_window_bottom = 0

" Change the position of NERDTree
let NERDTreeWinPos = 'right'

" Syntastic
let g:syntastic_check_on_open=1
let g:syntastic_quiet_messages = {'level': 'warnings'}

" Ack
let g:ackprg="ack -H -i --nocolor --nogroup --column --noxml --nocss"

" delimitMate
let delimitMate_expand_space = 1
let delimitMate_expand_cr = 1

" endwise
let g:endwise_no_mappings = 0

" Powerline
set laststatus=2
set encoding=utf-8
let g:Powerline_symbols = 'fancy'

" easymotion
let g:EasyMotion_leader_key = '<Leader>'
let g:EasyMotion_mapping_t = '<Leader><Leader>t'
let g:EasyMotion_mapping_f = 'f'
let g:EasyMotion_mapping_F = 'F'
let g:EasyMotion_keys='hutenosadimkwjvqzbxgpcrlf'

" gitv
let g:Gitv_DoNotMapCtrlKey = 1
let g:Gitv_WipeAllOnClose = 1

" vim-multiple-cursors
let g:multi_cursor_exit_from_visual_mode = 0
let g:multi_cursor_exit_from_insert_mode = 0
highlight multiple_cursors_cursor term=reverse cterm=reverse gui=reverse
highlight link multiple_cursors_visual Visual
