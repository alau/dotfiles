local c = require("conform")
c.setup({
    format_on_save = function(bufnr)
        -- Disable with a global or buffer-local variable
        if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then return end
        return {timeout_ms = 1000, lsp_format = "fallback"}
    end,
    formatters_by_ft = {
        ["*"] = {"trim_whitespace"},
        python = {"ruff_fix", "black", "autoimport", "isort"},
        ["python.notebook"] = {"black", "isort"},
        go = {"golines"},
        javascript = {"prettier"},
        lua = {"lua-format"},
        terraform = {"terraform_fmt"},
        ["markdown.notebook"] = {'injected'}
    }
})

c.formatters.autoimport = {command = "autoimport", args = {"$FILENAME"}, stdin = false}

c.formatters.golines = {prepend_args = {"--chain-split-dots", "--ignore-generated", "-m", "120"}}

c.formatters["lua-format"] = {args = {"--column-limit", "120"}}

c.formatters.injected = {
    options = {
        ignore_errors = false,
        lang_to_ft = {python = "python.notebook"},
        lang_to_ext = {markdown = 'md', python = 'py'},
        lang_to_formatters = {}
    }
}

vim.api.nvim_create_user_command("FormatDisable", function(args)
    if args.bang then
        vim.b.disable_autoformat = true
    else
        vim.g.disable_autoformat = true
    end
end, {desc = "Disable autoformat-on-save", bang = true})

vim.api.nvim_create_user_command("FormatEnable", function()
    vim.b.disable_autoformat = false
    vim.g.disable_autoformat = false
end, {desc = "Re-enable autoformat-on-save"})
