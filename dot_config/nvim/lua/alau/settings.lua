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
vim.opt.clipboard = {'unnamedplus', 'unnamed'}

-- Folding
vim.opt.foldmethod = 'syntax'
vim.g.javaScript_fold = 1
vim.opt.foldlevelstart = 99

-- Colors
vim.opt.termguicolors = true
vim.g.gruvbox_baby_background_color = "dark"
vim.g.gruvbox_baby_color_overrides = {
    background = "#000000",
    comment = "lightblue",
    soft_green = "#a7dc91",
    blue_gray = "#6a9d9f"
}
vim.cmd [[highlight LineNr guifg=lightblue]]
vim.cmd [[silent! colorscheme gruvbox-baby]]

-- For nvim-tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

