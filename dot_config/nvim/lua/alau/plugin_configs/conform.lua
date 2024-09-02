require("conform").setup({
    format_on_save = {timeout_ms = 500, lsp_format = "fallback"},
    formatters_by_ft = {
        ["*"] = {"trim_whitespace"},
        python = {"ruff_fix", "black", "isort"},
        go = {"golines"},
        javascript = {"prettier"},
        lua = {"lua-format"}
    }
})
