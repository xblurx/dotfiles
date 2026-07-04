local options = {
  formatters_by_ft = {
    lua = { "stylua" },

    javascript = { "oxlint", "oxfmt" },
    javascriptreact = { "oxlint", "oxfmt" },
    typescript = { "oxlint", "oxfmt" },
    typescriptreact = { "oxlint", "oxfmt" },

    json = { "oxfmt" },
    jsonc = { "oxfmt" },
    css = { "oxfmt" },
    scss = { "oxfmt" },
    html = { "oxfmt" },

    python = {
      "ruff_fix",
      "ruff_organize_imports",
      "ruff_format",
    },
  },

  format_on_save = {
    timeout_ms = 2500,
    lsp_format = "fallback",
  },
}

return options
