require("octo").setup({
    enable_builtin = true,
    suppress_missing_scope = {projects_v2 = true}
})

vim.keymap.set("n", "<Leader>os", ":Octo<CR>")
vim.keymap.set("n", "<Leader>op", ":Octo pr create draft<CR>")
