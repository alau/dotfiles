vim.cmd('packadd minpac')

vim.call('minpac#init')
local add = vim.fn['minpac#add']

-- Tools
add('k-takata/minpac', {type = 'opt'})
add('mileszs/ack.vim')
add('tpope/vim-fugitive')
add('ctrlpvim/ctrlp.vim')
add('scrooloose/nerdtree')
add('SirVer/ultisnips')
add('dense-analysis/ale')
add('godlygeek/tabular')
add('mg979/vim-visual-multi')
add('Lokaltog/vim-easymotion')
add('scrooloose/nerdcommenter')
add('mhinz/vim-startify')

-- cmp
add('neovim/nvim-lspconfig')
add('hrsh7th/cmp-nvim-lsp')
add('hrsh7th/cmp-buffer')
add('hrsh7th/cmp-path')
add('hrsh7th/cmp-cmdline')
add('hrsh7th/nvim-cmp')
add('quangnguyen30192/cmp-nvim-ultisnips')

-- Utility
add('tpope/vim-sensible')
add('tpope/vim-surround')
add('chaoren/vim-wordmotion')
add('DataWraith/auto_mkdir')
add('christoomey/vim-tmux-navigator')
add('matze/vim-move')
add('ConradIrwin/vim-bracketed-paste')
add('lambdalisue/suda.vim')
add('simrat39/symbols-outline.nvim')

-- Look and feel
add('tpope/vim-vividchalk')
add('bling/vim-airline')
add('bitc/vim-bad-whitespace')
add('airblade/vim-gitgutter')

-- Language support
add('statianzo/vim-jade')
add('digitaltoad/vim-pug')
add('qmx/vim-json')
add('saltstack/salt-vim')
add('lepture/vim-jinja')
add('Keithbsmiley/tmux.vim')
add('hynek/vim-python-pep8-indent')
add('mustache/vim-mustache-handlebars')
add('mxw/vim-jsx')
add('pangloss/vim-javascript')
add('wavded/vim-stylus')
add('udalov/kotlin-vim')
add('jvirtanen/vim-hcl')
add('hashivim/vim-terraform')
add('NoahTheDuke/vim-just')
