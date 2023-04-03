local palette = require("nathan-wien.plugins.catppuccin.palette")

local config = function()
  vim.g.catppuccin_flavour = "latte" -- latte, frappe, macchiato, mocha
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
        HeirlineBranch = {
          fg = palette.base,
          bg = palette.mauve,
        },
        HeirlineFilenameActive = {
          fg = palette.blue,
          bg = palette.surface0,
        },
        HeirlineFilenameInactive = {
          fg = palette.overlay2,
          bg = palette.surface0,
        },
        HeirlineFiletype = {
          fg = palette.base,
          bg = palette.mauve,
        },
        HeirlineLocation = {
          fg = palette.base,
          bg = palette.blue,
        },
        HeirlineLsp = {
          fg = palette.base,
          bg = palette.lavender,
        },
        HeirlineViModeNormal = {
          fg = palette.base,
          bg = palette.blue,
        },
        HeirlineViModeInsert = {
          fg = palette.blue,
          bg = palette.base,
        },
        HeirlineViModeVisual = {
          fg = palette.base,
          bg = palette.sapphire,
        },
        HeirlineViModeReplace = {
          fg = palette.base,
          bg = palette.sky,
        },
        HeirlineViModeCommand = {
          fg = palette.base,
          bg = palette.yellow,
        },
        HeirlineViModeTerminal = {
          fg = palette.base,
          bg = palette.yellow,
        },
        HeirlineViModeInactive = {
          fg = palette.base,
          bg = palette.subtext0,
        },
        LspInlayHint = {
          fg = "#e8e8e8",
          bg = "#9999cc",
        },
        NvimTreeNormal = {
          bg = palette.mantle,
        },
        NvimTreeExecFile = {
          fg = palette.pink,
        },
      },
    },
  })

  -- activate
  vim.cmd.colorscheme("catppuccin")
end

return {
  "catppuccin/nvim",
  name = "catppuccin",
  config = config,
  version = "v1.0.0",
}
