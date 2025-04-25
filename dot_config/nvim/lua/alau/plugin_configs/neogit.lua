local neogit = require('neogit')
neogit.setup({mappings = {status = {["Q"] = false}}})

vim.keymap.set("n", "<C-g>", neogit.open, {})
