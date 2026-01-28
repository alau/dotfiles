return {
    cmd = {"vscode-json-languageserver", "--stdio"},
    filetypes = {"json"},
    root_markers = {".git"},
    init_options = {provideFormatter = true}
}
