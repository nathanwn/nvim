return function()
  vim.opt.background = "light"
  vim.cmd([[ colorscheme PaperColor ]])

  -- See https://github.com/nvim-lualine/lualine.nvim#customizing-themes
  -- Original theme: https://github.com/nvim-lualine/lualine.nvim/blob/master/lua/lualine/themes/papercolor_light.lua
  local original_lualine_theme = require("lualine.themes.papercolor_light")
  local custom_lualine_theme = require("nathan-wien.utils").deep_copy(
    original_lualine_theme
  )
  custom_lualine_theme.normal.c = original_lualine_theme.normal.a
  custom_lualine_theme.normal.a = original_lualine_theme.normal.c
  require("nathan-wien.plugins.lualine")(custom_lualine_theme)

  vim.cmd([[ hi pandocAtxHeader     guifg=#AF005F ctermfg=125 gui=bold term=bold ]])
  vim.cmd([[ hi pandocAtxHeaderMark guifg=#AF005F ctermfg=125 ]])
  vim.cmd([[ hi pandocAtxStart      guifg=#AF005F ctermfg=125 ]])
end
