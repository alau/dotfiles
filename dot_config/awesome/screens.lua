awful.screen.connect_for_each_screen(function(s)
    -- Split wide screens into three regions
    if s.geometry.width == 5120 then
        s:fake_resize(1280, 0, 2560, s.geometry.height)
        screen.fake_add(0, 0, 1280, s.geometry.height)
        screen.fake_add(3840, 0, 1280, s.geometry.height)
    end
end)

