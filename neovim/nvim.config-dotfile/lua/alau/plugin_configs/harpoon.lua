vim.keymap.set("n", "<Leader>ha", require("harpoon.mark").add_file)
vim.keymap.set("n", "<Leader>hq", require("harpoon.ui").toggle_quick_menu)
vim.keymap.set("n", "1", ':lua require("harpoon.ui").nav_file(1)<CR>zz')
vim.keymap.set("n", "2", ':lua require("harpoon.ui").nav_file(2)<CR>zz')
vim.keymap.set("n", "3", ':lua require("harpoon.ui").nav_file(3)<CR>zz')
vim.keymap.set("n", "4", ':lua require("harpoon.ui").nav_file(4)<CR>zz')

