vim.cmd [[packadd packer.nvim]]

return require('packer').startup({
    function(use)
        -- Tools
        use {'wbthomason/packer.nvim', opt = true, lock = true}
        use 'tpope/vim-fugitive'
        use {'nvim-telescope/telescope.nvim', requires = {{'nvim-lua/plenary.nvim'}}}
        use "sindrets/diffview.nvim"
        use {
            'NeogitOrg/neogit',
            requires = {{"nvim-lua/plenary.nvim", "sindrets/diffview.nvim", "nvim-telescope/telescope.nvim"}}
        }
        use 'lewis6991/gitsigns.nvim'
        use 'nvim-telescope/telescope-live-grep-args.nvim'
        use 'jvgrootveld/telescope-zoxide'
        use 'nvim-tree/nvim-tree.lua'
        use 'godlygeek/tabular'
        use 'mg979/vim-visual-multi'
        use 'folke/flash.nvim'
        use 'scrooloose/nerdcommenter'
        use {'goolord/alpha-nvim', requires = {'nvim-tree/nvim-web-devicons'}}
        use 'simrat39/symbols-outline.nvim'
        use 'nvim-neotest/neotest'
        use 'nvim-neotest/neotest-python'
        use 'nvim-neotest/neotest-go'
        use 'nvim-neotest/neotest-jest'
        use 'folke/zen-mode.nvim'
        use 'ThePrimeagen/harpoon'
        use 'duane9/nvim-rg'
        use {'jackMort/ChatGPT.nvim', requires = {"MunifTanjim/nui.nvim"}}
        use {
            'pwntester/octo.nvim',
            requires = {'nvim-lua/plenary.nvim', 'nvim-telescope/telescope.nvim', 'nvim-tree/nvim-web-devicons'}
        }
        use {'github/copilot.vim', 'CopilotC-Nvim/CopilotChat.nvim', requires = {{'nvim-lua/plenary.nvim'}}}
        use 'gbprod/substitute.nvim'

        -- Utility
        use 'tpope/vim-sensible'
        use 'tpope/vim-surround'
        use 'chaoren/vim-wordmotion'
        use 'DataWraith/auto_mkdir'
        use 'mrjones2014/smart-splits.nvim'
        use 'ConradIrwin/vim-bracketed-paste'
        use 'lambdalisue/suda.vim'
        use {
            'nvim-treesitter/nvim-treesitter',
            run = function()
                local ts_update = require('nvim-treesitter.install').update({with_sync = true})
                ts_update()
            end
        }
        use 'nvim-treesitter/nvim-treesitter-textobjects'
        use 'nvim-treesitter/nvim-treesitter-context'
        use 'antoinemadec/FixCursorHold.nvim'
        use 'Almo7aya/openingh.nvim'
        use 'xvzc/chezmoi.nvim'
        use {
            "williamboman/mason.nvim", "williamboman/mason-lspconfig.nvim", "neovim/nvim-lspconfig",
            "mfussenegger/nvim-lint", "rshkarin/mason-nvim-lint", "stevearc/conform.nvim", "zapling/mason-conform.nvim"
        }
        use {
            "ThePrimeagen/refactoring.nvim",
            requires = {{"nvim-lua/plenary.nvim"}, {"nvim-treesitter/nvim-treesitter"}}
        }
        use {'kosayoda/nvim-lightbulb'}
        use {'folke/snacks.nvim'}
        use {'stevanmilic/nvim-lspimport'}

        -- Completions
        use 'hrsh7th/nvim-cmp'
        use 'hrsh7th/cmp-nvim-lsp'
        use 'L3MON4D3/LuaSnip'
        use 'hrsh7th/cmp-nvim-lsp-signature-help'
        use 'saadparwaiz1/cmp_luasnip'
        use 'rafamadriz/friendly-snippets'

        -- Debugging
        use 'mfussenegger/nvim-dap'
        use 'nvim-neotest/nvim-nio'
        use 'rcarriga/nvim-dap-ui'
        use 'jay-babu/mason-nvim-dap.nvim'
        use 'mfussenegger/nvim-dap-python'
        use 'leoluz/nvim-dap-go'
        use 'theHamsta/nvim-dap-virtual-text'

        -- Notebooks
        use {'benlubas/molten-nvim', run = ':UpdateRemotePlugins'}
        use '3rd/image.nvim'
        use {'quarto-dev/quarto-nvim', requires = {'jmbuhr/otter.nvim'}}
        use 'GCBallesteros/jupytext.nvim'

        -- Look and feel
        use 'luisiacc/gruvbox-baby'
        use 'nvim-tree/nvim-web-devicons'
        use 'nvim-lualine/lualine.nvim'
        use 'rcarriga/nvim-notify'

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
        use 'towolf/vim-helm'
    end,
    config = {package_root = vim.fn.stdpath('config') .. '/pack', display = {open_fn = require('packer.util').float}}
})
