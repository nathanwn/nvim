local M = {}

M.palette = {
  black = "#000000",
  red = "#FF8080", -- don't change
  maroon = "#FF5250", -- don't change
  green = "#50CC50", -- don't change
  pink = "#DD4092",
  mauve = "#D492FF",
  blue = "#00F0FF", -- don't change
  yellow = "#FFFF55",
  sky = "#FFFFFF",
  teal = "#20C020",
  peach = "#00A0F0",
  rosewater = "#FFFFFF",
  flamingo = "#FFFFFF",
  sapphire = "#8080FF",
  lavender = "#FFAA00",
  text = "#FFFFFF",
  subtext1 = "#00CCCC",
  subtext0 = "#00BBBB",
  overlay2 = "#00CCCC",
  overlay1 = "#00BBBB",
  overlay0 = "#00AAAA",
  -- surface2 = "#007777",
  -- surface1 = "#006666",
  -- surface0 = "#005555",
  -- overlay2 = "#CCCCCC",
  -- overlay1 = "#BBBBBB",
  -- overlay0 = "#AAAAAA",
  surface2 = "#009999",
  surface1 = "#008888",
  surface0 = "#007777",
  base = "#000070",
  mantle = "#005555",
  crust = "#003535",
}

--- You can override specific color groups to use other groups or a hex color
--- function will be called with a ColorScheme table
--- List of colors: https://github.com/folke/tokyonight.nvim/blob/main/extras/lua/tokyonight_day.lua
M.on_colors = function(colors)
  -- P(colors)
  colors.bg = M.palette.base
  colors.bg_dark = M.palette.mantle
  colors.bg_float = M.palette.mantle
  colors.bg_highlight = M.palette.surface1
  colors.bg_popup = M.palette.mantle
  colors.bg_search = M.palette.surface0
  colors.bg_sidebar = M.palette.mantle
  colors.bg_statusline = M.palette.mantle
  colors.bg_visual = M.palette.surface0
  colors.black = M.palette.surface0
  colors.blue = M.palette.blue
  colors.blue0 = M.palette.blue
  colors.blue1 = M.palette.blue
  colors.blue2 = M.palette.blue
  colors.blue5 = M.palette.blue
  colors.blue6 = M.palette.blue
  colors.blue7 = M.palette.blue
  colors.border = M.palette.blue
  colors.border_highlight = M.palette.sky
  colors.comment = M.palette.overlay1
  colors.cyan = M.palette.teal
  colors.dark3 = M.palette.subtext1
  colors.dark5 = M.palette.subtext0
  colors.delta = {
    add = M.palette.light_green,
    delete = M.palette.light_red,
  }
  colors.diff = {
    add = M.palette.light_green,
    change = M.palette.light_yellow,
    delete = M.palette.light_red,
    text = M.palette.sky,
  }
  colors.error = M.palette.red
  colors.fg = M.palette.text
  colors.fg_dark = M.palette.subtext0
  colors.fg_float = M.palette.subtext0
  colors.fg_gutter = M.palette.surface1
  colors.fg_sidebar = M.palette.text
  colors.git = {
    add = M.palette.green,
    change = M.palette.yellow,
    delete = M.palette.red,
    ignore = M.palette.sky,
  }
  colors.gitSigns = {
    add = M.palette.green,
    change = M.palette.yellow,
    delete = M.palette.red,
  }
  colors.green = M.palette.green
  colors.green1 = M.palette.green
  colors.green2 = M.palette.green
  colors.hint = M.palette.teal
  colors.info = M.palette.sky
  colors.magenta = M.palette.pink
  colors.magenta2 = M.palette.pink
  colors.none = M.palette.mantle
  colors.orange = M.palette.rosewater
  colors.purple = M.palette.mauve
  colors.red = M.palette.red
  colors.red1 = M.palette.maroon
  colors.teal = M.palette.teal
  colors.terminal_black = M.palette.overlay1
  colors.todo = M.palette.blue
  colors.warning = M.palette.yellow
  colors.yellow = M.palette.yellow
end

M.on_highlights = function(hl, c)
  hl.Conceal = {
    fg = M.palette.red,
  }
  -- hl.DapUIPlayPause = {
  --   fg = M.palette.green,
  -- }
  -- hl.DapUIRestart = {
  --   fg = M.palette.green,
  -- }
  -- hl.DapUIStepOut = {
  --   fg = M.palette.blue,
  -- }
  -- hl.DapUIStepBack = {
  --   fg = M.palette.blue,
  -- }
  -- hl.DapUIStepInto = {
  --   fg = M.palette.blue,
  -- }
  -- hl.DapUIStepOver = {
  --   fg = M.palette.blue,
  -- }
  hl.DiagnosticVirtualTextError = {
    fg = c.error,
    bg = M.palette.mantle,
  }
  hl.DiagnosticVirtualTextHint = {
    fg = c.hint,
    bg = M.palette.mantle,
  }
  hl.DiagnosticVirtualTextInfo = {
    fg = c.info,
    bg = M.palette.mantle,
  }
  hl.DiagnosticVirtualTextOk = {
    fg = c.hint,
    bg = M.palette.mantle,
  }
  hl.DiagnosticVirtualTextWarn = {
    fg = c.warning,
    bg = M.palette.mantle,
  }
  hl.HeirlineBranch = {
    fg = M.palette.base,
    bg = M.palette.mauve,
  }
  hl.HeirlineFilenameActive = {
    fg = M.palette.blue,
    bg = M.palette.surface0,
  }
  hl.HeirlineFilenameInactive = {
    fg = M.palette.overlay2,
    bg = M.palette.surface0,
  }
  hl.HeirlineFiletype = {
    fg = M.palette.base,
    bg = M.palette.mauve,
  }
  hl.HeirlineLocation = {
    fg = M.palette.base,
    bg = M.palette.blue,
  }
  hl.HeirlineLsp = {
    fg = M.palette.base,
    bg = M.palette.lavender,
  }
  hl.HeirlineViModeNormal = {
    fg = M.palette.base,
    bg = M.palette.blue,
  }
  hl.HeirlineViModeInsert = {
    fg = M.palette.blue,
    bg = M.palette.base,
  }
  hl.HeirlineViModeVisual = {
    fg = M.palette.base,
    bg = M.palette.sapphire,
  }
  hl.HeirlineViModeReplace = {
    fg = M.palette.base,
    bg = M.palette.sky,
  }
  hl.HeirlineViModeCommand = {
    fg = M.palette.base,
    bg = M.palette.yellow,
  }
  hl.HeirlineViModeOther = {
    fg = M.palette.base,
    bg = M.palette.yellow,
  }
  -- hl.LspInlayHint = {
  --   fg = M.palette.base,
  --   bg = M.palette.lavender,
  -- }
  -- hl.NvimTreeNormal = {
  --   bg = M.palette.mantle,
  -- }
  -- hl.NvimTreeExecFile = {
  --   fg = M.palette.pink,
  -- }
end

return M
