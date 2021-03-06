" Don't create backup/swap files
set nobackup
set nowritebackup
set noswapfile

" Indentation
set shiftwidth=2
set softtabstop=2
set expandtab

" Line numbers
set number

" Allow modelines
set modeline

" Ignore case when searching
set ignorecase
set smartcase

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

" Use system clipboard by default
set clipboard=unnamedplus,unnamed

" ctrlp
set wildignore=.git,vendor,node_modules
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files']
let g:ctrlp_match_window = 'top,order:btt,results:10'
highlight CtrlPBufferNr guibg=Black guifg=White
highlight CtrlPBufferInd guibg=Black guifg=White
highlight CtrlPBufferPath guibg=Black guifg=White
highlight CtrlPBufferVis guibg=Black guifg=White
highlight CtrlPBufferHid guibg=Black guifg=White
highlight CtrlPBufferCur guibg=Black guifg=White

" Change the position of NERDTree
let NERDTreeWinPos = 'right'

" Syntastic
let g:syntastic_check_on_open = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_enable_balloons = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_enable_signs = 1
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_javascript_eslint_exec = 'eslint_d'
let g:syntastic_python_checkers = ['flake8']

highlight link SyntasticErrorSign SignColumn
highlight link SyntasticWarningSign SignColumn
highlight link SyntasticStyleErrorSign SignColumn
highlight link SyntasticStyleWarningSign SignColumn

" Ack
let g:ackprg="ack -H -i --nocolor --nogroup --column --noxml --nocss"

" delimitMate
let delimitMate_expand_space = 1
let delimitMate_expand_cr = 1
let delimitMate_excluded_ft = "txt"

" endwise
let g:endwise_no_mappings = 0

" airline
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_left_sep = '⮀'
let g:airline_left_alt_sep = '⮁'
let g:airline_right_sep = '⮂'
let g:airline_right_alt_sep = '⮃'
let g:airline_symbols.branch = '⭠'
let g:airline_symbols.readonly = '⭤'
let g:airline_symbols.linenr = '⭡'
let g:airline#extensions#branch#format = 2

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

" UltiSnips
let g:UltiSnipsExpandTrigger = '<F9>'
let g:UltiSnipsJumpForwardTrigger = '<F9>'
let g:UltiSnipsEditSplit = 'horizontal'
let g:UltiSnipsSnippetsDir = '~/.vim/UltiSnips'

" gitgutter
highlight SignColumn guibg=Black
highlight link GitGutterAdd DiffAdded
highlight link GitGutterDelete DiffRemoved
highlight link GitGutterChange DiffChanged

" vim-mustache-handlebars
let g:mustache_abbreviations = 1
let g:mustache_operators = 0

" tmux-navigator
let g:tmux_navigator_no_mappings = 1

" rainbow brackets
au FileType clojure call rainbow#load()

" deoplete
let g:deoplete#enable_at_startup = 1
let g:deoplete#omni#functions = {}
set completeopt=longest,menuone,preview
let g:deoplete#sources = {}
let g:deoplete#sources['javascript.jsx'] = ['file', 'ultisnips']

" yankstack
let g:yankstack_map_keys = 0

" fixmyjs
let g:fixmyjs_engine = 'eslint'
let g:fixmyjs_use_local = 1

" folding
set foldmethod=syntax
let javaScript_fold=1
set foldlevelstart=99

