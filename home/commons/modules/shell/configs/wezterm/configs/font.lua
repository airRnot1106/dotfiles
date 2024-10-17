local M = {}
local wezterm = require("wezterm")

function M.setup(config)
	config.font = wezterm.font("HackGen Console NF")

	config.font_size = 16.0

	return config
end

return M
