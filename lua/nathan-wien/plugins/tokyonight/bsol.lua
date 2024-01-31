local M = {}

--- You can override specific color groups to use other groups or a hex color
--- function will be called with a ColorScheme table
---@param colors ColorScheme
M.on_colors = function(colors)
  colors.bg = "#000080"
  colors.bg_dark = "#003090"
  colors.bg_float = "#003090"
  colors.bg_highlight = "#003090"
  colors.bg_popup = "#003090"
  colors.bg_search = "#008080"
  colors.bg_sidebar = "#003090"
  colors.bg_statusline = "#003090"
  colors.bg_visual = "#283457"
  colors.black = "#15161e"
  colors.blue = "#7aa2f7"
  colors.blue0 = "#3d59a1"
  colors.blue1 = "#2ac3de"
  colors.blue2 = "#0db9d7"
  colors.blue5 = "#89ddff"
  colors.blue6 = "#b4f9f8"
  colors.blue7 = "#394b70"
  colors.border = "#15161e"
  colors.border_highlight = "#27a1b9"
  colors.comment = "#565f89"
  colors.cyan = "#7dcfff"
  colors.dark3 = "#545c7e"
  colors.dark5 = "#737aa2"
  colors.diff = {
    add = "#20303b",
    change = "#1f2231",
    delete = "#37222c",
    text = "#394b70",
  }
  colors.error = "#db4b4b"
  colors.fg = "#c0caf5"
  colors.fg_dark = "#a9b1d6"
  colors.fg_float = "#c0caf5"
  colors.fg_gutter = "#3b4261"
  colors.fg_sidebar = "#a9b1d6"
  colors.git = {
    add = "#4097a3",
    change = "#506d9b",
    delete = "#c47981",
    ignore = "#545c7e",
  }
  colors.gitSigns = {
    add = "#399a96",
    change = "#6382bd",
    delete = "#c25d64",
  }
  colors.green = "#00CC00"
  colors.green1 = "#00AA00"
  colors.green2 = "#009900"
  colors.hint = "#1abc9c"
  colors.info = "#0db9d7"
  colors.magenta = "#bb9af7"
  colors.magenta2 = "#ff007c"
  colors.none = "NONE"
  colors.orange = "#ff9e64"
  colors.purple = "#9d7cd8"
  colors.red = "#e75050"
  colors.red1 = "#db4b4b"
  colors.teal = "#1abc9c"
  colors.terminal_black = "#414868"
  colors.warning = "#e0af68"
  colors.yellow = "#e0af68"
end

return M
