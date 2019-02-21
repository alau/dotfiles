wibox = require("wibox")
vicious = require("vicious")

-- Clock
local mytextclock = wibox.widget.textclock()

-- Network usage
local netwidget = wibox.widget.textbox()
vicious.register(
  netwidget,
  vicious.widgets.net,
  function (widget, args)
    -- Sum kbit/s across all non-lo interfaces
    local up = 0
    local down = 0
    local iface
    for name, value in pairs(args) do
      iface, direction = name:match("^{(%S+) ([^_]+)_kb}$")
      if iface and direction and iface ~= "lo" then
        if direction == "up" then
          up = up + value
        elseif direction == "down" then
          down = down + value
        end
      end
    end
    return '<span color="#CC9393">' .. (down * 8) .. '↓</span> ' ..
      '<span color="#7F9F7F">' .. (up * 8) .. '↑</span>'
  end,
  3
)

-- CPU usage
cpuwidget = wibox.widget.graph()
cpuwidget:set_width(50)
cpuwidget:set_background_color("#494B4F")
cpuwidget:set_color({
  type = "linear",
  from = {0, 0},
  to = {10, 0},
  stops = {{0, "#FF5656"}, {0.5, "#88A175"}, {1, "#AECF96"}}
})
vicious.register(cpuwidget, vicious.widgets.cpu, "$1")

-- Memory usage
memwidget = wibox.widget.graph()
memwidget:set_width(50)
memwidget:set_background_color("#494B4F")
memwidget:set_color({
  type = "linear",
  from = {0, 0},
  to = {10, 0},
  stops = {{0, "#BEE3E8"}, {0.5, "#89DDE8"}, {1, "#3C97A3"}}
})
vicious.register(memwidget, vicious.widgets.mem, "$1")


-- Battery usage
batwidget = awful.widget.progressbar()
batwidget:set_width(8)
batwidget:set_height(14)
batwidget:set_vertical(true)
batwidget:set_background_color("#000000")
batwidget:set_border_color(nil)
batwidget:set_color("#00bfff")
vicious.register(batwidget, vicious.widgets.bat, "$2", 120, "BAT0")

-- Systray
local mysystray = wibox.widget.systray()

-- Create a wibox for each screen and add it
local mywibox = {}
local mypromptbox = {}
local mylayoutbox = {}
local mytaglist = {}
mytaglist.buttons = awful.util.table.join(
  awful.button({ }, 1, awful.tag.viewonly),
  awful.button({ modkey }, 1, awful.client.movetotag),
  awful.button({ }, 3, awful.tag.viewtoggle),
  awful.button({ modkey }, 3, awful.client.toggletag),
  awful.button({ }, 4, awful.tag.viewnext),
  awful.button({ }, 5, awful.tag.viewprev)
)

local mytasklist = {}
for s = 1, screen.count() do
  -- Create a promptbox for each screen
  mypromptbox[s] = awful.widget.prompt({ layout = wibox.layout.align.horizontal })
  -- Create an imagebox widget which will contains an icon indicating which layout we're using.
  -- We need one layoutbox per screen.
  mylayoutbox[s] = awful.widget.layoutbox(s)
  mylayoutbox[s]:buttons(awful.util.table.join(
    awful.button({ }, 1, function () awful.layout.inc(settings.layouts, 1) end),
    awful.button({ }, 3, function () awful.layout.inc(settings.layouts, -1) end),
    awful.button({ }, 4, function () awful.layout.inc(settings.layouts, 1) end),
    awful.button({ }, 5, function () awful.layout.inc(settings.layouts, -1) end)
  ))
  -- Create a taglist widget
  mytaglist[s] = awful.widget.taglist(s, awful.widget.taglist.filter.all, mytaglist.buttons)

  -- Create a tasklist widget
  mytasklist[s] = awful.widget.tasklist(s, awful.widget.tasklist.filter.currenttags, mytasklist.buttons)

  -- Create the wibox
  mywibox[s] = awful.wibar({ position = "top", screen = s })

  local left_layout = wibox.layout.fixed.horizontal()
  left_layout:add(mytaglist[s])
  left_layout:add(mypromptbox[s])

  local right_layout = wibox.layout.fixed.horizontal()
  right_layout:add(netwidget)
  right_layout:add(cpuwidget)
  right_layout:add(memwidget)
  right_layout:add(batwidget)
  right_layout:add(mytextclock)
  right_layout:add(mylayoutbox[s])
  if s == 1 then right_layout:add(mysystray) end

  local layout = wibox.layout.align.horizontal()
  layout:set_left(left_layout)
  layout:set_middle(mytasklist[s])
  layout:set_right(right_layout)

  mywibox[s]:set_widget(layout)
end

widgets.mypromptbox = mypromptbox
