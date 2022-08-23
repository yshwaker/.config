local colorscheme = "nordfox"
-- local colorscheme = "rose-pine"

if colorscheme == "rose-pine" then
	local status_ok, rose = pcall(require, colorscheme)
	if status_ok then
		rose.setup {
			dark_variant = "moon",
		}
	end
end

if colorscheme == "nordfox" then
	local status_ok, nordfox = pcall(require, "nightfox")
	if status_ok then
		nordfox.setup {
			options = {
				dim_inactive = true,
				styles = {
					comments = "italic",
					keywords = "bold",
				},
			},
		}
	end
end

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
	vim.notify("colorscheme " .. colorscheme .. " not found!")
	return
end
