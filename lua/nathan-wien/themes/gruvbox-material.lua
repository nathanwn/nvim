return function()
  vim.opt.background = "dark"
  vim.g.gruvbox_material_background = "hard"
  vim.cmd([[colorscheme gruvbox-material ]])
  -- See https://github.com/nvim-lualine/lualine.nvim#customizing-themes
  -- Original theme: https://github.com/nvim-lualine/lualine.nvim/blob/master/lua/lualine/themes/papercolor_light.lua
  local original_lualine_theme = require("lualine.themes.gruvbox")
  local custom_lualine_theme = require("nathan-wien.utils").deep_copy(
    original_lualine_theme
  )
  custom_lualine_theme.normal.c = original_lualine_theme.normal.a
  custom_lualine_theme.normal.a = original_lualine_theme.normal.c
  require("nathan-wien.plugins.lualine")(custom_lualine_theme)
end
