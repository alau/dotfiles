require('zen-mode').setup({
  window = {
    width = 1
  },
})
vim.keymap.set('n', '<leader>v', require('zen-mode').toggle, {})
