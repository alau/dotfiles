luasnip = require("luasnip")

require("luasnip.loaders.from_snipmate").lazy_load()

luasnip.config.set_config({
	store_selection_keys = '<C-A>'
})

