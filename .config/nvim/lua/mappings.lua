require "nvchad.mappings"

-- add yours here
local map = vim.keymap.set

map("n", "<leader>ss", ":SaveSession<Return>")
map("n", "<leader>os", ":OpenSession<Return>")
map("n", "<leader>ma", ":MasonInstallAll<Return>")

map("n", "<leader>rn", function()
  vim.lsp.buf.rename()
end, { desc = "Rename Symbol" })

-- <leader>x uses NvChad's buffer-aware tabufline close mapping.

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

map("n", "<leader>gs", "<cmd>LazyGit<CR>", {
  desc = "LazyGit",
})

map("n", "<leader>d", vim.diagnostic.open_float, {
  desc = "Line diagnostics",
})

map("n", "<leader>cp", function()
  vim.fn.setreg("+", vim.fn.expand "%")
end, { desc = "Copy relative file path" })
