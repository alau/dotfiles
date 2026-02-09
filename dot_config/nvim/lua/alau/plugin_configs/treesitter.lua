vim.opt.foldmethod = 'expr'
vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'

require('nvim-treesitter').setup({install_dir = vim.fn.stdpath('data') .. '/site'})

require('nvim-treesitter').install({
    "python", "lua", "json", "sql", "javascript", "yaml", "dockerfile", "go", "vimdoc", "diff", "markdown", "helm"
})

require("nvim-treesitter-textobjects").setup({select = {lookahead = true}, move = {set_jumps = true}})

local ts_select = require("nvim-treesitter-textobjects.select")
local ts_move = require("nvim-treesitter-textobjects.move")

-- Select textobjects
vim.keymap.set({"x", "o"}, "af", function() ts_select.select_textobject("@function.outer", "textobjects") end)
vim.keymap.set({"x", "o"}, "if", function() ts_select.select_textobject("@function.inner", "textobjects") end)
vim.keymap.set({"x", "o"}, "ac", function() ts_select.select_textobject("@class.outer", "textobjects") end)
vim.keymap.set({"x", "o"}, "ic", function() ts_select.select_textobject("@class.inner", "textobjects") end)
vim.keymap.set({"x", "o"}, "ib", function() ts_select.select_textobject("@code_cell.inner", "textobjects") end)
vim.keymap.set({"x", "o"}, "ab", function() ts_select.select_textobject("@code_cell.outer", "textobjects") end)

-- Move textobjects - next start
vim.keymap.set({"n", "x", "o"}, "]f", function() ts_move.goto_next_start("@function.outer", "textobjects") end)
vim.keymap.set({"n", "x", "o"}, "]]", function() ts_move.goto_next_start("@class.outer", "textobjects") end)
vim.keymap.set({"n", "x", "o"}, "]b", function() ts_move.goto_next_start("@code_cell.inner", "textobjects") end)

-- Move textobjects - next end
vim.keymap.set({"n", "x", "o"}, "]F", function() ts_move.goto_next_end("@function.outer", "textobjects") end)
vim.keymap.set({"n", "x", "o"}, "][", function() ts_move.goto_next_end("@class.outer", "textobjects") end)
vim.keymap.set({"n", "x", "o"}, "]B", function() ts_move.goto_next_end("@code_cell.inner", "textobjects") end)

-- Move textobjects - previous start
vim.keymap.set({"n", "x", "o"}, "[f", function() ts_move.goto_previous_start("@function.outer", "textobjects") end)
vim.keymap.set({"n", "x", "o"}, "[[", function() ts_move.goto_previous_start("@class.outer", "textobjects") end)
vim.keymap.set({"n", "x", "o"}, "[b", function() ts_move.goto_previous_start("@code_cell.inner", "textobjects") end)

-- Move textobjects - previous end
vim.keymap.set({"n", "x", "o"}, "[F", function() ts_move.goto_previous_end("@function.outer", "textobjects") end)
vim.keymap.set({"n", "x", "o"}, "[]", function() ts_move.goto_previous_end("@class.outer", "textobjects") end)
vim.keymap.set({"n", "x", "o"}, "[B", function() ts_move.goto_previous_end("@code_cell.inner", "textobjects") end)

vim.api.nvim_create_autocmd('FileType', {
    pattern = {
        "python", "lua", "json", "sql", "javascript", "yaml", "dockerfile", "go", "vimdoc", "diff", "markdown", "helm"
    },
    callback = function()
        vim.treesitter.start()
        vim.wo[0][0].foldexpr = 'v:lua.vim.treesitter.foldexpr()'
        vim.wo[0][0].foldmethod = 'expr'
    end
})
