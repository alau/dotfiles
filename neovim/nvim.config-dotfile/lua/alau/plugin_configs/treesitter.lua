require('nvim-treesitter.configs').setup({
  ensure_installed = { "python", "lua", "json", "sql" },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  auto_install = false,

  highlight = {
    enable = true,
  },
})
