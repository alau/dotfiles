require("aerial").setup({
    layout = {width = 60},
    on_attach = function(bufnr)
        vim.keymap.set("n", "{", "<cmd>AerialPrev<CR>", {buffer = bufnr})
        vim.keymap.set("n", "}", "<cmd>AerialNext<CR>", {buffer = bufnr})
    end
})
vim.keymap.set("n", "<leader>ao", "<cmd>AerialToggle!<CR>")

