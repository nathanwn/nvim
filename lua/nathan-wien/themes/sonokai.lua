return function()
  vim.g.sonokai_style = "default"
  vim.cmd([[colorscheme sonokai]])
  require("lualine").setup({
    options = {
      theme = "sonokai",
    },
  })
end
