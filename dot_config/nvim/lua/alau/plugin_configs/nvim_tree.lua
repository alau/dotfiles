require("nvim-tree").setup({view = {width = {}}})

vim.keymap.set("n", "<Leader>at", ":NvimTreeToggle<CR>")
vim.keymap.set("n", "<Leader>af", ":NvimTreeFindFile!<CR>")
