require("neotest").setup({
  adapters = {
    require("neotest-python")
  },
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
  },
})

vim.keymap.set("n", "<Leader>rt", ':lua require("neotest").run.run()<CR>', { silent = true })
vim.keymap.set("n", "<Leader>rd", ':lua require("neotest").run.run({strategy = "dap"})<CR>', { silent = true })
vim.keymap.set("n", "<Leader>rr", ':lua require("neotest").run.run_last()<CR>', { silent = true })
