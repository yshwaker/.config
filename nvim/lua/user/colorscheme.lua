local colorscheme = "everforest"
-- local colorscheme = "rose-pine"

if colorscheme == "rose-pine" then
  local status_ok, rose = pcall(require, colorscheme)
  if status_ok then
    rose.setup({
      dark_variant = 'moon'
    })
  end
end

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  vim.notify("colorscheme " .. colorscheme .. " not found!")
  return
end
