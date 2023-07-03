return {
  "simrat39/symbols-outline.nvim",
  config = function()
    require("symbols-outline").setup({
      keymaps = {
        hover_symbol = "H",
      },
      symbol_blacklist = {
        "Variable",
      },
    })
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
