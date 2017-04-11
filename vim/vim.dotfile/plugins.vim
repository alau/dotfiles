call plug#begin('~/.vim/bundle')

function! DoRemote(arg)
  UpdateRemotePlugins
endfunction

" Tools
Plug 'mileszs/ack.vim'
Plug 'tpope/vim-fugitive'
Plug 'gregsexton/gitv'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'scrooloose/nerdtree'
Plug 'SirVer/ultisnips'
Plug 'scrooloose/syntastic'
Plug 'godlygeek/tabular'
Plug 'terryma/vim-multiple-cursors'
Plug 'Lokaltog/vim-easymotion'
Plug 'scrooloose/nerdcommenter'
Plug 'mhinz/vim-startify'

" Utility
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'bkad/CamelCaseMotion'
Plug 'DataWraith/auto_mkdir'
Plug 'haya14busa/incsearch.vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'Raimondi/delimitMate'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'matze/vim-move'
Plug 'maxbrunsfeld/vim-yankstack'
Plug 'ruanyl/vim-fixmyjs'

" Look and feel
Plug 'tpope/vim-vividchalk'
Plug 'bling/vim-airline'
Plug 'bitc/vim-bad-whitespace'
Plug 'airblade/vim-gitgutter'
Plug 'oblitum/rainbow'

" Language support
Plug 'statianzo/vim-jade'
Plug 'digitaltoad/vim-pug'
Plug 'qmx/vim-json'
Plug 'saltstack/salt-vim'
Plug 'lepture/vim-jinja'
Plug 'Keithbsmiley/tmux.vim'
Plug 'hynek/vim-python-pep8-indent'
Plug 'mustache/vim-mustache-handlebars'
Plug 'isRuslan/vim-es6'
Plug 'mxw/vim-jsx'
Plug 'ternjs/tern_for_vim', { 'do': 'npm install', 'for': ['javascript', 'javascript.jsx'] }
Plug 'carlitux/deoplete-ternjs', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'mtscout6/syntastic-local-eslint.vim'
Plug 'wavded/vim-stylus'

call plug#end()
