local theme_name = os.getenv("GLOBAL_THEME") or "bsol"

local theme =
  require(string.format("nathan-wien.plugins.catppuccin.themes.%s", theme_name))

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
      latte = theme.palette,
    },
    highlight_overrides = {
      latte = theme.override,
    },
  })

  -- activate
  vim.cmd.colorscheme("catppuccin")
end

return {
  "catppuccin/nvim",
  name = "catppuccin",
  config = config,
  version = "v1.1.1",
}
