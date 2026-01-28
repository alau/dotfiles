local l = require('lint')

l.linters_by_ft = {
    go = {'golangcilint'},
    javascript = {'eslint_d'},
    markdown = {"markdownlint"},
    ["markdown.notebook"] = {},
    python = {"ruff", "mypy"},
    sql = {"sqlfluff"},
    yaml = {"yamllint"},
    helm = {"yamllint"},
    ["yaml.actions"] = {"actionlint", "yamllint"},
    dockerfile = {"hadolint"},
    proto = {"buf_lint"},
    make = {"checkmake"}
}

if vim.env.VIRTUAL_ENV then
    local fs = vim.fs
    l.linters.mypy.cmd = fs.joinpath(vim.env.VIRTUAL_ENV, 'bin', 'mypy')
    l.linters.mypy.args = {
        '--follow-imports=silent', '--show-column-numbers', '--show-error-end', '--hide-error-context',
        '--no-color-output', '--no-error-summary', '--no-pretty', '--explicit-package-bases', '--python-executable',
        fs.joinpath(vim.env.VIRTUAL_ENV, 'bin', 'python')
    }
end

table.insert(l.linters.yamllint.args, 1,
             '-d "{extends: default, rules: {line-length: {max: 120}, truthy: disable, document-start: disable}}"')

vim.api.nvim_create_autocmd({"BufWritePost"}, {callback = function() l.try_lint() end})

vim.api.nvim_set_keymap('n', '<Leader>i', ':lua vim.diagnostic.open_float()<CR>', {})
