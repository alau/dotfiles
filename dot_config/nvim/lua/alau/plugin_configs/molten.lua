vim.g.molten_image_provider = "image.nvim"

vim.g.molten_auto_open_output = false
vim.g.molten_virt_text_output = true
vim.g.molten_wrap_output = true
vim.g.molten_virt_lines_off_by_1 = true

vim.keymap.set("n", "<localleader>me", ":MoltenEvaluateOperator<CR>", {desc = "evaluate operator", silent = true})
vim.keymap.set("n", "<localleader>mo", ":noautocmd MoltenEnterOutput<CR>:noautocmd MoltenEnterOutput<CR>",
               {desc = "open output window", silent = true})
vim.keymap.set("n", "<localleader>mh", ":MoltenHideOutput<CR>", {desc = "close output window", silent = true})
vim.keymap.set("n", "<localleader>mc", ":MoltenInterrupt<CR>", {desc = "interrupt execution", silent = true})
vim.keymap.set("n", "<localleader>md", ":MoltenDelete<CR>", {desc = "clear cell output", silent = true})
vim.keymap.set("n", "<localleader>mD", ":MoltenDelete!<CR>", {desc = "clear all cell output", silent = true})
vim.keymap.set("n", "<localleader>mi", function()
    local venv = os.getenv("VIRTUAL_ENV")
    if venv ~= nil then
        venv = string.match(venv, "/.+/(.+)/.venv")
        vim.cmd(("MoltenInit %s"):format(venv))
    else
        vim.cmd("MoltenInit python3")
    end
end, {desc = "Initialize Molten for python3", silent = true})

require("quarto").setup({
    lspFeatures = {
        languages = {"python"},
        chunks = "all",
        diagnostics = {enabled = true, triggers = {"BufWritePost"}},
        completion = {enabled = true}
    },
    codeRunner = {enabled = true, default_method = "molten"}
})

local runner = require("quarto.runner")
vim.keymap.set("n", "<localleader>s", runner.run_cell, {desc = "run cell", silent = true})
vim.keymap.set("n", "<localleader>mr", runner.run_cell, {desc = "run cell", silent = true})
vim.keymap.set("n", "<localleader>ma", runner.run_above, {desc = "run cell and above", silent = true})
vim.keymap.set("n", "<localleader>mb", runner.run_below, {desc = "run cell and below", silent = true})
vim.keymap.set("n", "<localleader>mA", runner.run_all, {desc = "run all cells", silent = true})
vim.keymap.set("n", "<localleader>ml", runner.run_line, {desc = "run line", silent = true})
vim.keymap.set("v", "<localleader>m", runner.run_range, {desc = "run visual range", silent = true})

require("jupytext").setup({style = "markdown", output_extension = "md", force_ft = "markdown.notebook"})

