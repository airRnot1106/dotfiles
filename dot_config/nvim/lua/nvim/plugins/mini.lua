return {
    {
        "echasnovski/mini.comment",
        version = false,
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            require("mini.comment").setup {
                mappings = {
                    comment = "<Leader>/",
                    comment_line = "<Leader>/",
                    comment_visual = "<Leader>/",
                    textobject = "<Leader>/",
                },
            }
        end,
    },
    {
        "echasnovski/mini.indentscope",
        version = false,
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            require("mini.indentscope").setup()
        end,
    },
    {
        "echasnovski/mini.surround",
        version = false,
        event = { "InsertEnter" },
        config = function()
            require("mini.surround").setup()
        end,
    },
}
