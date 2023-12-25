local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

autocmd("TextYankPost", {
    pattern = "*",
    group = augroup("highlight_yank", {}),
    callback = function()
        vim.highlight.on_yank { higroup = "IncSearch", timeout = 200 }
    end,
})
