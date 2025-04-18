-- Standard awesome library
awful = require("awful")
rules = require("awful.rules")
require("awful.autofocus")
-- Theme handling library
beautiful = require("beautiful")
-- Notification library
naughty = require("naughty")

function load_part(name)
    local_override = os.getenv("HOME") .. "/.awesome-" .. name .. ".local.lua"
    if awful.util.file_readable(local_override) then
        load_file(local_override)
    else
        load_file(awful.util.getdir("config") .. "/" .. name .. ".lua")
    end
end

function load_file(path)
    local success
    local result

    success, result = pcall(function() return dofile(path) end)
    if not success then
        naughty.notify({
            title = "Error while loading a configuration file",
            text = "When loading `" .. path .. "`, got the following error:\n" .. result,
            preset = naughty.config.presets.critical
        })
        return print("Error loading configuration file '" .. path .. "': " .. result)
    end

    return result
end

load_part("errors")

-- Configuration globals
settings = {}
widgets = {}
modkey = "Mod4"
settings.terminal = 'alacritty --command "tmux"'
settings.layouts = {awful.layout.suit.tile.right, awful.layout.suit.tile.bottom, awful.layout.suit.max}

-- Load the parts
load_part("appearance")
load_part("tags")
load_part("widgets")
load_part("bindings")
load_part("rules")
load_part("signals")
load_part("autostart")
