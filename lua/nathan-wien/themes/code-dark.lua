vim.opt.background = "dark"
vim.cmd([[ colorscheme codedark ]])

require("lualine").setup({
  options = {
    theme = "codedark",
  },
})
