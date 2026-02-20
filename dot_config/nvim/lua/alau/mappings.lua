-- Pane handling
vim.keymap.set("n", "Q", ":close<CR>")

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
vim.keymap.set("n", "<PageUp>", "<C-u>zz")
vim.keymap.set("n", "<PageDown>", "<C-d>zz")
vim.keymap.set("t", "<PageUp>", "<C-\\><C-n><C-u>zz")
vim.keymap.set("t", "<PageDown>", "<C-\\><C-n><C-d>zz")
vim.keymap.set("n", "<C-u>", "<PageUp>zz")
vim.keymap.set("n", "<C-d>", "<PageDown>zz")

-- Searching
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Json formatting
vim.keymap.set("", "<Leader>J", ":% !python -m json.tool<CR>:set ft=json<CR>")
