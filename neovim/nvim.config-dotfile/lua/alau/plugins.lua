vim.cmd [[packadd packer.nvim]]

return require('packer').startup({function(use)
  -- Tools
  use {
    'wbthomason/packer.nvim',
    opt = true,
    lock = true,
  }
  use 'tpope/vim-fugitive'
  use {
    'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
  use 'nvim-telescope/telescope-live-grep-args.nvim'
  use 'jvgrootveld/telescope-zoxide'
  use 'nvim-tree/nvim-tree.lua'
  use 'godlygeek/tabular'
  use 'mg979/vim-visual-multi'
  use 'Lokaltog/vim-easymotion'
  use 'scrooloose/nerdcommenter'
  use 'mhinz/vim-startify'
  use 'simrat39/symbols-outline.nvim'
  use 'preservim/vimux'

  -- Utility
  use 'tpope/vim-sensible'
  use 'tpope/vim-surround'
  use 'chaoren/vim-wordmotion'
  use 'DataWraith/auto_mkdir'
  use 'christoomey/vim-tmux-navigator'
  use 'ConradIrwin/vim-bracketed-paste'
  use 'lambdalisue/suda.vim'
  use {
    'nvim-treesitter/nvim-treesitter',
    run = function()
      local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
      ts_update()
    end,
  }
  use 'nvim-treesitter/nvim-treesitter-textobjects'
  use 'mfussenegger/nvim-lint'
  use 'nvim-treesitter/nvim-treesitter-context'
  use 'vim-test/vim-test'
  use 'Almo7aya/openingh.nvim'

  -- Completions
  use {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
  }
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'L3MON4D3/LuaSnip'
  use 'hrsh7th/cmp-nvim-lsp-signature-help'

  -- Look and feel
  use 'luisiacc/gruvbox-baby'
  use 'bitc/vim-bad-whitespace'
  use 'airblade/vim-gitgutter'
  use 'nvim-tree/nvim-web-devicons'
  use 'nvim-lualine/lualine.nvim'

  -- Language support
  use 'statianzo/vim-jade'
  use 'digitaltoad/vim-pug'
  use 'qmx/vim-json'
  use 'saltstack/salt-vim'
  use 'lepture/vim-jinja'
  use 'Keithbsmiley/tmux.vim'
  use 'hynek/vim-python-pep8-indent'
  use 'mustache/vim-mustache-handlebars'
  use 'pangloss/vim-javascript'
  use 'wavded/vim-stylus'
  use 'udalov/kotlin-vim'
  use 'jvirtanen/vim-hcl'
  use 'hashivim/vim-terraform'
  use 'NoahTheDuke/vim-just'
  use 'euclidianAce/BetterLua.vim'
  use 'kchmck/vim-coffee-script'
end,
config = {
  package_root = vim.fn.stdpath('config') .. '/pack',
  display = {
    open_fn = require('packer.util').float,
  }
}})
