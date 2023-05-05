local M = {}

M.palette = {
  black = "#000000",
  red = "#FF0000", -- don't change
  maroon = "#CC0000", -- don't change
  green = "#00CC00", -- don't change
  pink = "#FFAAFF",
  mauve = "#00FFFF",
  blue = "#FFFF55", -- don't change
  yellow = "#FFFF55",
  sky = "#FFFFFF",
  teal = "#00A0A0",
  peach = "#FFAA00",
  rosewater = "#FFFFFF",
  flamingo = "#FFFFFF",
  sapphire = "#FFAA00",
  lavender = "#FFAAFF",
  text = "#FFFFFF",
  subtext1 = "#DDDDDD",
  subtext0 = "#BBBBBB",
  overlay2 = "#CCCCCC",
  overlay1 = "#BBBBBB",
  overlay0 = "#AAAAAA",
  surface2 = "#00A0A0",
  surface1 = "#008080",
  surface0 = "#004040",
  -- overlay2 = "#CCCCCC",
  -- overlay1 = "#BBBBBB",
  -- overlay0 = "#AAAAAA",
  -- surface2 = "#999999",
  -- surface1 = "#888888",
  -- surface0 = "#777777",
  base = "#000080",
  mantle = "#555555",
  crust = "#005555",
}

M.override = {
  -- Comment = {
  --   fg = M.palette.overlay1,
  -- },
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
    bg = M.palette.overlay2,
  },
  HeirlineFilenameActive = {
    fg = M.palette.text,
    bg = M.palette.surface1,
  },
  HeirlineFilenameInactive = {
    fg = M.palette.overlay1,
    bg = M.palette.surface1,
  },
  HeirlineFiletype = {
    fg = M.palette.base,
    bg = M.palette.overlay2,
  },
  HeirlineLocation = {
    fg = M.palette.base,
    bg = M.palette.overlay0,
  },
  HeirlineLsp = {
    fg = M.palette.base,
    bg = M.palette.overlay1,
  },
  HeirlineViModeNormal = {
    fg = M.palette.base,
    bg = M.palette.overlay0,
  },
  HeirlineViModeInsert = {
    fg = M.palette.overlay0,
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
    bg = M.palette.overlay2,
  },
  HeirlineViModeTerminal = {
    fg = M.palette.base,
    bg = M.palette.overlay2,
  },
  HeirlineViModeInactive = {
    fg = M.palette.base,
    bg = M.palette.subtext0,
  },
  FidgetTitle = {
    fg = M.palette.surface2,
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
  ["@parameter"] = {
    fg = M.palette.text,
  },
}

return M
