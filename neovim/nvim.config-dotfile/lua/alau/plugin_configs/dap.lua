local dap = require('dap')
local dapui = require('dapui')

dapui.setup()
dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end

vim.keymap.set('n', '<F5>', dap.continue)
vim.keymap.set('n', '<F8>', dap.toggle_breakpoint)
vim.keymap.set('n', '<F10>', dap.step_over)
vim.keymap.set('n', '<F11>', dap.step_into)
vim.keymap.set('n', '<F12>', dap.step_out)

-- Language support
require("mason").setup()
require("mason-nvim-dap").setup({
  ensure_installed = { "python" }
})

require('dap-python').setup(vim.fn.stdpath('data')..'/mason/packages/debugpy/venv/bin/python')
