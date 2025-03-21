local t = require('telescope')
t.setup({defaults = {path_display = {"smart"}}})

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>t', builtin.git_files, {})
vim.keymap.set('n', '<leader>T', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', require("telescope").extensions.live_grep_args.live_grep_args, {})
vim.keymap.set('n', '<leader>b', builtin.buffers, {})
vim.keymap.set('n', '<leader>fs', builtin.git_status, {})
vim.keymap.set('n', '<leader>fS', builtin.git_branches, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
vim.keymap.set('n', '<leader>ft', builtin.treesitter, {})

t.load_extension('live_grep_args')

local extensions = t.extensions
t.load_extension('zoxide')
vim.keymap.set('n', '<leader>z', extensions.zoxide.list, {})

t.load_extension('chezmoi')
vim.keymap.set('n', '<leader>cz', t.extensions.chezmoi.find_files, {})

t.load_extension("notify")
vim.keymap.set('n', '<leader>n', t.extensions.notify.notify, {})

t.load_extension("refactoring")
vim.keymap.set({"n", "x"}, "<leader>ee", t.extensions.refactoring.refactors, {})
