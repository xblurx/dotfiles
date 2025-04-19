local function set_theme(name)
  local old_theme = name == "everforest_light" and "oxocarbon" or "everforest_light"

  require("nvchad.utils").replace_word('theme = "' .. old_theme, 'theme = "' .. name)
  require("base64").load_all_highlights()
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
      }
      return cfg
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

  {
    "hrsh7th/nvim-cmp",
    opts = function(_, conf)
      conf.completion = {
        autocomplete = false,
        completeopt = "menu,menuone,notebookSelector",
      }

      conf.window = {
        completion = { autocomplete = false },
      }

      conf.buffer = {
        completion = { autocomplete = false },
        window = {
          completion = { autocomplete = false },
        },
      }

      -- require("cmp").setup {
      --   completion = { autocomplete = false },
      --   window = {
      --     completion = { autocomplete = false },
      --     documentation = {
      --       border = border "CmpDocBorder",
      --       winhighlight = "Normal:CmpDoc",
      --     },
      --   },
      --   buffer = {
      --     completion = { autocomplete = false },
      --     window = {
      --       completion = { autocomplete = false },
      --       documentation = {
      --         border = border "CmpDocBorder",
      --         winhighlight = "Normal:CmpDoc",
      --       },
      --     },
      --   },
      -- }

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
    event = "VeryLazy",
    "f-person/auto-dark-mode.nvim",
    opts = {
      update_interval = 5000,
      set_dark_mode = function()
        -- require("base46").toggle_theme()
        set_theme "oxocarbon"
      end,
      set_light_mode = function()
        -- require("base46").toggle_theme()
        set_theme "everforest_light"
      end,
    },
  },

  {
    lazy = false,
    "superDross/ticket.vim",
  },
}
