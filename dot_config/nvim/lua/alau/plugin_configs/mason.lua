require("mason").setup()
require("mason-nvim-lint").setup()
require("mason-conform").setup()
require('mason-tool-installer').setup {
    ensure_installed = {
        "gopls", "json-lsp", "dockerfile-language-server", "terraform-ls", "rust-analyzer", "sqlls", "helm-ls",
        "yaml-language-server", "pyright", "lua-language-server", "typescript-language-server"
    }
}
