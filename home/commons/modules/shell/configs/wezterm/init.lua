local config = {}

local wezterm = require("wezterm")

if wezterm.config_builder then
	config = wezterm.config_builder()
end

config = require("configs.font").setup(config)
config = require("configs.theme").setup(config)
config = require("configs.options").setup(config)
config = require("configs.keybinds").setup(config)

return config
