vim.g.ale_use_neovim_diagnostics_api = 1

vim.g.ale_linters = { python = { 'ruff', 'mypy' } }

vim.g.ale_fixers = {
  python = { 'trim_whitespace', 'black', 'autoimport', 'isort' },
  ['*'] = { 'trim_whitespace' }
}
vim.g.ale_fix_on_save = 1

vim.api.nvim_set_keymap('n', '<Leader>i', ':lua vim.diagnostic.open_float()<CR>', {})
