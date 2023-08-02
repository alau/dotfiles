-- Pane handling
vim.keymap.set("n", "Q", ":close<CR>")

-- Window navigation
vim.keymap.set("n", "<C-h>", ":TmuxNavigateLeft<cr>", { silent = true })
vim.keymap.set("n", "<C-j>", ":TmuxNavigateDown<cr>", { silent = true })
vim.keymap.set("n", "<C-k>", ":TmuxNavigateUp<cr>", { silent = true })
vim.keymap.set("n", "<C-l>", ":TmuxNavigateRight<cr>", { silent = true })

-- Quickfix navigation
vim.keymap.set("n", "[s", ":cprev<CR>")
vim.keymap.set("n", "]s", ":cnext<CR>")

-- Saving file
vim.keymap.set("n", "<C-s>", ":write<CR>")
vim.keymap.set("i", "<C-s>", "<Esc>:write<CR>a")

-- Move code
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Navigation
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Searching
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Json formatting
vim.keymap.set("", "<Leader>J", ":% !python -m json.tool<CR>:set ft=json<CR>")
