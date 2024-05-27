require("octo").setup({
  enable_builtin = true,
  suppress_missing_scope = {
    projects_v2 = true,
  }
})

vim.keymap.set("n", "<Leader>o", ":Octo<CR>")
