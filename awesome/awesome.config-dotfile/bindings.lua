local globalkeys = awful.util.table.join(
  awful.key({ modkey,           }, "Left",   awful.tag.viewprev       ),
  awful.key({ modkey,           }, "Right",  awful.tag.viewnext       ),
  awful.key({ modkey,           }, "Escape", awful.tag.history.restore),

  -- Focus manipulation
  awful.key({ modkey,           }, "u",
    function()
      awful.client.focus.byidx( 1)
      if client.focus then client.focus:raise() end
    end
  ),
  awful.key({ modkey,           }, "e",
    function()
      awful.client.focus.byidx(-1)
      if client.focus then client.focus:raise() end
    end
  ),
  awful.key({ modkey,           }, "Tab",
    function()
      awful.client.focus.history.previous()
      if client.focus then
        client.focus:raise()
      end
    end
  ),

  -- Layout manipulation
  awful.key({ modkey,           }, "h",
    function()
      awful.client.swap.byidx(1)
    end
  ),
  awful.key({ modkey,           }, "t",
    function()
      awful.client.swap.byidx(-1)
    end
  ),
  awful.key({ modkey,           }, "space",
    function()
      awful.layout.inc(config.layouts, 1)
    end
  ),
  awful.key({ modkey, "Shift"   }, "space",
    function()
      awful.layout.inc(config.layouts, -1)
    end
  ),

  -- Standard program
  awful.key({ modkey,           }, "Return",
    function()
      awful.util.spawn(config.terminal)
    end
  ),
  awful.key({ modkey, "Shift"   }, "r", awesome.restart),
  awful.key({ modkey, "Shift"   }, ":", awesome.quit),
  awful.key({ modkey, "Control" }, "n", awful.client.restore),
  awful.key({ modkey, "Shift"   }, "l",
    function()
      awful.util.spawn("xscreensaver-command -lock")
    end
  ),
  awful.key({ modkey, "Shift"   }, "h",
    function()
      awful.util.spawn("beesu pm-hibernate")
    end
  ),

  -- Prompt
  awful.key({ modkey            }, "r",
    function()
      widgets.mypromptbox[mouse.screen]:run()
    end
  ),

  awful.key({ modkey            }, "x",
    function ()
      awful.prompt.run({ prompt = "Run Lua code: " },
      widgets.mypromptbox[mouse.screen].widget,
      awful.util.eval, nil,
      awful.util.getdir("cache") .. "/history_eval")
    end
  )
)

-- Compute the maximum number of digit we need, limited to 6
local keynumber = 0
for s = 1, screen.count() do
  keynumber = math.min(6, math.max(#config.tags[s], keynumber));
end

-- Bind all key numbers to tags.
-- Be careful: we use keycodes to make it works on any keyboard layout.
-- This should map on the top row of your keyboard, usually 1 to 6.
for i = 1, keynumber do
  globalkeys = awful.util.table.join(globalkeys,
    awful.key({ modkey }, "#" .. i + 9,
      function ()
        local screen = mouse.screen
        if config.tags[screen][i] then
          awful.tag.viewonly(config.tags[screen][i])
        end
      end
    ),
    awful.key({ modkey, "Shift" }, "#" .. i + 9,
      function ()
        if client.focus and config.tags[client.focus.screen][i] then
          awful.client.movetotag(config.tags[client.focus.screen][i])
        end
      end
    ),
    awful.key({ modkey, "Control", "Shift" }, "#" .. i + 9,
      function ()
        if client.focus and config.tags[client.focus.screen][i] then
          awful.client.toggletag(config.tags[client.focus.screen][i])
        end
      end
    )
  )
end

local toprow = {":", ",", ".", "p", "y", "/"}
for i = 1, keynumber do
  globalkeys = awful.util.table.join(globalkeys,
    awful.key({ modkey }, toprow[i],
      function ()
        local screen = mouse.screen
        if config.tags[screen][i] then
          awful.tag.viewtoggle(config.tags[screen][i])
        end
      end
    )
  )
end

local clientkeys = awful.util.table.join(
  awful.key({ modkey,           }, "f",
    function(c)
      c.fullscreen = not c.fullscreen
    end
  ),
  awful.key({ modkey,           }, "c",
    function(c)
      c:kill()
    end
  ),
  awful.key({ modkey,           }, "m",
    function(c)
      c:swap(awful.client.getmaster())
    end
  ),
  awful.key({ modkey,           }, "s", awful.client.movetoscreen)
)

local clientbuttons = awful.util.table.join(
  awful.button({ }, 1, function (c) client.focus = c; c:raise() end),
  awful.button({ modkey }, 1, awful.mouse.client.move),
  awful.button({ modkey }, 3, awful.mouse.client.resize)
)

root.keys(globalkeys)
config.clientkeys = clientkeys
config.clientbuttons = clientbuttons
