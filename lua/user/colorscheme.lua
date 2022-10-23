-- use protected call to check if onedark pluging is callable. 
-- https://github.com/navarasu/onedark.nvim
local colorscheme = "onedark"
local status_ok, scheme = pcall(require, colorscheme)
if not status_ok then
	vim.notify(colorscheme.." not found!")
	return
end
if colorscheme == "onedark" then
  scheme.setup {
    style = "cool",
    transparent = true,
  }
end
-- todo, should I use return statement here?
scheme.load()
