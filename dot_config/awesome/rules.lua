rules.rules = {
    {
        -- All clients will match this rule.
        rule = {},
        properties = {
            border_width = beautiful.border_width,
            border_color = beautiful.border_normal,
            focus = true,
            keys = settings.clientkeys,
            maximized_vertical = false,
            maximized_horizontal = false,
            size_hints_honor = false,
            buttons = settings.clientbuttons
        },
        callback = function(c) c.screen = mouse.screen end
    }, {rule = {class = "MPlayer"}, properties = {floating = true}},
    {rule = {instance = "plugin-container"}, properties = {floating = true, focus = true}}
}

-- Close annoying SAML response opened in browser
client.connect_signal("property::name", function(c)
    if c.class == "org.mozilla.firefox" and string.match(c.name, "SAML Response for") then c:kill() end
end)

local local_additions = os.getenv("HOME") .. "/.awesome-additional-rules.local.lua"
if awful.util.file_readable(local_additions) then dofile(local_additions) end
