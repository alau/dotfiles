local exepath = vim.fn.exepath
local fs = vim.fs

local function get_python_path(workspace)
    if vim.env.VIRTUAL_ENV then return fs.joinpath(vim.env.VIRTUAL_ENV, 'bin', 'python') end
    return exepath('python3') or exepath('python') or 'python'
end

return {
    cmd = {"pyright-langserver", "--stdio"},
    filetypes = {"python"},
    root_markers = {"pyproject.toml", "setup.py", "setup.cfg", "requirements.txt", "poetry.lock", "uv.lock", ".git"},
    single_file_support = true,
    settings = {
        python = {analysis = {autoSearchPaths = true, useLibraryCodeForTypes = true, diagnosticMode = 'openFilesOnly'}}
    },
    before_init = function(_, config)
        config.settings = config.settings or {}
        config.settings.python = config.settings.python or {}
        config.settings.python.pythonPath = get_python_path()
        vim.notify(string.format("Pyright using python: %s", config.settings.python.pythonPath), vim.log.levels.INFO)
    end,
    handlers = {
        ["textDocument/publishDiagnostics"] = vim.lsp.with(function(err, result, ctx, config)
            result.diagnostics = vim.tbl_filter(function(diagnostic)
                return diagnostic.code ~= "reportUndefinedVariable"
            end, result.diagnostics)
            vim.lsp.diagnostic.on_publish_diagnostics(err, result, ctx, config)
        end, {})
    }
}
