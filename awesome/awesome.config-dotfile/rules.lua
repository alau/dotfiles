awful.rules.rules = {
  {
    -- All clients will match this rule.
    rule = { },
    properties = {
      border_width = beautiful.border_width,
      border_color = beautiful.border_normal,
      focus = true,
      keys = clientkeys,
      maximized_vertical = false,
      maximized_horizontal = false,
      size_hints_honor = false,
      buttons = clientbuttons
    }
  },
  {
    rule = { class = "MPlayer" },
    properties = { floating = true }
  },
}
