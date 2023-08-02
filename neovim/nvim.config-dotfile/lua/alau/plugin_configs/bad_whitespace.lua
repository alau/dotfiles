vim.cmd [[autocmd BufWritePre * EraseBadWhitespace]]

vim.keymap.set("n", "<F3>", ":EraseBadWhitespace<CR>", { silent = true })
