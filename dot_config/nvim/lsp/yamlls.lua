return {
    cmd = {"yaml-language-server", "--stdio"},
    filetypes = {"yaml", "yaml.docker-compose", "yaml.ansible"},
    root_markers = {".git"},
    settings = {
        yaml = {
            schemas = {kubernetes = "*.yaml", ["http://json.schemastore.org/github-workflow"] = ".github/workflows/*"}
        }
    }
}
