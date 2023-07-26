vim.g["test#strategy"] = "vimux"

vim.keymap.set("n", "<Leader>r", ":TestNearest<CR>", { silent = true })
vim.keymap.set("n", "<Leader>c", ":TestLast<CR>", { silent = true })
