local keymap = vim.api.nvim_set_keymap

-- leader
vim.g.mapleader = " "

-- mode
keymap("i", "jj", "<Esc>", { noremap = true, silent = true })

-- cursor
keymap("n", "k", "gk", { noremap = true, silent = true })
keymap("n", "j", "gj", { noremap = true, silent = true })
keymap("x", "k", "gk", { noremap = true, silent = true })
keymap("x", "j", "gj", { noremap = true, silent = true })
keymap("n", "K", "10k", { noremap = true, silent = true })
keymap("n", "J", "10j", { noremap = true, silent = true })
keymap("x", "K", "10k", { noremap = true, silent = true })
keymap("x", "J", "10j", { noremap = true, silent = true })

-- edit
keymap("n", "x", '"_x', { noremap = true, silent = true })
keymap("n", "X", '"_X', { noremap = true, silent = true })
keymap("n", "s", "<NOP>", { noremap = true, silent = true })
keymap("n", "ss", '"_s', { noremap = true, silent = true })
keymap("n", "S", '"_S', { noremap = true, silent = true })
keymap("n", "c", '"_c', { noremap = true, silent = true })
keymap("n", "C", '"_C', { noremap = true, silent = true })
keymap("n", "d", '"_d', { noremap = true, silent = true })
keymap("n", "D", '"_D', { noremap = true, silent = true })
keymap("n", "<C-d>", "dd", { noremap = true, silent = true })
keymap("x", "x", '"_x', { noremap = true, silent = true })
keymap("x", "X", '"_X', { noremap = true, silent = true })
keymap("x", "ss", '"_s', { noremap = true, silent = true })
keymap("x", "S", '"_S', { noremap = true, silent = true })
keymap("x", "c", '"_c', { noremap = true, silent = true })
keymap("x", "C", '"_C', { noremap = true, silent = true })
keymap("x", "d", '"_d', { noremap = true, silent = true })
keymap("x", "D", '"_D', { noremap = true, silent = true })
keymap("x", "<C-d>", "d", { noremap = true, silent = true })
keymap("n", "u", "<Cmd>call VSCodeCall('undo')<CR>", { noremap = true, silent = true })
keymap("n", "<C-r>", "<Cmd>call VSCodeCall('redo')<CR>", { noremap = true, silent = true })
keymap("n", "<Leader>.", "<Cmd>call VSCodeNotify('editor.action.quickFix')<CR>", { noremap = true, silent = true })
keymap("n", "<C-k>", "<Cmd>call VSCodeCall('editor.action.showHover')<CR>", { noremap = true, silent = true })

-- buffer
keymap("n", "<Leader>w", "<Cmd>call VSCodeCall('workbench.action.files.save')<CR>", { noremap = true, silent = true })

-- filer
keymap(
    "n",
    "<Leader>e",
    "<Cmd>call VSCodeNotify('workbench.action.toggleSidebarVisibility')<CR>",
    { noremap = true, silent = true }
)
keymap(
    "n",
    "<Leader>o",
    "<Cmd>call VSCodeNotify('workbench.files.action.focusFilesExplorer')<CR>",
    { noremap = true, silent = true }
)

-- jumpy
keymap("n", "<Leader><Leader>w", "<Cmd>call VSCodeNotify('jumpy2.toggle')<CR>", { noremap = true, silent = true })
