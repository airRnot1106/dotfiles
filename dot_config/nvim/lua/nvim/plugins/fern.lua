return {
    {
        "lambdalisue/fern.vim",
        dependencies = {
            "lambdalisue/nerdfont.vim",
            "lambdalisue/fern-renderer-nerdfont.vim",
            "lambdalisue/glyph-palette.vim",
            "lambdalisue/fern-git-status.vim",
            "lambdalisue/fern-hijack.vim",
        },
        event = { "BufEnter" },
        config = function()
            vim.g["fern#default_hidden"] = 1
            vim.g["fern#disable_default_mappings"] = 1
            vim.g["fern#renderer"] = "nerdfont"
            vim.g["fern#renderer#nerdfont#indent_markers"] = 1

            -- exclude
            local hide_dirs = "^\\%(.git\\|.history\\)$"
            local hide_files = "\\%(.DS_Store\\)\\+"
            vim.g["fern#default_exclude"] = hide_dirs .. "\\|" .. hide_files

            -- keymaps
            local augroup = vim.api.nvim_create_augroup
            local autocmd = vim.api.nvim_create_autocmd

            autocmd("FileType", {
                pattern = "fern",
                group = augroup("fern", {}),
                callback = function()
                    local keymap = vim.api.nvim_buf_set_keymap
                    local buffer = 0 -- current buffer
                    keymap(buffer, "n", "<C-C>", "<Plug>(fern-action-cancel)", {
                        noremap = true,
                        silent = true,
                    })
                    keymap(buffer, "n", "a", "<Plug>(fern-action-choice)", {
                        noremap = true,
                        silent = true,
                    })
                    keymap(buffer, "n", "C", "<Plug>(fern-action-clipboard-copy)", {
                        noremap = true,
                        silent = true,
                    })
                    keymap(buffer, "n", "M", "<Plug>(fern-action-clipboard-move)", {
                        noremap = true,
                        silent = true,
                    })
                    keymap(buffer, "n", "d", "<Plug>(fern-action-delete)", {
                        noremap = true,
                        silent = true,
                    })
                    keymap(buffer, "n", "P", "<Plug>(fern-action-clipboard-paste)", {
                        noremap = true,
                        silent = true,
                    })
                    keymap(buffer, "n", "h", "<Plug>(fern-action-collapse)", {
                        noremap = true,
                        silent = true,
                    })
                    keymap(buffer, "n", "c", "<Plug>(fern-action-copy)", {
                        noremap = true,
                        silent = true,
                    })
                    keymap(buffer, "n", "fe", "<Plug>(fern-action-exclude)", {
                        noremap = true,
                        silent = true,
                    })
                    keymap(buffer, "n", "?", "<Plug>(fern-action-help)", {
                        noremap = true,
                        silent = true,
                    })
                    keymap(buffer, "n", "!", "<Plug>(fern-action-hidden)", {
                        noremap = true,
                        silent = true,
                    })
                    keymap(buffer, "n", "fi", "<Plug>(fern-action-include)", {
                        noremap = true,
                        silent = true,
                    })
                    keymap(buffer, "n", "<BS>", "<Plug>(fern-action-leave)", {
                        noremap = true,
                        silent = true,
                    })
                    keymap(buffer, "n", "-", "<Plug>(fern-action-mark)", {
                        noremap = true,
                        silent = true,
                    })
                    keymap(buffer, "n", "m", "<Plug>(fern-action-move)", {
                        noremap = true,
                        silent = true,
                    })
                    keymap(buffer, "n", "K", "<Plug>(fern-action-new-dir)", {
                        noremap = true,
                        silent = true,
                    })
                    keymap(buffer, "n", "N", "<Plug>(fern-action-new-file)", {
                        noremap = true,
                        silent = true,
                    })
                    keymap(buffer, "n", "e", "<Plug>(fern-action-open)", {
                        noremap = true,
                        silent = true,
                    })
                    keymap(buffer, "n", "<CR>", "<Plug>(fern-action-open-or-expand)", {
                        noremap = true,
                        silent = true,
                    })
                    keymap(buffer, "n", "l", "<Plug>(fern-action-open-or-expand)", {
                        noremap = true,
                        silent = true,
                    })
                    keymap(buffer, "n", "o", "<Plug>(fern-action-open-or-enter)", {
                        noremap = true,
                        silent = true,
                    })
                    keymap(buffer, "n", "s", "<Plug>(fern-action-open:select)", {
                        noremap = true,
                        silent = true,
                    })
                    keymap(buffer, "n", "E", "<Plug>(fern-action-open:side)", {
                        noremap = true,
                        silent = true,
                    })
                    keymap(buffer, "n", "x", "<Plug>(fern-action-open:system)", {
                        noremap = true,
                        silent = true,
                    })
                    keymap(buffer, "n", "t", "<Plug>(fern-action-open:tabedit)", {
                        noremap = true,
                        silent = true,
                    })
                    keymap(buffer, "n", "<C-L>", "<Plug>(fern-action-redraw)", {
                        noremap = true,
                        silent = true,
                    })
                    keymap(buffer, "n", "<F5>", "<Plug>(fern-action-reload)", {
                        noremap = true,
                        silent = true,
                    })
                    keymap(buffer, "n", "R", "<Plug>(fern-action-rename)", {
                        noremap = true,
                        silent = true,
                    })
                    keymap(buffer, "n", ".", "<Plug>(fern-action-repeat)", {
                        noremap = true,
                        silent = true,
                    })
                    keymap(buffer, "n", "i", "<Plug>(fern-action-reveal)", {
                        noremap = true,
                        silent = true,
                    })
                    keymap(buffer, "n", "D", "<Plug>(fern-action-trash)", {
                        noremap = true,
                        silent = true,
                    })
                    keymap(buffer, "n", "y", "<Plug>(fern-action-yank)", {
                        noremap = true,
                        silent = true,
                    })
                    keymap(buffer, "n", "z", "<Plug>(fern-action-zoom)", {
                        noremap = true,
                        silent = true,
                    })
                    keymap(buffer, "n", "Z", "<Plug>(fern-action-zoom:reset)", {
                        noremap = true,
                        silent = true,
                    })
                end,
            })

            local glyph_palette = augroup("fern_glyph_palette", {})
            autocmd("FileType", {
                pattern = "fern",
                group = glyph_palette,
                callback = function()
                    vim.fn["glyph_palette#apply"]()
                end,
            })
            autocmd("FileType", {
                pattern = "nerdtree,startify",
                group = glyph_palette,
                callback = function()
                    vim.fn["glyph_palette#apply"]()
                end,
            })
        end,
    },
}
