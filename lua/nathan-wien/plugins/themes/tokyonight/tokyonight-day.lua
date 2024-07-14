local M = {}

--- You can override specific color groups to use other groups or a hex color
--- function will be called with a ColorScheme table
--- List of colors: https://github.com/folke/tokyonight.nvim/blob/main/extras/lua/tokyonight_day.lua
M.on_colors = function(colors) end

M.on_highlights = function(hl, c)
  hl["@markup.raw.markdown_inline"] = {
    bg = c.bg_popup,
  }
end

return M
