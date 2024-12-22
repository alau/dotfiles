require('flash').setup({
  labels = 'hutenosadimkwjvqzbxgpcrlf',
  modes = {
    char = {
      keys = { "f", "F" },
      jump_labels = true
    },
    search = {
      enabled = true
    }
  },
  label = {
    rainbow = {
      enabled = true
    }
  }
})

vim.keymap.set({ "n", "x", "o" }, "F", function()
  require("flash").jump()
end)

vim.keymap.set({ "n", "x", "o" }, "S", function()
  require("flash").treesitter()
end)

vim.keymap.set("o", "r", function()
  require("flash").remote()
end)

vim.keymap.set({ "o", "x" }, "R", function()
  require("flash").treesitter_search()
end)
