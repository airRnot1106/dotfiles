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
        "echasnovski/mini.files",
        version = false,
        config = function()
            local function split(str, ts)
                if ts == nil then
                    return {}
                end

                local t = {}
                local i = 1
                for s in string.gmatch(str, "([^" .. ts .. "]+)") do
                    t[i] = s
                    i = i + 1
                end

                return t
            end
            local function table_contains(table, element)
                for _, value in pairs(table) do
                    if value == element then
                        return true
                    end
                end
                return false
            end
            require("mini.files").setup {
                content = {
                    filter = function(file)
                        local ignored_files = {
                            ".DS_Store",
                        }

                        local t = split(file.path, "/")
                        local file_name = t[#t]

                        return not table_contains(ignored_files, file_name)
                    end,
                },
                mappings = {
                    go_in_plus = "<CR>",
                },
            }
        end,
    },
    {
        "echasnovski/mini.jump2d",
        version = false,
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            require("mini.jump2d").setup()
        end,
    },
}
