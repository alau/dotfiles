filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'

" Tools
Bundle 'tpope/vim-fugitive'
Bundle 'kien/ctrlp.vim'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/nerdcommenter'
Bundle 'tpope/vim-endwise'
Bundle 'scrooloose/syntastic'
Bundle 'mileszs/ack.vim'
Bundle 'alau/snipmate.vim'
Bundle 'tpope/vim-rails'
Bundle 'bkad/CamelCaseMotion'
Bundle 'Raimondi/delimitMate'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'godlygeek/tabular'
Bundle 'vim-scripts/ZoomWin'
Bundle 'DataWraith/auto_mkdir'

" Look and feel
Bundle 'tpope/vim-vividchalk'
Bundle 'Lokaltog/vim-powerline'

" Language support
Bundle 'itspriddle/vim-jquery'
Bundle 'AndrewRadev/vim-coffee-script'
Bundle 'vim-ruby/vim-ruby'
Bundle 'puppetlabs/puppet-syntax-vim'
Bundle 'statianzo/vim-jade'
Bundle 'qmx/vim-json'

filetype plugin indent on
