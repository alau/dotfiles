return {
    cmd = {"helm_ls", "serve"},
    filetypes = {'helm', 'yaml'},
    root_markers = {'Chart.yaml', '.git'},
    settings = {yamlls = {path = "yaml-language-server"}}
}
