require('lint').linters_by_ft = {
  python = { 'ruff', 'mypy', }
}

local function get_ruff_path(_)
  local util = require('lspconfig/util')
  local path = util.path
  if vim.env.VIRTUAL_ENV then
    return path.join(vim.env.VIRTUAL_ENV, 'bin', 'ruff')
  end

  return 'ruff'
end

require('lint').linters.ruff.env = {
  cmd = get_ruff_path(vim.fn.getcwd())
}

vim.cmd [[au BufWritePost * silent! lua require('lint').try_lint()]]
