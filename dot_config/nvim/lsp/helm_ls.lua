return {
    cmd = {"helm_ls", "-l", "/tmp/helm-ls.log"},
    filetypes = {'helm', 'yaml'},
    root_markers = {'Chart.yaml', '.git'}
}
