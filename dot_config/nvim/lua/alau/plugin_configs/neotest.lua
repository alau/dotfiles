require("neotest").setup({
    adapters = {require("neotest-python"), require("neotest-golang")({testify_enabled = true}), require("neotest-jest")},
    output = {open_on_run = false},
    output_panel = {enabled = true},
    icons = {
        expanded = "",
        child_prefix = "",
        child_indent = "",
        final_child_prefix = "",
        non_collapsible = "",
        collapsed = "",

        passed = "",
        running = "",
        failed = "",
        unknown = ""
    }
})

vim.keymap.set("n", "<Leader>rt", ':lua require("neotest").run.run()<CR>')
vim.keymap.set("n", "<Leader>ra", ':lua require("neotest").run.stop()<CR>')
vim.keymap.set("n", "<Leader>rd", ':lua require("neotest").run.run({strategy = "dap"})<CR>')
vim.keymap.set("n", "<Leader>rr", ':lua require("neotest").run.run_last()<CR>')
vim.keymap.set("n", "<Leader>rf", ':lua require("neotest").run.run(vim.fn.expand("%"))<CR>')
vim.keymap.set("n", "<Leader>rs", ':lua require("neotest").summary.toggle()<CR>')
vim.keymap.set("n", "<Leader>ro", ':lua require("neotest").output.open({ enter = true })<CR>')
vim.keymap.set("n", "<Leader>rp", ':lua require("neotest").output_panel.open()<CR>')

