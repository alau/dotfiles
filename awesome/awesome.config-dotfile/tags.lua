-- Define a tag table which holds screen tags for each screen.
local tags = {}
for screen = 1, screen.count() do
  tags[screen] = awful.tag(
    { 1, 2, 3, 4, 5, 6, 7, 8, 9 },
    screen,
    config.layouts[1]
  )
end

config.tags = tags
