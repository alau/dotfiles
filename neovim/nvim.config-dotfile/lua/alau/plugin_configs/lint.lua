require('lint').linters_by_ft = {
  python = { 'ruff', 'mypy', }
}

vim.cmd [[au BufWritePost * lua require('lint').try_lint()]]
