local status_ok, lua_line= pcall(require, "lualine")
if not status_ok then
  return
end

lua_line.setup()
