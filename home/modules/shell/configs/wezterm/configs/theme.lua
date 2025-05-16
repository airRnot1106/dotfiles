local M = {}
local wezterm = require("wezterm")
local theme = wezterm.plugin.require("https://github.com/neapsix/wezterm").moon

function M.setup(config)
	config.colors = theme.colors()
	config.window_frame = theme.window_frame()

	return config
end

return M
