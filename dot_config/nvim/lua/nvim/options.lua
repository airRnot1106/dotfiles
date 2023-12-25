local set = vim.opt

local options = {
    -- file
    fileencoding = "utf-8",
    swapfile = false,
    helplang = "ja",
    hidden = true,
    cursorline = true,

    -- menu & command
    wildmenu = true,
    cmdheight = 1,
    laststatus = 2,
    showcmd = true,

    -- indent
    shiftwidth = 2,
    tabstop = 2,
    expandtab = true,
    autoindent = true,

    -- display
    number = true,
    wrap = true,
    showtabline = 2,
    showmatch = true,
    relativenumber = true,
    guifont = "Hack Nerd font",
    scrolloff = 12,

    -- editor
    whichwrap = "b,s,h,l,[,],<,>,~",
    updatetime = 500,
    virtualedit = "block",
}

-- clipboard
set.clipboard:append { "unnamedplus" }

for k, v in pairs(options) do
    set[k] = v
end
