return {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-web-devicons", opt = true },
    event = { "BufNewFile", "BufRead" },
    options = { theme = "gruvbox-material" },
    config = function()
        local lualine = require "lualine"

        -- Config
        local config = {
            sections = {
                lualine_a = { "g:coc_git_blame", "g:coc_status", "bo:filetype" },
                lualine_b = { "g:coc_git_status", "branch", "diff", { "diagnostics", sources = { "coc" } } },
            },
        }

        lualine.setup(config)
    end,
}
