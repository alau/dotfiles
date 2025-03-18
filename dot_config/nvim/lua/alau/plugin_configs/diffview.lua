require("diffview").setup({
    enhanced_diff_hl = true,
    hooks = {
        diff_buf_win_enter = function(_, _, ctx)
            if ctx.layout_name:match("^diff2") then
                if ctx.symbol == "a" then
                    vim.opt_local.winhl = table.concat({
                        "DiffAdd:DiffviewDiffAddAsDelete", "DiffDelete:DiffviewDiffDelete"
                    }, ",")
                elseif ctx.symbol == "b" then
                    vim.opt_local.winhl = table.concat({"DiffDelete:DiffviewDiffDelete"}, ",")
                end
            end
        end
    }
})
