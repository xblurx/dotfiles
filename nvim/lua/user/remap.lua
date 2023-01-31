-- .config/nvim/lua/@user

vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- ctrl+d|y and center with zz at the same time
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- space+p paste without saving deleted in buffer
vim.keymap.set("x", "<leader>p", "\"_dP")

-- allowing space+y to yank in system clipboard
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>Y", "\"+Y")
