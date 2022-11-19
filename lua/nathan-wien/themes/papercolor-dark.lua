return function()
  vim.opt.background = "dark"
  vim.cmd([[ colorscheme PaperColor ]])

  -- See https://github.com/nvim-lualine/lualine.nvim#customizing-themes
  -- Original theme: https://github.com/nvim-lualine/lualine.nvim/blob/master/lua/lualine/themes/papercolor_light.lua
  local original_lualine_theme = require("lualine.themes.papercolor_dark")
  local custom_lualine_theme = require("nathan-wien.utils").deep_copy(
    original_lualine_theme
  )
  -- custom_lualine_theme.normal.a = original_lualine_theme.normal.b
  -- custom_lualine_theme.normal.b = original_lualine_theme.normal.a
  require("nathan-wien.plugins.lualine")(custom_lualine_theme)
end
