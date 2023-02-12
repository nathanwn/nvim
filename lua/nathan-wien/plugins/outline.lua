return {
  "simrat39/symbols-outline.nvim",
  config = function()
    vim.g.symbols_outline = {
      keymaps = {
        hover_symbol = "H",
      },
    }
    require("symbols-outline").setup()
  end,
  keys = {
    {
      "<Leader>vo",
      "<cmd>SymbolsOutline<CR>",
      mode = "n",
      desc = "Toggle Outline",
    },
  },
}
