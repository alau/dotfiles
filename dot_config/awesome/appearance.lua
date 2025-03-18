local gears = require("gears")

beautiful.init("/usr/share/awesome/themes/zenburn/theme.lua")

if beautiful.wallpaper then for s = 1, screen.count() do gears.wallpaper.maximized(beautiful.wallpaper, s, true) end end
