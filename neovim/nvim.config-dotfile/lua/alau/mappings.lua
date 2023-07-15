-- Disable arrow keys
vim.keymap.set("", "<Up>", "<nop>")
vim.keymap.set("", "<Down>", "<nop>")
vim.keymap.set("", "<Left>", "<nop>")
vim.keymap.set("", "<Right>", "<nop>")
vim.keymap.set("i", "<Up>", "<nop>")
vim.keymap.set("i", "<Down>", "<nop>")
vim.keymap.set("i", "<Left>", "<nop>")
vim.keymap.set("i", "<Right>", "<nop>")

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

-- ctags
vim.keymap.set("", "<Leader>rt", ":!ctags -R *<CR><CR>")
vim.keymap.set("", "!", "<C-]>")
vim.keymap.set("", "&", ":pop<CR>")

-- Json formatting
vim.keymap.set("", "<Leader>J", ":% !python -m json.tool<CR>:set ft=json<CR>")
