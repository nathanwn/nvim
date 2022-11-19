vim.opt.background = "light"
vim.cmd.colorscheme("PaperColor")

vim.api.nvim_set_hl(0, "WinSeparator", {
  bg = nil,
})
vim.api.nvim_set_hl(0, "NvimTreeWinSeparator", {
  bg = nil,
})
vim.api.nvim_set_hl(0, "Conceal", {
  fg = "#0000FF",
})

-- lualine
-- See https://github.com/nvim-lualine/lualine.nvim#customizing-themes
-- Original theme: https://github.com/nvim-lualine/lualine.nvim/blob/master/lua/lualine/themes/papercolor_light.lua
local original_lualine_theme = require("lualine.themes.papercolor_light")
local custom_lualine_theme = vim.deepcopy(original_lualine_theme)
custom_lualine_theme.normal.c = original_lualine_theme.normal.a
custom_lualine_theme.normal.a = original_lualine_theme.normal.c
custom_lualine_theme.normal.b = original_lualine_theme.normal.a

require("lualine").setup({
  options = {
    theme = custom_lualine_theme,
  },
  sections = require("nathan-wien.lualine").sections,
})

local lualine_config = require("nathan-wien.lualine")
lualine_config.options.theme = custom_lualine_theme
require("lualine").setup(lualine_config)

-- vim.cmd([[ hi WinSeparator guibg=None ]])
-- vim.cmd([[ hi NvimTreeWinSeparator guibg=None ]])

-- vim.cmd([[ hi pandocAtxHeader     guifg=#AF005F ctermfg=125 gui=bold term=bold ]])
-- vim.cmd([[ hi pandocAtxHeaderMark guifg=#AF005F ctermfg=125 ]])
-- vim.cmd([[ hi pandocAtxStart      guifg=#AF005F ctermfg=125 ]])
