return {
    "kazhala/close-buffers.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        require("close_buffers").setup {
            preserve_window_layout = { "this" },
            next_buffer_cmd = function(windows)
                require("bufferline").cycle(1)
                local bufnr = vim.api.nvim_get_current_buf()

                for _, window in ipairs(windows) do
                    vim.api.nvim_win_set_buf(window, bufnr)
                end
            end,
        }

        vim.api.nvim_set_keymap(
            "n",
            "<leader>th",
            [[<CMD>lua require('close_buffers').delete({type = 'hidden'})<CR>]],
            { noremap = true, silent = true }
        )
        vim.api.nvim_set_keymap(
            "n",
            "<leader>tu",
            [[<CMD>lua require('close_buffers').delete({type = 'nameless'})<CR>]],
            { noremap = true, silent = true }
        )
        vim.api.nvim_set_keymap(
            "n",
            "<leader>tc",
            [[<CMD>lua require('close_buffers').delete({type = 'this'})<CR>]],
            { noremap = true, silent = true }
        )
        vim.api.nvim_set_keymap(
            "n",
            "<leader>to",
            [[<CMD>lua require('close_buffers').wipe({type = 'other'})<CR>]],
            { noremap = true, silent = true }
        )
    end,
}
