local M = {}

vim.g.catppuccin_flavour = "latte" -- latte, frappe, macchiato, mocha

local palette = {
  red = "#af0000",
  maroon = "#d70000",
  green = "#008700",
  pink = "#d70087",
  mauve = "#8700af",
  blue = "#005faf",
  yellow = "#808000",
  sky = "#0087af",
  teal = "#005f87",
  peach = "#883322",
  rosewater = "#d04a00",
  flamingo = "#8700d7",
  sapphire = "#09735c", -- default
  lavender = "#5566C0", -- default

  text = "#444444",
  subtext1 = "#555555",
  subtext0 = "#666666",
  overlay2 = "#777777",
  overlay1 = "#888888",
  overlay0 = "#999999",
  surface2 = "#aaaaaa",
  surface1 = "#bbbbbb",
  surface0 = "#cccccc",

  base = "#eeeeee",
  mantle = "#dddddd",
  crust = "#cccccc",
}

local config = function()
  require("catppuccin").setup({
    integrations = {
      cmp = true,
      dap = {
        enabled = true,
        enable_ui = true, -- nvim-dap-ui
      },
      gitsigns = true,
      lsp_trouble = true,
      nvimtree = true,
      symbols_outline = true,
      treesitter = true,
      which_key = true,
    },
    color_overrides = {
      latte = palette,
    },
    highlight_overrides = {
      latte = {
        Comment = {
          fg = palette.overlay1,
        },
        Conceal = {
          fg = palette.red,
        },
        DiagnosticInfo = {
          fg = palette.sapphire,
        },
        DiagnosticHint = {
          fg = palette.sapphire,
        },
        StatusLine = {
          bg = "#dfdfdf",
        },
        NvimTreeNormal = {
          bg = "#e8e8e8",
        },
        NvimTreeExecFile = {
          fg = palette.pink,
        },
        DapUIPlayPause = {
          fg = palette.green,
        },
        DapUIRestart = {
          fg = palette.green,
        },
        DapUIStepOut = {
          fg = palette.blue,
        },
        DapUIStepBack = {
          fg = palette.blue,
        },
        DapUIStepInto = {
          fg = palette.blue,
        },
        DapUIStepOver = {
          fg = palette.blue,
        },
      },
    },
  })

  -- activate
  vim.cmd.colorscheme("catppuccin")
end

M.palette = palette
M.config = config

return M
