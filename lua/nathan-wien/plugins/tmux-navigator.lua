return {
  "christoomey/vim-tmux-navigator",
  config = function()
    vim.g.tmux_navigator_no_mappings = 1
  end,
  keys = {
    { "<C-w>h", "<Cmd>TmuxNavigateLeft<CR>" },
    { "<C-w>j", "<Cmd>TmuxNavigateDown<CR>" },
    { "<C-w>k", "<Cmd>TmuxNavigateUp<CR>" },
    { "<C-w>l", "<Cmd>TmuxNavigateRight<CR>" },
    { "<C-w>\\", "<Cmd>TmuxNavigatePrevious<CR>" },
  },
}
