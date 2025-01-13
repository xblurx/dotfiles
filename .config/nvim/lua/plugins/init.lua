local cmp = require "cmp"

local function set_theme(name)
  local cur_theme = require("nvconfig").base46.theme
  require("nvchad.utils").replace_word(cur_theme, name)
  require("nvconfig").base46.theme = name
  require("base46").load_all_highlights()
end

return {
  {
    "stevearc/conform.nvim",
    event = "BufWritePre", -- uncomment for format on save
    opts = require "configs.conform",
  },

  {
    "nvchad/ui",
    config = function()
      require "nvchad"
    end,
  },

  {
    "nvchad/base46",
    lazy = true,
    build = function()
      require("base46").load_all_highlights()
    end,
  },

  {
    "windwp/nvim-ts-autotag",
    ft = {
      "javascript",
      "javascriptreact",
      "typescript",
      "typescriptreact",
    },
    config = function()
      require("nvim-ts-autotag").setup()
    end,
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  {
    "mrcjkb/rustaceanvim",
    version = "^5", -- Recommended
    lazy = false, -- This plugin is already lazy
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = function()
      opts = require "nvchad.configs.treesitter"
      opts.ensure_installed = {
        "vim",
        "lua",
        "css",
        "gitignore",
        "http",
        "rust",
        "sql",
        "javascript",
        "typescript",
        "tsx",
      }
      return opts
    end,
  },

  {
    "mfussenegger/nvim-lint",
    config = function()
      require("lint").linters_by_ft = {
        javascript = { "eslint_d" },
        typescript = { "eslint_d" },
        javascriptreact = { "eslint_d" },
        typescriptreact = { "eslint_d" },
      }

      vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
        callback = function()
          require("lint").try_lint()
        end,
      })
      vim.api.nvim_create_augroup("EslintFixAll", { clear = true })

      vim.api.nvim_create_autocmd("BufWritePre", {
        group = "EslintFixAll",
        command = "EslintFixAll",
      })
    end,
  },

  {
    "williamboman/mason.nvim",
    opts = {},
  },

  {
    "saecki/crates.nvim",
    ft = { "toml" },
    config = function()
      require("crates").setup {
        completion = {
          cmp = {
            enabled = true,
          },
        },
      }
      require("cmp").setup.buffer {
        sources = { { name = "crates" } },
      }
    end,
  },
  --
  -- {
  --   "hrsh7th/nvim-cmp",
  --   opts = function()
  --     local M = require "nvchad.configs.cmp"
  --     M.completion.completeopt = "menu,menuone,noselect"
  --     M.mapping["<CR>"] = cmp.mapping.confirm {
  --       behavior = cmp.ConfirmBehavior.Insert,
  --       select = false,
  --     }
  --     table.insert(M.sources, {name = "crates"})
  --     return M
  --   end,
  -- },

  {
    "rust-lang/rust.vim",
    ft = "rust",
    init = function()
      vim.g.rustfmt_autosave = 1
    end,
  },

  {
    event = "VeryLazy",
    "f-person/auto-dark-mode.nvim",
    opts = {
      update_interval = 1000,
      set_dark_mode = function()
        set_theme "oxocarbon"
      end,
      set_light_mode = function()
        set_theme "blossom_light"
      end,
    },
  },

  {
    lazy = false,
    "superDross/ticket.vim",
  },
}
