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
  -- eol = "⏎",
}
vim.opt.fillchars = {
  -- Remove the tilde symbols at the end of buffers
  eob = " ",
  -- For folding
  fold = " ",
  foldopen = "",
  foldsep = " ",
  foldclose = "",
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
vim.opt.undodir = vim.fn.stdpath("data") .. "/undodir"
vim.opt.undofile = true
-- Wrap
vim.opt.linebreak = true
-- Highlight search
vim.opt.hlsearch = false
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
-- Increases signcolumn width for gitsigns and diagnostics
vim.opt.signcolumn = "auto:2"
-- Global status bar
vim.opt.laststatus = 3

-- Convert CRLF to LF on save
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  command = [[%s/\r\n/\r/e]],
  group = vim.api.nvim_create_augroup("EnsureLinuxNewLine", { clear = true }),
})

-- NOTE: if the virtual environment does not exist, this will crash
-- nvim on MacOS.
-- TODO: figure out how to create this virtual environment automagically
-- vim.g.python3_host_prog = require("nathan-wien.utils").python_venv .. "/bin/python3"
