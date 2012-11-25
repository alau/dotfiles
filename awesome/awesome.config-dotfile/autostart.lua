function run_once(command)
  firstspace = command:find(" ")
  if firstspace then
    application = command:sub(0, firstspace-1)
  end
  awful.util.spawn_with_shell("pgrep -u $USER -x " .. application .. " > /dev/null || (" .. command .. ")")
end

run_once("xscreensaver -no-splash")
