local chat = require('CopilotChat')
local select = require('CopilotChat.select')

vim.g.copilot_enabled = false

chat.setup({
    model = 'claude-3.5-sonnet',
    mappings = {reset = {normal = '<C-r>', insert = '<C-r>'}},
    chat_autocomplete = false
})

vim.keymap.set({'n'}, '<leader>co',
               function() chat.open({selection = select.buffer}) end)
vim.keymap.set({'v'}, '<leader>co',
               function() chat.open({selection = select.visual}) end)
vim.keymap.set({'n'}, '<leader>cc', function()
    chat.open({selection = select.buffer})
    chat.reset()
end)
vim.keymap.set({'v'}, '<leader>cc', function()
    chat.open({selection = select.visual})
    chat.reset()
end)
