require('lint').linters_by_ft = {
  python = { 'ruff', 'mypy' },
  yaml = { 'yamllint' },
  javascript = { 'eslint' },
  go = { 'golangci-lint' },
}

table.insert(
  require('lint').linters.mypy.args,
  0,
  '--follow-imports=silent'
)
table.insert(
  require('lint').linters.yamllint.args,
  0,
  '-d "{extends: default, rules: {line-length: {max: 120}, truthy: disable, document-start: disable}}"'
)

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
  callback = function()
    require("lint").try_lint()
  end,
})

vim.api.nvim_set_keymap('n', '<Leader>i', ':lua vim.diagnostic.open_float()<CR>', {})
