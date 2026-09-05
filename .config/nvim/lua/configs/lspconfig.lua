require("nvchad.configs.lspconfig").defaults()

vim.lsp.config("html", {
  cmd = { "vscode-html-language-server", "--stdio" },
  filetypes = { "html" },
  root_markers = { "package.json", ".git" },
})

vim.lsp.config("tailwindcss", {
  cmd = { "tailwindcss-language-server", "--stdio" },
  filetypes = {
    "html",
    "css",
    "scss",
    "javascript",
    "javascriptreact",
    "typescript",
    "typescriptreact",
  },
  root_markers = {
    "tailwind.config.js",
    "tailwind.config.cjs",
    "tailwind.config.mjs",
    "tailwind.config.ts",
    "postcss.config.js",
    "package.json",
    ".git",
  },
})

vim.lsp.config("ts_ls", {
  cmd = { "typescript-language-server", "--stdio" },
  filetypes = {
    "javascript",
    "javascriptreact",
    "typescript",
    "typescriptreact",
  },
  root_markers = {
    "tsconfig.json",
    "jsconfig.json",
    "package.json",
    ".git",
  },
})

vim.lsp.config("rust_analyzer", {
  cmd = { "rust-analyzer" },
  filetypes = { "rust" },
  root_markers = { "Cargo.toml", ".git" },
  settings = {
    ["rust-analyzer"] = {
      cargo = {
        allFeatures = true,
      },
    },
  },
})

vim.lsp.config("ty", {
  cmd = { "ty", "server" },
  filetypes = { "python" },
  root_markers = {
    "ty.toml",
    "pyproject.toml",
    "uv.lock",
    "setup.py",
    "setup.cfg",
    "requirements.txt",
    ".git",
  },
})

vim.lsp.config("ruff", {
  cmd = { "ruff", "server" },
  filetypes = { "python" },
  root_markers = {
    "pyproject.toml",
    "ruff.toml",
    ".ruff.toml",
    "uv.lock",
    ".git",
  },
  on_attach = function(client, _)
    client.server_capabilities.hoverProvider = false
  end,
  init_options = {
    settings = {
      logLevel = "info",
    },
  },
})

vim.lsp.enable {
  "html",
  "tailwindcss",
  "ts_ls",
  "oxlint",
  "rust_analyzer",
  "ty",
  "ruff",
}

vim.api.nvim_create_autocmd("CursorHold", {
  callback = function()
    vim.diagnostic.open_float(nil, {
      focus = false,
      scope = "cursor",
    })
  end,
})

vim.diagnostic.config {
  virtual_text = {
    prefix = "●",
    spacing = 2,
  },
  signs = true,
  underline = true,
  severity_sort = true,
  float = {
    border = "rounded",
    source = "always",
  },
}

vim.o.updatetime = 250

vim.api.nvim_create_autocmd("CursorHold", {
  callback = function()
    vim.diagnostic.open_float(nil, {
      focus = false,
      scope = "cursor",
    })
  end,
})
