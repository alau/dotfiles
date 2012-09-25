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
Bundle 'akitaonrails/snipmate.vim'

" Look and feel
Bundle 'tpope/vim-vividchalk'
Bundle 'Lokaltog/vim-powerline'

" Language support
Bundle 'itspriddle/vim-jquery'
Bundle 'kchmck/vim-coffee-script'
Bundle 'vim-ruby/vim-ruby'
Bundle 'puppetlabs/puppet-syntax-vim'

filetype plugin indent on
