require('snacks').setup({
    bigfile = {enabled = true},
    quickfile = {enabled = true},
    gitbrowse = {what = "permalink", notify = false}
})

vim.keymap.set("n", "<Leader>gf", function() Snacks.gitbrowse.open() end, {silent = true, noremap = true})
vim.keymap
    .set("n", "<Leader>gr", function() Snacks.gitbrowse.open({what = "repo"}) end, {silent = true, noremap = true})
