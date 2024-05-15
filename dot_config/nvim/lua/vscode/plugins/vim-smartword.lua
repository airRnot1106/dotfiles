return {
    {
        "kana/vim-smartword",
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            local keymap = vim.api.nvim_set_keymap
            keymap("n", "w", "<Plug>(smartword-w)", { noremap = false, silent = true })
            keymap("n", "b", "<Plug>(smartword-b)", { noremap = false, silent = true })
            keymap("n", "e", "<Plug>(smartword-e)", { noremap = false, silent = true })
        end,
    },
}
