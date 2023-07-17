local t = require('telescope')
t.setup({})

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>t', builtin.git_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>b', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
vim.keymap.set('n', '<leader>ft', builtin.treesitter, {})

local extensions = t.extensions
t.load_extension('zoxide')
vim.keymap.set('n', '<leader>z', extensions.zoxide.list, {})
