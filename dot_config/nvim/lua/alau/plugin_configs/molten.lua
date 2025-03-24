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

vim.api.nvim_create_autocmd("BufWritePost", {
    pattern = "*.ipynb",
    callback = function()
        local notebook_path = vim.fn.expand("%:p")
        local notebook_dir = vim.fn.fnamemodify(notebook_path, ":h")
        local output_dir = notebook_dir .. "/raw"

        if vim.fn.isdirectory(output_dir) ~= 1 then
            vim.notify("Directory '" .. output_dir .. "' does not exist. Skipping jupytext conversion.",
                       vim.log.levels.WARN)
            return
        end

        local basename = vim.fn.fnamemodify(notebook_path, ":t:r")
        local py_path = output_dir .. "/" .. basename .. ".py"

        local cmd = string.format("jupytext --to py:percent '%s' --output '%s'", notebook_path, py_path)
        vim.fn.jobstart(cmd)
    end
})

local default_notebook = [[
  {
    "cells": [
     {
      "cell_type": "markdown",
      "metadata": {},
      "source": [
        ""
      ]
     }
    ],
    "metadata": {
     "kernelspec": {
      "display_name": "Python 3",
      "language": "python",
      "name": "python3"
     },
     "language_info": {
      "codemirror_mode": {
        "name": "ipython"
      },
      "file_extension": ".py",
      "mimetype": "text/x-python",
      "name": "python",
      "nbconvert_exporter": "python",
      "pygments_lexer": "ipython3"
     }
    },
    "nbformat": 4,
    "nbformat_minor": 5
  }
]]

local function new_notebook(path)
    local file = io.open(path, "w")
    if file then
        file:write(default_notebook)
        file:close()
        vim.cmd("edit " .. path)
    else
        print("Error: Could not open new notebook file for writing.")
    end
end

vim.api.nvim_create_user_command('NewNotebook', function(opts) new_notebook(opts.args) end,
                                 {nargs = 1, complete = 'file'})
