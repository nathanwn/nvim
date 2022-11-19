vim.opt.background = "dark"
vim.cmd([[ colorscheme solarized8 ]])

require("lualine").setup({
  options = {
    theme = "solarized",
  },
})

-- vim.g.solarized_contrast = 'low'
