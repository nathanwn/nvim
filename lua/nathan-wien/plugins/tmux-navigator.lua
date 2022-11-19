return function()
  vim.g.tmux_navigator_no_mappings = 1
  vim.keymap.set("n", "<C-h>", ":TmuxNavigateLeft<CR>")
  vim.keymap.set("n", "<C-j>", ":TmuxNavigateDown<CR>")
  vim.keymap.set("n", "<C-k>", ":TmuxNavigateUp<CR>")
  vim.keymap.set("n", "<C-l>", ":TmuxNavigateRight<CR>")
  vim.keymap.set("n", "<C-\\>", ":TmuxNavigatePrevious<CR>")
end
