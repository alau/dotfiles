local ipairs = ipairs

--- A layout that puts each client in a separate row.
module("awful.layout.suit.rows")

name = "rows"
function arrange(arguments)
  local area = arguments.workarea
  local clients = arguments.clients
  local row_height = area.height / #clients
  local row = 0
  for dummy, client in ipairs(clients) do
    client:geometry({
      x = area.x + client.border_width,
      y = area.y + row * row_height + client.border_width,
      width = area.width - client.border_width * 2,
      height = row_height - client.border_width * 2,
    })
    row = row + 1
  end
end
