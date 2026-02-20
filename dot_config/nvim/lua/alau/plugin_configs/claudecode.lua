require("claudecode").setup({git_repo_cwd = true, terminal = {split_side = "left", provider = "snacks"}})

vim.keymap.set({'n'}, '<leader>Co', '<cmd>ClaudeCode<cr>')
