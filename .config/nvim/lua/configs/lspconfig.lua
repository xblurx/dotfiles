local nvlsp = require "nvchad.configs.lspconfig"
local lspconfig = require "lspconfig"

local function on_attach(client, bufnr)
  nvlsp.on_attach(client, bufnr)

  local opts = { buffer = bufnr, remap = false, silent = true }

  vim.keymap.set("n", "<leader>dv", vim.diagnostic.open_float, opts)
  vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
  vim.keymap.set("n", "<leader>vrn", vim.lsp.buf.rename, opts)
  vim.keymap.set("n", "<leader>vca", vim.lsp.buf.code_action, opts)
end

local capabilities = nvlsp.capabilities

local default_servers = { "html", "tailwindcss", "eslint" }

for _, server in ipairs(default_servers) do
  lspconfig[server].setup {
    on_attach = on_attach,
    on_init = nvlsp.on_init,
    capabilities = capabilities,
  }
end

lspconfig.ts_ls.setup {
  on_attach = on_attach,
  on_init = nvlsp.on_init,
  capabilities = capabilities,
}

lspconfig.rust_analyzer.setup {
  on_attach = on_attach,
  on_init = nvlsp.on_init,
  capabilities = capabilities,
  filetypes = { "rust" },
  root_dir = lspconfig.util.root_pattern "Cargo.toml",
  settings = {
    ["rust-analyzer"] = {
      cargo = {
        allFeatures = true,
      },
    },
  },
}

lspconfig.ruff.setup {
  on_attach = function(client, bufnr)
    client.server_capabilities.hoverProvider = false
    on_attach(client, bufnr)
  end,
  on_init = nvlsp.on_init,
  capabilities = capabilities,
  init_options = {
    settings = {
      logLevel = "info",
    },
  },
}
