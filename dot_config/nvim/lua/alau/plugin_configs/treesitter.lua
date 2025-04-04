vim.opt.foldmethod = 'expr'
vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'

require('nvim-treesitter.configs').setup({
    ensure_installed = {
        "python", "lua", "json", "sql", "javascript", "rust", "yaml", "dockerfile", "go", "vimdoc", "diff", "markdown"
    },

    -- Install parsers synchronously (only applied to `ensure_installed`)
    sync_install = false,

    -- Automatically install missing parsers when entering buffer
    auto_install = false,

    highlight = {enable = true},

    textobjects = {
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
            goto_next_start = {[']m'] = '@function.outer', [']]'] = '@class.outer', ["]b"] = "@code_cell.inner"},
            goto_next_end = {[']M'] = '@function.outer', [']['] = '@class.outer', ["]B"] = "@code_cell.inner"},
            goto_previous_start = {['[m'] = '@function.outer', ['[['] = '@class.outer', ["[b"] = "@code_cell.inner"},
            goto_previous_end = {['[M'] = '@function.outer', ['[]'] = '@class.outer', ["[B"] = "@code_cell.inner"}
        }
    }
})
