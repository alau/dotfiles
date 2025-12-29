require('kitty-scrollback').setup({
    get_text_all = {
        kitty_get_text = {extent = 'all'},
        callbacks = {after_paste_window_ready = function(_, _, _) vim.cmd('qa!') end}
    },
    get_text_all_page_up = {
        kitty_get_text = {extent = 'all'},
        callbacks = {
            after_ready = function()
                vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<PageUp>zz', true, false, true), 'n', false)
            end
        }
    }
})
