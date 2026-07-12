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
map("n", "<leader>rn", function()
  vim.lsp.buf.rename()
end, { desc = "Rename Symbol" })
vim.keymap.set("n", "<leader>x", safe_close_buffer, { silent = true })
map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

map("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", {
  desc = "NvimTree toggle",
  silent = true,
})
map("n", "<leader>gb", ":Gitsigns preview_hunk<CR>", {
  desc = "Git toggle line blame",
  silent = true,
})
map("n", "<leader>gt", ":Gitsigns toggle_current_line_blame<CR>", {
  desc = "Git toggle line blame",
  silent = true,
})
