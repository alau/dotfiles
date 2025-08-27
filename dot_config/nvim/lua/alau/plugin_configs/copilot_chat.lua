local chat = require('CopilotChat')
local select = require('CopilotChat.select')

vim.g.copilot_enabled = false

vim.opt.completeopt = vim.opt.completeopt + {'noinsert', 'noselect', 'popup'}
chat.setup({model = 'claude-sonnet-4', mappings = {reset = {normal = '<C-r>', insert = '<C-r>'}}, window = {width = 80}})

vim.keymap.set({'n'}, '<leader>co', function() chat.open({selection = select.buffer}) end)
vim.keymap.set({'v'}, '<leader>co', function() chat.open({selection = select.visual}) end)
vim.keymap.set({'n'}, '<leader>cc', function()
    chat.open({selection = select.buffer})
    chat.reset()
end)
vim.keymap.set({'v'}, '<leader>cc', function()
    chat.open({selection = select.visual})
    chat.reset()
end)
