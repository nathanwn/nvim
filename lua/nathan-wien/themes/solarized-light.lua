vim.opt.background = "light"
vim.cmd([[ colorscheme solarized8 ]])

require("lualine").setup({
  options = {
    theme = "solarized",
  },
})
