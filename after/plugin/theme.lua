require("nathan-wien.themes.papercolor-light")

-- Increases signcolumn width for gitsigns and diagnostics
vim.opt.signcolumn = "auto:2"
-- Global status bar
vim.opt.laststatus = 3
vim.cmd([[ hi WinSeparator guibg=None ]])
vim.cmd([[ hi NvimTreeWinSeparator guibg=None ]])
-- Winbar
vim.opt.winbar = " %f %m"

print("themed!")
