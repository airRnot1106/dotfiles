local config = {}

local wezterm = require("wezterm")

if wezterm.config_builder then
	config = wezterm.config_builder()
end

config = require("configs.font").setup(config)
config = require("configs.theme").setup(config)
config = require("configs.options").setup(config)
config = require("configs.keybinds").setup(config)

local mux = wezterm.mux
wezterm.on("gui-startup", function(cmd)
	local _, _, window = mux.spawn_window(cmd or {})
	window:gui_window():set_position(0, 0)
	window:gui_window():maximize()
end)

return config
