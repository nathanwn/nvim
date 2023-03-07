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

-- Quickfix list
vim.keymap.set("n", "[q", "<cmd>cprevious<CR>")
vim.keymap.set("n", "]q", "<cmd>cnext<CR>")

-- Smart dd. Credit: https://www.reddit.com/r/neovim/comments/w0jzzv/comment/igfjx5y
vim.keymap.set("n", "dd", function()
  if vim.api.nvim_get_current_line():match("^%s*$") then
    return '"_dd'
  else
    return "dd"
  end
end, { noremap = true, expr = true })

-- Some magic from: https://github.com/ThePrimeagen/init.lua
-- Move
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Keep cursor in the same position while doing line-appending
vim.keymap.set("n", "J", "mzJ`z")

-- Center the cursor vertically when using C-u/d
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Center the cursor vertically when navigating through search results
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Paste over a selection without losing the paste register
vim.keymap.set("x", "<leader>p", [["_dP]])

-- Toggle relative line number
vim.keymap.set("n", "<leader><leader>r", function()
  if vim.opt.relativenumber._value == true then
    vim.opt.relativenumber = false
  else
    vim.opt.relativenumber = true
  end
end)
