return {
  {
    "stevearc/conform.nvim",
    event = "BufWritePre",
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
    "nvim-treesitter/nvim-treesitter",
    opts = function()
      local cfg = require "nvchad.configs.treesitter"
      cfg.ensure_installed = {
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
        "python",
      }
      return cfg
    end,
  },

  {
    "mfussenegger/nvim-lint",
    event = { "BufReadPost", "BufWritePost", "InsertLeave" },
    config = function()
      local lint = require "lint"

      lint.linters_by_ft = {
        javascript = { "eslint_d" },
        typescript = { "eslint_d" },
        javascriptreact = { "eslint_d" },
        typescriptreact = { "eslint_d" },
      }

      local group = vim.api.nvim_create_augroup("nvim-lint", { clear = true })

      vim.api.nvim_create_autocmd({ "BufWritePost", "InsertLeave" }, {
        group = group,
        callback = function(args)
          if vim.bo[args.buf].buftype == "" then
            lint.try_lint()
          end
        end,
      })
    end,
  },

  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "mypy",
        "ruff",
        "pyright",
      },
    },
  },

  {
    "saecki/crates.nvim",
    ft = { "toml" },
    dependencies = { "hrsh7th/nvim-cmp" },
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

  {
    "hrsh7th/nvim-cmp",
    opts = function(_, conf)
      conf.completion = {
        autocomplete = false,
        completeopt = "menu,menuone,noinsert",
      }

      return conf
    end,
  },

  {
    "rust-lang/rust.vim",
    ft = "rust",
    init = function()
      vim.g.rustfmt_autosave = 1
    end,
  },

  {
    "f-person/auto-dark-mode.nvim",
    event = "VeryLazy",
    config = function()
      local function set_nvchad_theme(theme, background)
        local nvconfig = require "nvconfig"

        if nvconfig.base46.theme == theme then
          return
        end

        vim.o.background = background
        nvconfig.base46.theme = theme
        require("base46").load_all_highlights()
        vim.cmd "redrawstatus"
      end

      require("auto-dark-mode").setup {
        update_interval = 3000,
        fallback = "dark",
        set_dark_mode = function()
          set_nvchad_theme("oxocarbon", "dark")
        end,
        set_light_mode = function()
          set_nvchad_theme("everforest_light", "light")
        end,
      }

      require("auto-dark-mode").init()
    end,
  },

  {
    lazy = false,
    "superDross/ticket.vim",
  },
}
