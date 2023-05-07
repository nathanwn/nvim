local M = {}

M.palette = {
  black = "#000000",
  red = "#FF8080", -- don't change
  maroon = "#FF5250", -- don't change
  green = "#50CC50", -- don't change
  pink = "#AAFF00",
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
  base = "#000080",
  mantle = "#005555",
  crust = "#003535",
}

M.override = {
  Comment = {
    fg = M.palette.overlay0,
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
    bg = M.palette.overlay2,
  },
  HeirlineFilenameActive = {
    fg = M.palette.text,
    bg = M.palette.mantle,
  },
  HeirlineFilenameInactive = {
    fg = M.palette.overlay1,
    bg = M.palette.mantle,
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
    fg = M.palette.overlay2,
    bg = M.palette.surface0,
  },
  NvimTreeNormal = {
    -- bg = M.palette.mantle,
  },
  NvimTreeCursorLine = {
    bg = M.palette.surface2,
  },
  NvimTreeExecFile = {
    fg = M.palette.pink,
  },
  ["@parameter"] = {
    fg = M.palette.text,
  },
}

return M
