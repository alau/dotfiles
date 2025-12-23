require('kitty-scrollback').setup({
    ksb_builtin_get_text_all = {
        callbacks = {
            after_ready = function() vim.opt.clipboard = 'unnamedplus' end,
            after_paste_window_ready = function(_, _, _) vim.cmd('qa!') end
        }
    }
})
