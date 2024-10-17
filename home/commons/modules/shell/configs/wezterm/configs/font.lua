local M = {}
local wezterm = require("wezterm")

function M.setup(config)
	config.font = wezterm.font("HackGen Console NF")
	config.font_size = 16.0

	config.adjust_window_size_when_changing_font_size = false

	return config
end

return M
