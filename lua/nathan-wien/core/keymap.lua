-- Reload init.lua
-- vim.keymap.set("n", "<F12>", ":luafile ~/.config/nvim/init.lua<CR>")

-- Indentation
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

-- Terminal
vim.keymap.set("n", "<Leader>vt", ":vsplit | terminal<CR>")
vim.keymap.set("n", "<Leader>vT", ":split | terminal<CR>")
vim.keymap.set("t", "<C-[>", "<C-\\><C-n>")

-- Resize splits
vim.keymap.set("n", "<C-s><C-k>", ":resize -1<CR>")
vim.keymap.set("n", "<C-s><C-j>", ":resize +1<CR>")
vim.keymap.set("n", "<C-s><C-h>", ":vertical resize -1<CR>")
vim.keymap.set("n", "<C-s><C-l>", ":vertical resize +1<CR>")

-- Change between horizontal and vertical split
vim.keymap.set("n", "<C-s>h", "<C-w>t<C-w>K")
vim.keymap.set("n", "<C-s>k", "<C-w>t<C-w>H")

-- Remap for word wrap
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
vim.keymap.set("n", "0", "v:count == 0 ? 'g0' : '0'", { expr = true, silent = true })
vim.keymap.set("n", "$", "v:count == 0 ? 'g$' : '$'", { expr = true, silent = true })

-- Quickfix list
vim.keymap.set("n", "[q", "<cmd>cprevious<CR>")
vim.keymap.set("n", "]q", "<cmd>cnext<CR>")

-- Center the cursor vertically when using C-u/d
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Smart dd. Credit:
-- https://www.reddit.com/r/neovim/comments/w0jzzv/comment/igfjx5y/?utm_source=share&utm_medium=web2x&context=3
vim.keymap.set("n", "dd", function()
  if vim.api.nvim_get_current_line():match("^%s*$") then
    return '"_dd'
  else
    return "dd"
  end
end, { noremap = true, expr = true })
