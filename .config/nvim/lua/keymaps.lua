-- Custom keymaps (not related to LSPs or completion)

-- vim.g.mapleader = " "

local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Navigate with arrows between buffers & tree
keymap("n", "<M-Left>", "<C-w>h", opts)
keymap("n", "<M-Up>", "<C-w>k", opts)
keymap("n", "<M-Down>", "<C-w>j", opts)
keymap("n", "<M-Right>", "<C-w>l", opts)

vim.api.nvim_create_user_command("Gap", "Git add -p %", {})
