local util = require('lspconfig.util')

return {
    cmd = {"helm_ls", "-l", "/tmp/helm-ls.log"},
    filetypes = {'helm', 'yaml'},
    root_dir = util.root_pattern('Chart.yaml', '.git')
}
