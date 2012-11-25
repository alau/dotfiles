-- Standard awesome library
require("awful")
require("awful.autofocus")
require("awful.rules")
-- Theme handling library
require("beautiful")
-- Notification library
require("naughty")

function load_part(name)
  local success
  local result

  success, result = pcall(
    function(path) return dofile(path) end,
    awful.util.getdir("config") .. "/" .. name .. ".lua"
  )
  if not success then
    naughty.notify({
      title = "Error while loading an configuration file",
      text = "When loading `" .. name ..  "`, got the following error:\n" .. result,
      preset = naughty.config.presets.critical
    })
    return print("Error loading configuration file '" .. name .. "': " .. result)
  end

  return result
end

load_part("errors")

config = {}
widgets = {}

load_part("appearance")
config.terminal = "roxterm"
modkey = "Mod4"

config.layouts = {
  awful.layout.suit.tile.right,
  awful.layout.suit.tile.bottom,
  awful.layout.suit.max,
}

load_part("tags")
load_part("widgets")
load_part("bindings")
load_part("rules")
load_part("signals")
load_part("autostart")
