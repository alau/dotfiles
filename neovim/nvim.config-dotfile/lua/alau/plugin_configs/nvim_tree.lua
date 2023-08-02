require("nvim-tree").setup({
  view = {
    width = {}
  }
})

vim.keymap.set("n", "<Leader>a", ":NvimTreeToggle<CR>")
vim.keymap.set("n", "<Leader>o", ":NvimTreeFindFile!<CR>")
