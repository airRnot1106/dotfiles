local M = {}
local wezterm = require("wezterm")

function M.setup(config)
	config.font = wezterm.font_with_fallback({
		{ family = "HackGen Console NF" },
		{ family = "Hack Nerd Font" },
	})
	config.font_size = 16.0
	config.adjust_window_size_when_changing_font_size = false
	config.harfbuzz_features = { "calt=0", "clig=0", "liga=0" }

	return config
end

return M
