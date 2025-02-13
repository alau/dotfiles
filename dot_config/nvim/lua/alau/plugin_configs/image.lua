require("image").setup({
    backend = 'ueberzug',
    processor = "magick_cli",
    integrations = {
        markdown = {enabled = true},
        neorg = {enabled = false},
        typst = {enabled = false},
        html = {enabled = false},
        css = {enabled = false}
    },
    max_width = 160,
    max_height = 22,
    max_height_window_percentage = math.huge,
    max_width_window_percentage = math.huge,
    window_overlap_clear_enabled = true,
    window_overlap_clear_ft_ignore = {"cmp_menu", "cmp_docs", ""}
})
