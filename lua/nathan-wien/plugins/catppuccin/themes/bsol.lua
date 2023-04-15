local M = {}

M.palette = {
  red = "#FF0000",
  maroon = "#FF0000",
  green = "#FFAA00",
  pink = "#FFAACC",
  mauve = "#00CC00",
  blue = "#55FFFF",
  yellow = "#FFFFFF",
  sky = "#FFFF55",
  teal = "#00CC00",
  peach = "#FFFFFF",
  rosewater = "#FFFF55",
  flamingo = "#FF99FF",
  sapphire = "#FFAA00",
  lavender = "#FF99FF",
  text = "#FFFFFF",
  subtext1 = "#DDDDDD",
  subtext0 = "#BBBBBB",
  overlay2 = "#00D0D0",
  overlay1 = "#00C0C0",
  overlay0 = "#00B0B0",
  surface2 = "#00A0A0",
  surface1 = "#009090",
  surface0 = "#008080",
  base = "#000078",
  mantle = "#004080",
  crust = "#0060A0",
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
  GitSignsAdd = {
    fg = M.palette.teal,
  },
  GitSignsChange = {
    fg = M.palette.sky,
  },
  HeirlineBranch = {
    fg = M.palette.base,
    bg = M.palette.overlay2,
  },
  HeirlineFilenameActive = {
    fg = M.palette.sky,
    bg = M.palette.surface0,
  },
  HeirlineFilenameInactive = {
    fg = M.palette.overlay2,
    bg = M.palette.surface0,
  },
  HeirlineFiletype = {
    fg = M.palette.base,
    bg = M.palette.overlay2,
  },
  HeirlineLocation = {
    fg = M.palette.base,
    bg = M.palette.blue,
  },
  HeirlineLsp = {
    fg = M.palette.base,
    bg = M.palette.overlay1,
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
