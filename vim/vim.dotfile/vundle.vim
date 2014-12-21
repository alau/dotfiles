filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'

" Tools
Bundle 'mileszs/ack.vim'
Bundle 'tpope/vim-fugitive'
Bundle 'gregsexton/gitv'
Bundle 'kien/ctrlp.vim'
Bundle 'scrooloose/nerdtree'
Bundle 'SirVer/ultisnips'
Bundle 'scrooloose/syntastic'
Bundle 'godlygeek/tabular'
Bundle 'terryma/vim-multiple-cursors'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'scrooloose/nerdcommenter'
Bundle 'Valloric/YouCompleteMe'

" Utility
Bundle 'tpope/vim-sensible'
Bundle 'tpope/vim-endwise'
Bundle 'bkad/CamelCaseMotion'
Bundle 'DataWraith/auto_mkdir'
Bundle 'jeffkreeftmeijer/vim-numbertoggle'

" Look and feel
Bundle 'tpope/vim-vividchalk'
Bundle 'Lokaltog/vim-powerline'
Bundle 'bitc/vim-bad-whitespace'
Bundle 'airblade/vim-gitgutter'

" Language support
Bundle 'itspriddle/vim-jquery'
Bundle 'AndrewRadev/vim-coffee-script'
Bundle 'vim-ruby/vim-ruby'
Bundle 'tpope/vim-rails'
Bundle 'puppetlabs/puppet-syntax-vim'
Bundle 'statianzo/vim-jade'
Bundle 'qmx/vim-json'
Bundle 'derekwyatt/vim-scala'
Bundle 'saltstack/salt-vim'
Bundle 'lepture/vim-jinja'
Bundle 'slim-template/vim-slim'

filetype plugin indent on
