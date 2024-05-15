return {
    {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
        lazy = true,
    },
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.5",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-telescope/telescope-fzf-native.nvim",
            "nvim-telescope/telescope-frecency.nvim",
        },
        cmd = { "Telescope" },
        config = function()
            local telescope = require "telescope"
            telescope.setup {
                defaults = {
                    file_ignore_patterns = {
                        "^.git/",
                        "^.cache/",
                        "^Library/",
                        "Parallels",
                        "^Movies",
                        "^Music",
                        "^.history/",
                    },
                    vimgrep_arguments = {
                        "rg",
                        "--color=never",
                        "--no-heading",
                        "--with-filename",
                        "--line-number",
                        "--column",
                        "--smart-case",
                        "-uu",
                    },
                },
                extensions = {
                    fzf = {
                        fuzzy = true,
                        override_generic_sorter = true,
                        override_file_sorter = true,
                        case_mode = "smart_case",
                    },
                },
            }

            -- extensions
            telescope.load_extension "frecency"
        end,
    },
}
