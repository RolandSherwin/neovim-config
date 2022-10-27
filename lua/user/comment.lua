local status_ok, comment = pcall(require, "Comment")
if not status_ok then
  print("comment plugin failed to load")
  return
end

comment.setup()
