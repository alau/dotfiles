local s = require('substitute')
s.setup()

vim.keymap.set("n", "s", s.operator, { noremap = true })
vim.keymap.set("n", "ss", s.line, { noremap = true })
vim.keymap.set("n", "S", s.eol, { noremap = true })
vim.keymap.set("x", "s", s.visual, { noremap = true })
