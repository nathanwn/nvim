local M = {}

M.palette = {
  red = "#af0000",
  maroon = "#d70000",
  green = "#008700",
  pink = "#d70087",
  mauve = "#8700af",
  blue = "#005faf",
  yellow = "#806000",
  sky = "#0087af",
  teal = "#005f87",
  peach = "#772C29",
  rosewater = "#d04a00",
  flamingo = "#8700d7",
  sapphire = "#09735c",
  lavender = "#5566C0",
  text = "#444444",
  subtext1 = "#555555",
  subtext0 = "#666666",
  overlay2 = "#777777",
  overlay1 = "#888888",
  overlay0 = "#999999",
  surface2 = "#aaaaaa",
  surface1 = "#bbbbbb",
  surface0 = "#cccccc",
  base = "#eeeeee",
  mantle = "#dddddd",
  crust = "#cccccc",
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
  colors.dark3 = M.palette.surface0
  colors.dark5 = M.palette.surface2
  colors.delta = {
    add = M.palette.green,
    delete = M.palette.red,
  }
  colors.diff = {
    add = M.palette.green,
    change = M.palette.yellow,
    delete = M.palette.red,
    text = M.palette.sky,
  }
  colors.error = M.palette.red
  colors.fg = M.palette.text
  colors.fg_dark = M.palette.subtext0
  colors.fg_float = M.palette.subtext0
  colors.fg_gutter = M.palette.surface2
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
  colors.terminal_black = M.palette.surface0
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
  hl.HeirlineViModeTerminal = {
    fg = M.palette.base,
    bg = M.palette.yellow,
  }
  hl.HeirlineViModeInactive = {
    fg = M.palette.base,
    bg = M.palette.subtext0,
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
