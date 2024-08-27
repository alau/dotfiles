local dap = require('dap')
local dapui = require('dapui')
require("nvim-dap-virtual-text").setup()

dapui.setup()
dap.listeners.after.event_initialized["dapui_config"] =
    function() dapui.open() end
dap.listeners.before.event_terminated["dapui_config"] =
    function() dapui.close() end
dap.listeners.before.event_exited["dapui_config"] = function() dapui.close() end

local continue = function()
    -- Automatically load launch config
    if vim.fn.filereadable('.vscode/launch.json') then
        require('dap.ext.vscode').load_launchjs()
    end
    dap.continue()
end

vim.keymap.set('n', '<F5>', continue)
vim.keymap.set('n', '<F8>', dap.toggle_breakpoint)
vim.keymap.set('n', '<F10>', dap.step_into)
vim.keymap.set('n', '<F11>', dap.step_over)
vim.keymap.set('n', '<F12>', dap.step_out)

vim.keymap.set('v', '<F7>', dapui.eval)

-- Language support
require("mason").setup()
require("mason-nvim-dap").setup({ensure_installed = {"python"}})

require('dap-python').setup(vim.fn.stdpath('data') ..
                                '/mason/packages/debugpy/venv/bin/python')
