 -- Don't create backup/swap files
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.swapfile = false

-- Indentation
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.expandtab = true

-- Line numbers
vim.opt.number = true

-- Allow modelines
vim.opt.modeline = true

-- Ignore case when searching
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Avoid redraw-flashing while doing stuff
vim.opt.lazyredraw = true

-- Use , as <Leader> and <LocalLeader>
vim.g.mapleader = ","
vim.g.maplocalleader = ","

-- Use system clipboard by default
vim.opt.clipboard = {'unnamedplus','unnamed'}

-- Folding
vim.opt.foldmethod = 'syntax'
vim.g.javaScript_fold = 1
vim.opt.foldlevelstart = 99

-- Colors
vim.opt.termguicolors = true
vim.opt.background = 'dark'
vim.g.gruvbox_material_background = 'hard'
vim.g.gruvbox_material_foreground = 'original'
vim.g.gruvbox_material_better_performance = 1
vim.g.airline_theme = 'gruvbox_material'
vim.cmd [[colorscheme gruvbox-material]]
vim.cmd [[highlight Comment guifg=lightblue]]
vim.cmd [[highlight LineNr guifg=lightblue]]

-- Terminal
vim.cmd [[autocmd TermOpen * startinsert]]
vim.cmd [[autocmd TermOpen * setlocal nonumber]]
vim.cmd [[autocmd TermOpen * :HideBadWhitespace]]
vim.cmd [[autocmd TermEnter * setlocal signcolumn=no]]

-- For nvim-tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

