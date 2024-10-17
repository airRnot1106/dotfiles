local M = {}

function M.setup(config)
	config.use_ime = true

	config.window_decorations = "RESIZE"
	config.show_tabs_in_tab_bar = false
	config.hide_tab_bar_if_only_one_tab = true
	config.use_fancy_tab_bar = false
	config.show_new_tab_button_in_tab_bar = false
	config.show_close_tab_button_in_tabs = false

	local shell = os.getenv("SHELL") or "bash"
	config.default_prog = { shell, "-l", "-c", "zellij" }

	return config
end

return M
