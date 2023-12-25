return {
    {
        "goolord/alpha-nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        event = { "VimEnter" },
        config = function()
            require("alpha").setup(require("alpha.themes.startify").config)
        end,
    },
}
