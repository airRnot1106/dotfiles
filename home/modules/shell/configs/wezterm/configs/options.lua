local M = {}

function M.setup(config)
	config.use_ime = true
	config.macos_forward_to_ime_modifier_mask = "SHIFT|CTRL"

	config.window_decorations = "RESIZE"
	config.show_tabs_in_tab_bar = false
	config.hide_tab_bar_if_only_one_tab = true
	config.use_fancy_tab_bar = false
	config.show_new_tab_button_in_tab_bar = false
	config.show_close_tab_button_in_tabs = false

	return config
end

return M
