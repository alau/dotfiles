vim.opt.foldmethod = 'expr'
vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'

require('nvim-treesitter').setup({install_dir = vim.fn.stdpath('data') .. '/site'})

require('nvim-treesitter').install({
    "python", "lua", "json", "sql", "javascript", "yaml", "dockerfile", "go", "vimdoc", "diff", "markdown", "helm"
})

require("nvim-treesitter-textobjects").setup({
    select = {
        enable = true,
        lookahead = true,
        keymaps = {
            ["af"] = "@function.outer",
            ["if"] = "@function.inner",
            ["ac"] = "@class.outer",
            ["ic"] = "@class.inner",
            ["ib"] = "@code_cell.inner",
            ["ab"] = "@code_cell.outer"
        }
    },
    move = {
        enable = true,
        set_jumps = true,
        goto_next_start = {[']f'] = '@function.outer', [']]'] = '@class.outer', ["]b"] = "@code_cell.inner"},
        goto_next_end = {[']F'] = '@function.outer', [']['] = '@class.outer', ["]B"] = "@code_cell.inner"},
        goto_previous_start = {['[f'] = '@function.outer', ['[['] = '@class.outer', ["[b"] = "@code_cell.inner"},
        goto_previous_end = {['[F'] = '@function.outer', ['[]'] = '@class.outer', ["[B"] = "@code_cell.inner"}
    }
})

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
