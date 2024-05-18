local keymap = vim.api.nvim_set_keymap

-- leader
vim.g.mapleader = " "

-- mode
keymap("i", "jj", "<Esc>", { noremap = true, silent = true })

-- cursor
keymap("n", "k", "gk", { noremap = true, silent = true })
keymap("n", "j", "gj", { noremap = true, silent = true })
keymap("", "K", "10k", { noremap = true, silent = true })
keymap("", "J", "10j", { noremap = true, silent = true })

-- edit
keymap("", "x", '"_x', { noremap = true, silent = true })
keymap("", "X", '"_X', { noremap = true, silent = true })
keymap("", "s", '"_s', { noremap = true, silent = true })
keymap("", "S", '"_S', { noremap = true, silent = true })
keymap("n", "dd", '"_dd', { noremap = true, silent = true })
keymap("n", "D", '"_D', { noremap = true, silent = true })
keymap("n", "<C-d>", "dd", { noremap = true, silent = true })
keymap("x", "d", '"_d', { noremap = true, silent = true })
keymap("x", "D", '"_D', { noremap = true, silent = true })
keymap("x", "<C-d>", "d", { noremap = true, silent = true })

-- buffer
keymap("n", "<Leader>w", ":w<CR>", { noremap = true, silent = true })
keymap("n", "<Leader>[", ":bprev<CR>", { noremap = true, silent = true })
keymap("n", "<Leader>]", ":bnext<CR>", { noremap = true, silent = true })
keymap("n", "<Leader>d", ":bd<CR>", { noremap = true, silent = true })

-- filer
keymap("n", "<Leader>e", ":lua MiniFiles.open()<CR>", { noremap = true, silent = true })

-- telescope
keymap("n", "<Leader>ff", "<Cmd>Telescope find_files<CR>", { noremap = true, silent = true })
keymap("n", "<Leader>fg", "<Cmd>Telescope live_grep<CR>", { noremap = true, silent = true })
keymap("n", "<Leader>gs", "<Cmd>Telescope git_status<CR>", { noremap = true, silent = true })
keymap("n", "<Leader>gl", "<Cmd>Telescope git_commits<CR>", { noremap = true, silent = true })
keymap("n", "<Leader>fb", "<Cmd>Telescope buffers<CR>", { noremap = true, silent = true })
keymap("n", "<Leader>fo", "<Cmd>Telescope oldfiles<CR>", { noremap = true, silent = true })
keymap("n", "<Leader>fv", "<Cmd>Telescope vim_options<CR>", { noremap = true, silent = true })
keymap("n", "<Leadder>fk", "<Cmd>Telescope keymaps<CR>", { noremap = true, silent = true })
keymap("n", "<Leader>fr", "<Cmd>Telescope registers<CR>", { noremap = true, silent = true })
