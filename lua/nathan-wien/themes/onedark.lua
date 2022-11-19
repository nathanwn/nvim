return function()
  vim.cmd([[ colorscheme onedark ]])
  require("lualine").setup({
    options = {
      theme = "onedark",
    },
  })
  local original_lualine_theme = require("lualine.themes.onedark")
  local custom_lualine_theme = require("nathan-wien.utils").deep_copy(
    original_lualine_theme
  )
  custom_lualine_theme.normal.b = original_lualine_theme.normal.c
  custom_lualine_theme.normal.c = original_lualine_theme.normal.b
  require("nathan-wien.plugins.lualine")(custom_lualine_theme)
end
