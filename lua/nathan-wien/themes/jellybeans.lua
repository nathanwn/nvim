vim.opt.background = "dark"
vim.cmd([[ colorscheme jellybeans ]])

require("lualine").setup({
  options = {
    theme = "jellybeans",
  },
})
