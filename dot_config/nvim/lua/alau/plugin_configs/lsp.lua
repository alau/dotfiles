vim.opt.updatetime = 300
-- Always show the signcolumn to avoid shifting text when it appears
vim.opt.signcolumn = "yes"

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {border = "rounded"})

local capabilities = vim.lsp.protocol.make_client_capabilities()

vim.lsp.config("*", {capabilities = capabilities})

vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(_, bufnr)
        local bufopts = {noremap = true, silent = true, buffer = bufnr}
        local set = vim.keymap.set
        local diagnostic = vim.diagnostic

        set('n', '<leader>rn', vim.lsp.buf.rename, bufopts)
        set('n', '<leader>ca', vim.lsp.buf.code_action, bufopts)

        set('n', 'gd', vim.lsp.buf.definition, bufopts)
        set('n', 'K', vim.lsp.buf.hover, bufopts)
        set('n', 'gr', require('telescope.builtin').lsp_references, bufopts)
        set('n', 'gs', require('telescope.builtin').lsp_dynamic_workspace_symbols, bufopts)
        set('n', 'gi', require('telescope.builtin').lsp_implementations, bufopts)

        set("n", "[l", diagnostic.goto_prev)
        set("n", "]l", diagnostic.goto_next)
        set("n", "<leader>l", diagnostic.setqflist)
    end
})

vim.lsp.enable({
    "gopls", "jsonls", "dockerls", "terraformls", "rust_analyzer", "sqlls", "helm_ls", "pyright", "lua_ls", "ts_ls"
})
