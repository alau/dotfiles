require('kitty-scrollback').setup({
    get_text_all = {
        kitty_get_text = {extent = 'all'},
        callbacks = {after_paste_window_ready = function(_, _, _) vim.cmd('qa!') end}
    }
})
