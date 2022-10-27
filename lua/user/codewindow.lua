local status_ok, map= pcall(require, "codewindow")
if not status_ok then
  return
end

map.setup()
