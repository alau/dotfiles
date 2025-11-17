local util = require('lspconfig.util')

return {
    cmd = {"lua-language-server"},
    filetypes = {"lua"},
    root_dir = util.root_pattern(".luarc.json", ".luacheckrc", "stylua.toml", ".stylua.toml", "selene.toml",
                                 ".selene.toml", ".git"),
    settings = {Lua = {diagnostics = {globals = {"vim", "exepath"}}, workspace = {checkThirdParty = false}}}
}
