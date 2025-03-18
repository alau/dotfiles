local luasnip = require("luasnip")

require("luasnip.loaders.from_vscode").lazy_load()

luasnip.config.set_config({store_selection_keys = '<C-A>'})

local i = luasnip.insert_node
local s = luasnip.snippet
local t = luasnip.text_node
luasnip.add_snippets("markdown", {
    -- code cell
    s({trig = "^%s*`", trigEngine = "pattern"},
      {t({"```python", ""}), i(1), t({"", "```"})})
})
