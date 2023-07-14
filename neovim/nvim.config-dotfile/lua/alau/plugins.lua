vim.cmd [[packadd packer.nvim]]

return require('packer').startup({function(use)
  -- Tools
  use {'wbthomason/packer.nvim', opt = true}
  use 'tpope/vim-fugitive'
  use {
    'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
  use 'nvim-tree/nvim-tree.lua'
  use 'godlygeek/tabular'
  use 'mg979/vim-visual-multi'
  use 'Lokaltog/vim-easymotion'
  use 'scrooloose/nerdcommenter'
  use 'mhinz/vim-startify'
  use 'simrat39/symbols-outline.nvim'
  use 'akinsho/toggleterm.nvim'

  -- Utility
  use 'tpope/vim-sensible'
  use 'tpope/vim-surround'
  use 'chaoren/vim-wordmotion'
  use 'DataWraith/auto_mkdir'
  use 'christoomey/vim-tmux-navigator'
  use 'matze/vim-move'
  use 'ConradIrwin/vim-bracketed-paste'
  use 'lambdalisue/suda.vim'
  use {
    'nvim-treesitter/nvim-treesitter',
    run = function()
      local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
      ts_update()
    end,
  }

  -- Completions
  use {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
  }
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'L3MON4D3/LuaSnip'

  -- Look and feel
  use 'tpope/vim-vividchalk'
  use 'bling/vim-airline'
  use 'bitc/vim-bad-whitespace'
  use 'airblade/vim-gitgutter'
  use 'nvim-tree/nvim-web-devicons'

  -- Language support
  use 'statianzo/vim-jade'
  use 'digitaltoad/vim-pug'
  use 'qmx/vim-json'
  use 'saltstack/salt-vim'
  use 'lepture/vim-jinja'
  use 'Keithbsmiley/tmux.vim'
  use 'hynek/vim-python-pep8-indent'
  use 'mustache/vim-mustache-handlebars'
  use 'mxw/vim-jsx'
  use 'pangloss/vim-javascript'
  use 'wavded/vim-stylus'
  use 'udalov/kotlin-vim'
  use 'jvirtanen/vim-hcl'
  use 'hashivim/vim-terraform'
  use 'NoahTheDuke/vim-just'
  use 'tbastos/vim-lua'
end,
config = {
  package_root = vim.fn.stdpath('config') .. '/pack',
  display = {
    open_fn = require('packer.util').float,
  }
}})