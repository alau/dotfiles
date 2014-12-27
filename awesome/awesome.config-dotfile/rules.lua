rules.rules = {
  {
    -- All clients will match this rule.
    rule = { },
    properties = {
      border_width = beautiful.border_width,
      border_color = beautiful.border_normal,
      focus = true,
      keys = config.clientkeys,
      maximized_vertical = false,
      maximized_horizontal = false,
      size_hints_honor = false,
      buttons = config.clientbuttons
    }
  },
  {
    rule = { class = "MPlayer" },
    properties = { floating = true }
  },
}

local local_additions = os.getenv("HOME") .. "/.awesome-additional-rules.local.lua"
if awful.util.file_readable(local_additions) then
  dofile(local_additions)
end
