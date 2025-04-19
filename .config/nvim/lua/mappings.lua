require "nvchad.mappings"

-- add yours here
local map = vim.keymap.set

local function safe_close_buffer()
  local bufnr = vim.api.nvim_get_current_buf()
  if vim.api.nvim_buf_is_valid(bufnr) then
    vim.cmd "bd!"
  end
end

map("n", "<leader>ss", ":SaveSession<Return>")
map("n", "<leader>os", ":OpenSession<Return>")
map("n", "<leader>ma", ":MasonInstallAll<Return>")

vim.keymap.set("n", "<leader>x", safe_close_buffer, { silent = true })
map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
