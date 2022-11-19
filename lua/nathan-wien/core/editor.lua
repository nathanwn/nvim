-- Line numbers
vim.opt.number = true
vim.opt.relativenumber = true
-- Indentation
vim.opt.autoindent = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true
-- Characters
vim.opt.list = true
vim.opt.listchars = {
  tab = "» ",
  trail = "␣",
  extends = "▶",
  precedes = "◀",
  -- eol = '⏎'
}
-- Error bells
vim.opt.errorbells = false
-- Split
vim.opt.splitbelow = true
vim.opt.splitright = true
-- Scrolling
vim.opt.scrolloff = 8
-- Undo files
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = require("nathan-wien.utils").local_dir_path .. "/undodir"
vim.opt.undofile = true
-- Wrap
vim.opt.linebreak = true
-- Cursor
vim.opt.guicursor = ""
-- Mouse
vim.opt.mouse = "a"
-- Load project-wise vim settings
vim.opt.exrc = true
-- Backspace issue
vim.opt.backspace = { "indent", "eol", "start" }
-- Clipboard
vim.opt.clipboard = { "unnamed", "unnamedplus" }
-- Termcolor
vim.opt.termguicolors = true
-- Buffers
vim.opt.hidden = true
-- Latex
vim.g.tex_flavor = "latex"
-- Syntax-highlight lua in vimscript
vim.g.vimsyn_embed = "l"
-- For gitsigns and diagnostics
vim.opt.signcolumn = "auto:2"
-- New features
vim.opt.laststatus = 3
vim.opt.winbar = " %f %m"
