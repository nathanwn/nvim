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
  sapphire = "#09735c", -- default
  lavender = "#5566C0", -- default
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

M.override = {
  Comment = {
    fg = M.palette.overlay1,
  },
  Conceal = {
    fg = M.palette.red,
  },
  DapUIPlayPause = {
    fg = M.palette.green,
  },
  DapUIRestart = {
    fg = M.palette.green,
  },
  DapUIStepOut = {
    fg = M.palette.blue,
  },
  DapUIStepBack = {
    fg = M.palette.blue,
  },
  DapUIStepInto = {
    fg = M.palette.blue,
  },
  DapUIStepOver = {
    fg = M.palette.blue,
  },
  HeirlineBranch = {
    fg = M.palette.base,
    bg = M.palette.mauve,
  },
  HeirlineFilenameActive = {
    fg = M.palette.blue,
    bg = M.palette.surface0,
  },
  HeirlineFilenameInactive = {
    fg = M.palette.overlay2,
    bg = M.palette.surface0,
  },
  HeirlineFiletype = {
    fg = M.palette.base,
    bg = M.palette.mauve,
  },
  HeirlineLocation = {
    fg = M.palette.base,
    bg = M.palette.blue,
  },
  HeirlineLsp = {
    fg = M.palette.base,
    bg = M.palette.lavender,
  },
  HeirlineViModeNormal = {
    fg = M.palette.base,
    bg = M.palette.blue,
  },
  HeirlineViModeInsert = {
    fg = M.palette.blue,
    bg = M.palette.base,
  },
  HeirlineViModeVisual = {
    fg = M.palette.base,
    bg = M.palette.sapphire,
  },
  HeirlineViModeReplace = {
    fg = M.palette.base,
    bg = M.palette.sky,
  },
  HeirlineViModeCommand = {
    fg = M.palette.base,
    bg = M.palette.yellow,
  },
  HeirlineViModeTerminal = {
    fg = M.palette.base,
    bg = M.palette.yellow,
  },
  HeirlineViModeInactive = {
    fg = M.palette.base,
    bg = M.palette.subtext0,
  },
  LspInlayHint = {
    fg = "#e8e8e8",
    bg = "#9999cc",
  },
  NvimTreeNormal = {
    bg = M.palette.mantle,
  },
  NvimTreeExecFile = {
    fg = M.palette.pink,
  },
}

return M
