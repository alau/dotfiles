vim.cmd [[autocmd BufWritePre * EraseBadWhitespace]]

vim.keymap.set("n", "<F5>", ":EraseBadWhitespace<CR>", { silent = true })
