local M = {}
local wezterm = require("wezterm")

function M.setup(config)
	config.disable_default_key_bindings = true

	config.keys = {
		{ key = "q", mods = "CMD", action = wezterm.action.QuitApplication },
	}

	return config
end

return M
