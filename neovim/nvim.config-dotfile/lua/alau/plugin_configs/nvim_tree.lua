require("nvim-tree").setup({
  view = {
    width = 45
  }
})

vim.keymap.set("n", "<F10>", ":NvimTreeToggle<CR>")
vim.keymap.set("n", "<F11>", ":NvimTreeFindFile<CR>")
