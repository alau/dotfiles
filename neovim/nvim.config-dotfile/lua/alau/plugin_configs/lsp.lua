vim.opt.updatetime = 300
-- Always show the signcolumn to avoid shifting text when it appears
vim.opt.signcolumn = "yes"

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
  border = "rounded",
})

require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = {
    "lua_ls",
    "pyright",
    "tsserver",
    "sqlls",
    "rust_analyzer",
    "terraformls",
    "dockerls",
    "helm_ls",
  }
})

local on_attach = function(_, bufnr)
  local bufopts = { noremap = true, silent = true, buffer = bufnr }
  local set = vim.keymap.set
  local diagnostic = vim.diagnostic

  set('n', '<leader>rn', vim.lsp.buf.rename, bufopts)
  set('n', '<leader>ca', vim.lsp.buf.code_action, bufopts)

  set('n', 'gd', vim.lsp.buf.definition, bufopts)
  set('n', 'K', vim.lsp.buf.hover, bufopts)
  set('n', '<leader>fr', require('telescope.builtin').lsp_references, bufopts)
  set('n', '<leader>fs', require('telescope.builtin').lsp_dynamic_workspace_symbols, bufopts)

  set("n", "[l", diagnostic.goto_prev)
  set("n", "]l", diagnostic.goto_next)
  set("n", "<leader>l", diagnostic.setqflist)
end

local capabilities = require('cmp_nvim_lsp').default_capabilities()
local lspconfig = require('lspconfig')


-- lua
lspconfig.lua_ls.setup({
  capabilities = capabilities,
  on_attach = on_attach,
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim", "exepath" },
      },
      workspace = {
        checkThirdParty = false,
      },
    }
  }
})


-- python
local util = require('lspconfig/util')
local path = util.path

local function get_python_path(workspace)
  -- Use activated virtualenv.
  if vim.env.VIRTUAL_ENV then
    return path.join(vim.env.VIRTUAL_ENV, 'bin', 'python')
  end

  -- Find and use virtualenv in workspace directory.
  for _, pattern in ipairs({'*', '.*'}) do
    local match = vim.fn.glob(path.join(workspace, pattern, 'pyvenv.cfg'))
    if match ~= '' then
      return path.join(path.dirname(match), 'bin', 'python')
    end
  end

  -- Fallback to system Python.
  return exepath('python3') or exepath('python') or 'python'
end

lspconfig.pyright.setup({
  before_init = function(_, config)
    config.settings.python.pythonPath = get_python_path(config.root_dir)
  end,
  capabilities = capabilities,
  on_attach = on_attach,
  handlers = {
    ['textDocument/publishDiagnostics'] = function() end
  }
})


-- typescript
lspconfig.tsserver.setup({
  capabilities = capabilities,
  on_attach = on_attach,
  single_file_suppert = true,
})


-- helm
lspconfig.helm_ls.setup({
  capabilities = capabilities,
  on_attach = on_attach,
  filetypes = {'helm', 'yaml'}
})


-- default config for other languages
local remaining_servers = {
  'sqlls',
  'rust_analyzer',
  'terraformls',
  'dockerls',
  'helm_ls'
}
for _, server in ipairs(remaining_servers) do
  lspconfig[server].setup({
    capabilities = capabilities,
    on_attach = on_attach,
  })
end
