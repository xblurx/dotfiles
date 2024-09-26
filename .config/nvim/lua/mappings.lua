require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set
map("n", "<leader>ss", ":SaveSession<Return>")
map("n", "<leader>os", ":OpenSession<Return>")
map("n", "<leader>ma", ":MasonInstallAll<Return>")

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
