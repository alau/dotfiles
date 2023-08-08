require('lint').linters_by_ft = {
  python = { 'ruff', 'mypy', }
}

local function get_cmd(executable)
  local util = require('lspconfig/util')
  local path = util.path
  if vim.env.VIRTUAL_ENV then
    return path.join(vim.env.VIRTUAL_ENV, 'bin', executable)
  end

  return executable
end

require('lint').linters.ruff.env = {
  cmd = get_cmd("ruff")
}

require('lint').linters.mypy.env = {
  cmd = get_cmd("mypy")
}

vim.cmd [[au BufWritePost * silent! lua require('lint').try_lint()]]
