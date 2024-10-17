local config = {}

local wezterm = require("wezterm")

if wezterm.config_builder then
	config = wezterm.config_builder()
end

config = require("configs.font").setup(config)

return config
