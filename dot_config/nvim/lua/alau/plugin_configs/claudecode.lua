require("claudecode").setup({git_repo_cwd = true, terminal = {split_side = "left", provider = "snacks"}})

vim.keymap.set('n', '<leader>Co', '<cmd>ClaudeCode<cr>')
vim.keymap.set('n', '<leader>Cf', '<cmd>ClaudeCodeFocus<cr>')
vim.keymap.set('n', '<leader>Ca', '<cmd>ClaudeCodeDiffAccept<cr>')
vim.keymap.set('n', '<leader>Cd', '<cmd>ClaudeCodeDiffDeny<cr>')
vim.keymap.set('n', '<leader>Cb', '<cmd>ClaudeCodeAdd %<cr>')
