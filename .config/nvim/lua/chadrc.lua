local M = {}

M.base46 = {
  theme = "oxocarbon",
  theme_toggle = { "blossom_light", "oxocarbon" },
  changed_themes = {
    oxocarbon = {
      base_16 = {
        base0D = "#ff7eb6",
        base00 = "#161616",
        base01 = "#262626",
        base02 = "#393939",
        base03 = "#525252",
        base04 = "#dde1e6",
        base05 = "#f2f4f8",
        base06 = "#ffffff",
        base07 = "#08bdba",
        base08 = "#ffffff",
        base09 = "#78a9ff",
        base0A = "#33b1ff",
        base0B = "#33b1ff",
        base0C = "#ff7eb6",
        base0E = "#be95ff",
        base0F = "#82cfff",
      },
      base_30 = {
        green = "#ffffff",
      },
    },
  },
}

M.ui = {
  mason = {
    cmd = true,
    pkgs = {
      "tailwindcss-language-server",
      "typescript-language-server",
      "eslint_d",
      "prettierd",
    },
  },
}

return M
