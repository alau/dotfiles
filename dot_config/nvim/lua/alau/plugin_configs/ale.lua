vim.g.ale_use_neovim_diagnostics_api = 1

vim.g.ale_linters = {
  python = { 'ruff', 'mypy' },
  yaml = { 'yamllint' },
  javascript = { 'eslint' },
}
vim.g.ale_python_mypy_auto_poetry = 1
vim.g.ale_python_mypy_auto_pipenv = 1
vim.g.ale_python_mypy_options = '--follow-imports=silent'
vim.g.ale_yaml_yamllint_options = '-d "{extends: default, rules: {line-length: {max: 120}, truthy: disable, document-start: disable}}"'

vim.g.ale_fixers = {
  python = { 'trim_whitespace', 'black', 'autoimport', 'isort' },
  javascript = { 'trim_whitespace', 'prettier' },
  ['*'] = { 'trim_whitespace' }
}
vim.g.ale_fix_on_save = 1

vim.api.nvim_set_keymap('n', '<Leader>i', ':lua vim.diagnostic.open_float()<CR>', {})
