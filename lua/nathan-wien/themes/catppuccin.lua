if not pcall(require, "catppuccin") then
  return
end

vim.g.catppuccin_flavour = "latte" -- latte, frappe, macchiato, mocha

require("catppuccin").setup({
  integrations = {
    cmp = true,
    gitsigns = true,
    lsp_trouble = true,
    nvimtree = true,
    symbols_outline = true,
    treesitter = true,
    which_key = true,
  },
  color_overrides = {
    latte = {
      red = "#af0000",
      maroon = "#d70000",
      green = "#008700",
      pink = "#d70087",
      mauve = "#8700af",
      blue = "#005faf",
      yellow = "#5f8700",
      sky = "#0087af",
      teal = "#005f87",
      peach = "#5f8700",
      rosewater = "#d75f00",
      flamingo = "#d75f00",
      sapphire = "#209FB5", -- default
      lavender = "#7287FD", -- default

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
    },
  },
  highlight_overrides = {
    latte = {
      Comment = { fg = "#878787" },
    },
  },
})

-- activate
vim.cmd.colorscheme("catppuccin")

-- lualine
require("lualine").setup(vim.tbl_deep_extend("force", require("nathan-wien.lualine"), {
  options = {
    theme = "catppuccin",
  },
}))
