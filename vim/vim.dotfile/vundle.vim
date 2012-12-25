filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'

" Tools
Bundle 'mileszs/ack.vim'
Bundle 'tpope/vim-fugitive'
Bundle 'kien/ctrlp.vim'
Bundle 'scrooloose/nerdtree'
Bundle 'alau/snipmate.vim'
Bundle 'scrooloose/syntastic'
Bundle 'godlygeek/tabular'
Bundle 'vim-scripts/ZoomWin'

" Utility
Bundle 'scrooloose/nerdcommenter'
Bundle 'tpope/vim-endwise'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'bkad/CamelCaseMotion'
Bundle 'Raimondi/delimitMate'
Bundle 'DataWraith/auto_mkdir'

" Look and feel
Bundle 'tpope/vim-vividchalk'
Bundle 'Lokaltog/vim-powerline'
Bundle 'bitc/vim-bad-whitespace'

" Language support
Bundle 'itspriddle/vim-jquery'
Bundle 'AndrewRadev/vim-coffee-script'
Bundle 'vim-ruby/vim-ruby'
Bundle 'tpope/vim-rails'
Bundle 'puppetlabs/puppet-syntax-vim'
Bundle 'statianzo/vim-jade'
Bundle 'qmx/vim-json'
Bundle 'derekwyatt/vim-scala'

filetype plugin indent on
