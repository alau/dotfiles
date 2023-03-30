call plug#begin('~/.vim/bundle')

function! DoRemote(arg)
  UpdateRemotePlugins
endfunction

" Tools
Plug 'mileszs/ack.vim'
Plug 'tpope/vim-fugitive'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'scrooloose/nerdtree'
Plug 'SirVer/ultisnips'
Plug 'scrooloose/syntastic'
Plug 'godlygeek/tabular'
Plug 'mg979/vim-visual-multi'
Plug 'Lokaltog/vim-easymotion'
Plug 'scrooloose/nerdcommenter'
Plug 'mhinz/vim-startify'

" Utility
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'chaoren/vim-wordmotion'
Plug 'DataWraith/auto_mkdir'
Plug 'christoomey/vim-tmux-navigator'
Plug 'Raimondi/delimitMate'
Plug 'matze/vim-move'
Plug 'ConradIrwin/vim-bracketed-paste'
Plug 'lambdalisue/suda.vim'

" Look and feel
Plug 'tpope/vim-vividchalk'
Plug 'bling/vim-airline'
Plug 'bitc/vim-bad-whitespace'
Plug 'airblade/vim-gitgutter'

" Language support
Plug 'statianzo/vim-jade'
Plug 'digitaltoad/vim-pug'
Plug 'qmx/vim-json'
Plug 'saltstack/salt-vim'
Plug 'lepture/vim-jinja'
Plug 'Keithbsmiley/tmux.vim'
Plug 'hynek/vim-python-pep8-indent'
Plug 'mustache/vim-mustache-handlebars'
Plug 'mxw/vim-jsx'
Plug 'pangloss/vim-javascript'
Plug 'mtscout6/syntastic-local-eslint.vim'
Plug 'wavded/vim-stylus'
Plug 'udalov/kotlin-vim'
Plug 'jvirtanen/vim-hcl'
Plug 'hashivim/vim-terraform'

call plug#end()
