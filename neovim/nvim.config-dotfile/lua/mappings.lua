-- Disable arrow keys
vim.keymap.set("", "<Up>", "<nop>")
vim.keymap.set("", "<Down>", "<nop>")
vim.keymap.set("", "<Left>", "<nop>")
vim.keymap.set("", "<Right>", "<nop>")
vim.keymap.set("i", "<Up>", "<nop>")
vim.keymap.set("i", "<Down>", "<nop>")
vim.keymap.set("i", "<Left>", "<nop>")
vim.keymap.set("i", "<Right>", "<nop>")

-- Pane handling
vim.keymap.set("n", "Q", ":close<CR>")

-- Window navigation
vim.keymap.set("n", "<C-h>", ":TmuxNavigateLeft<cr>", { silent = true })
vim.keymap.set("n", "<C-j>", ":TmuxNavigateDown<cr>", { silent = true })
vim.keymap.set("n", "<C-k>", ":TmuxNavigateUp<cr>", { silent = true })
vim.keymap.set("n", "<C-l>", ":TmuxNavigateRight<cr>", { silent = true })

-- Remove trailing spaces
vim.keymap.set("n", "<F5>", ":EraseBadWhitespace<CR>", { silent = true })

-- Quickfix navigation
vim.keymap.set("n", "<s", ":cprev<CR>")
vim.keymap.set("n", ">s", ":cnext<CR>")

-- Find usages
vim.keymap.set("n", "-", ":lua vim.lsp.buf.references()<CR>")

-- Saving file
vim.keymap.set("n", "<C-s>", ":write<CR>")
vim.keymap.set("i", "<C-s>", "<Esc>:write<CR>a")

-- Reloading vimrc
vim.keymap.set("", "<Leader>so", ":so ~/.config/nvim/init.lua<CR>")

-- Fugitive
vim.keymap.set("n", "<C-g>", ":Git<CR>)")
vim.keymap.set("", "<Leader>d", ":Git diff %<CR>")
vim.keymap.set("", "<Leader>D", ":Git diff<CR>")

-- ctrlp
vim.g.ctrlp_map = '<leader>t'
vim.keymap.set("", "<Leader>b", ":CtrlPBuffer<CR>")

-- NERDTree
vim.keymap.set("n", "<silent>", "<F10> :NERDTreeToggle<CR>")

-- NERDCommentator
vim.keymap.set("", "<Leader>x", "<plug>NERDCommenterToggle")

-- ctags
vim.keymap.set("", "<Leader>rt", ":!ctags -R *<CR><CR>")
vim.keymap.set("", "!", "<C-]>")
vim.keymap.set("", "&", ":pop<CR>")

-- Json formatting
vim.keymap.set("", "<Leader>J", ":% !python -m json.tool<CR>:set ft=json<CR>")

-- easymotion
vim.keymap.set("n", "L", "<Plug>(easymotion-j)")
vim.keymap.set("n", "H", "<Plug>(easymotion-k)")

-- Number toggle
vim.g.NumberToggleTrigger = "<F6>"

-- Ultisnips
vim.g.UltiSnipsExpandTrigger = "<F6>"
vim.g.UltiSnipsJumpForwardTrigger = "<F6>"
