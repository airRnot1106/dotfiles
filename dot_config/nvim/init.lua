vim.loader.enable()

-- Disable default plugins
-- Disable TOhtml.
vim.g.loaded_2html_plugin = true

-- Disable archive file open and browse.
vim.g.loaded_gzip = true
vim.g.loaded_tar = true
vim.g.loaded_tarPlugin = true
vim.g.loaded_zip = true
vim.g.loaded_zipPlugin = true

-- Disable vimball.
vim.g.loaded_vimball = true
vim.g.loaded_vimballPlugin = true

-- Disable netrw plugins.
vim.g.loaded_netrw = true
vim.g.loaded_netrwPlugin = true
vim.g.loaded_netrwSettings = true
vim.g.loaded_netrwFileHandlers = true

-- Disable `GetLatestVimScript`.
vim.g.loaded_getscript = true
vim.g.loaded_getscriptPlugin = true

-- Disable other plugins
vim.g.loaded_man = true
vim.g.loaded_matchit = true
vim.g.loaded_matchparen = true
vim.g.loaded_shada_plugin = true
vim.g.loaded_spellfile_plugin = true
vim.g.loaded_tutor_mode_plugin = true
vim.g.did_install_default_menus = true
vim.g.did_install_syntax_menu = true
vim.g.skip_loading_mswin = true
vim.g.did_indent_on = true
vim.g.did_load_ftplugin = true
vim.g.loaded_rrhelper = true

if vim.g.vscode == 1 then
    require "vscode.init"
else
    require "nvim.init"
end
