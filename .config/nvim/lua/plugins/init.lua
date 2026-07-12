return {
  {
    "stevearc/conform.nvim",
    event = "BufWritePre",
    cmd = { "ConformInfo" },
    opts = require "configs.conform",
  },

  {
    "windwp/nvim-ts-autotag",
    ft = {
      "html",
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
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require "configs.lspconfig"
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    cmd = {
      "TSInstall",
      "TSInstallSync",
      "TSUpdate",
      "TSUpdateSync",
      "TSUninstall",
      "TSBufEnable",
      "TSBufDisable",
      "TSModuleInfo",
    },
    event = { "BufReadPost", "BufNewFile" },
    opts = function()
      local cfg = require "nvchad.configs.treesitter"
      cfg.ensure_installed = {
        "vim",
        "lua",
        "html",
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
    "saecki/crates.nvim",
    ft = { "toml" },
    config = function()
      require("crates").setup {
        lsp = {
          enabled = true,
          actions = true,
          completion = true,
          hover = true,
        },

        completion = {
          crates = {
            enabled = true,
            max_results = 8,
            min_chars = 3,
          },
        },
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
    end,
  },

  {
    lazy = false,
    "superDross/ticket.vim",
  },
}
