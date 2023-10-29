return {
  "christoomey/vim-tmux-navigator",
  config = function()
    vim.g.tmux_navigator_no_mappings = 1
  end,
  keys = {
    { "<C-w>h", ":TmuxNavigateLeft<CR>" },
    { "<C-w>j", ":TmuxNavigateDown<CR>" },
    { "<C-w>k", ":TmuxNavigateUp<CR>" },
    { "<C-w>l", ":TmuxNavigateRight<CR>" },
    { "<C-w>\\", ":TmuxNavigatePrevious<CR>" },
  },
}
