return {
    {
        "vim-skk/skkeleton",
        dependencies = {
            "vim-denops/denops.vim",
            "nvim-lua/plenary.nvim",
            "delphinus/skkeleton_indicator.nvim",
        },
        event = { "InsertEnter" },
        config = function()
            if vim.fn.has "win32" == 1 then
                return
            end

            -- vim.api.nvim_set_keymap("i", "<C-h>", "<Plug>(skkeleton-toggle)", { noremap = true })
            -- vim.api.nvim_set_keymap("c", "<C-h>", "<Plug>(skkeleton-toggle)", { noremap = true })
            vim.api.nvim_exec(
                [[
                call skkeleton#config({
                    \  'globalJisyo': expand('~/.skk/SKK-JISYO.L'),
                    \  'globalDictionaries': [expand('~/.skk/SKK-JISYO.L'), expand('~/.skk/SKK-JISYO.geo'), expand('~/.skk/SKK-JISYO.jinmei'), expand('~/.skk/SKK-JISYO.propernoum'), expand('~/.skk/SKK-JISYO.station')],
                    \  'eggLikeNewline': v:true,
                    \ })
            ]],
                false
            )

            local Job = require "plenary.job"
            local karabiner_cli = "/Library/Application Support/org.pqrs/Karabiner-Elements/bin/karabiner_cli"
            function _G.set_karabiner(val)
                Job:new({
                    command = karabiner_cli,
                    args = {
                        "--set-variables",
                        ('{"neovim_in_insert_mode":%d}'):format(val),
                    },
                }):start()
            end

            function _G.set_karabiner_if_in_insert_mode()
                local val = vim.fn.mode():match "[icrR]" and 1 or 0
                _G.set_karabiner(val)
            end

            vim.cmd [[
              inoremap <F10> <Plug>(skkeleton-disable)
              inoremap <F13> <Plug>(skkeleton-enable)

              augroup skkeleton_karabiner_elements
                autocmd!
                autocmd InsertEnter,CmdlineEnter * call v:lua.set_karabiner(1)
                autocmd InsertLeave,CmdlineLeave,FocusLost * call v:lua.set_karabiner(0)
                autocmd FocusGained * call v:lua.set_karabiner_if_in_insert_mode()
              augroup END
            ]]

            require("skkeleton_indicator").setup {}
        end,
    },
}
