return function()
  vim.cmd([[colorscheme neon]])
  require("lualine").setup({
    options = {
      theme = "neon",
    },
  })
end
