if not pcall(require, "catppuccin") then
  return
end

vim.g.catppuccin_flavour = "frappe" -- latte, frappe, macchiato, mocha

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
})

-- activate
vim.cmd([[colorscheme catppuccin]])

-- lualine
require("lualine").setup({
  options = {
    theme = "catppuccin",
  },
  sections = require("nathan-wien.lualine").sections,
})
