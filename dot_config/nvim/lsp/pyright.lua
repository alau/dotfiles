local util = require('lspconfig.util')
local path = util.path

local function get_python_path(workspace)
    if vim.env.VIRTUAL_ENV then return path.join(vim.env.VIRTUAL_ENV, 'bin', 'python') end
    for _, pattern in ipairs({'*', '.*'}) do
        local match = vim.fn.glob(path.join(workspace, pattern, 'pyvenv.cfg'))
        if match ~= '' then return path.join(path.dirname(match), 'bin', 'python') end
    end
    return exepath('python3') or exepath('python') or 'python'
end

return {
    cmd = {"pyright-langserver", "--stdio"},
    filetypes = {"python"},
    root_dir = util.root_pattern("pyproject.toml", "setup.py", "setup.cfg", "requirements.txt", "Pipfile", "poetry.lock"),
    before_init = function(_, config) config.settings.python.pythonPath = get_python_path(config.root_dir) end,
    handlers = {
        ["textDocument/publishDiagnostics"] = vim.lsp.with(function(err, result, ctx, config)
            result.diagnostics = vim.tbl_filter(function(diagnostic)
                return diagnostic.code ~= "reportUndefinedVariable"
            end, result.diagnostics)
            vim.lsp.diagnostic.on_publish_diagnostics(err, result, ctx, config)
        end, {})
    }
}
