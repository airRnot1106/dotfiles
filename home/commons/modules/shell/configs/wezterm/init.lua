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
	local screen = wezterm.gui.screens().active
	local width = screen.width * 0.85
	local height = screen.height * 0.85
	local tab, pane, window = mux.spawn_window(cmd or { width = 158, height = 56 })
	window:gui_window():set_position(0, 0)
	window:set_inner_size(width, height)
end)

return config
