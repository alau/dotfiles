require("mason").setup()
require("mason-lspconfig").setup({
    ensure_installed = {
        "lua_ls", "pyright", "ts_ls", "sqlls", "rust_analyzer", "terraformls", "dockerls", "helm_ls", "jsonls", "gopls"
    }
})
require("mason-nvim-lint").setup()
require("mason-conform").setup()
