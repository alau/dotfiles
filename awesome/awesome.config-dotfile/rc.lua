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
load_part("appearance")

-- This is used later as the default terminal and editor to run.
terminal = "roxterm"
editor = os.getenv("EDITOR") or "vim"
editor_cmd = terminal .. " -e " .. editor

-- Default modkey.
-- Usually, Mod4 is the key with a logo between Control and Alt.
-- If you do not like this or do not have such a key,
-- I suggest you to remap Mod4 to another key using xmodmap or other tools.
-- However, you can use another modifier like Mod1, but it may interact with others.
modkey = "Mod4"

-- Table of layouts to cover with awful.layout.inc, order matters.
layouts =
{
    awful.layout.suit.tile.right,
    awful.layout.suit.tile.bottom,
    awful.layout.suit.max,
}
-- }}}

-- {{{ Tags
-- Define a tag table which hold all screen tags.
tags = {}
for s = 1, screen.count() do
    -- Each screen has its own tag table.
    tags[s] = awful.tag({ 1, 2, 3, 4, 5, 6, 7, 8, 9 }, s, layouts[1])
end
-- }}}

load_part("widgets")
load_part("bindings")
load_part("rules")
load_part("signals")

-- {{{ Autostarted applications
-- Applications to autostart
function run_once(command)
  firstspace = command:find(" ")
  if firstspace then
    application = command:sub(0, firstspace-1)
  end
  awful.util.spawn_with_shell("pgrep -u $USER -x " .. application .. " > /dev/null || (" .. command .. ")")
end

run_once("xscreensaver -no-splash")
-- }}}
