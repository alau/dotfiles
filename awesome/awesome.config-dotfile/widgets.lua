wibox = require("wibox")
vicious = require("vicious")

-- Clock
local mytextclock = awful.widget.textclock()

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
    return '<span color="#CC9393">' .. (down * 8) .. '</span> ' ..
      '<span color="#7F9F7F">' .. (up * 8) .. '</span>'
  end,
  3
)

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
  mywibox[s] = awful.wibox({ position = "top", screen = s })

  local left_layout = wibox.layout.fixed.horizontal()
  left_layout:add(mytaglist[s])
  left_layout:add(mypromptbox[s])

  local right_layout = wibox.layout.fixed.horizontal()
  right_layout:add(netwidget)
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
