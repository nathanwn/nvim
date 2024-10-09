return {
  -- Core plugins
  { "nvim-lua/popup.nvim" },
  { "nvim-lua/plenary.nvim" },
  -- Grammar checker
  {
    "uga-rosa/ccc.nvim",
    config = function()
      require("ccc").setup({
        highlighter = {
          auto_enable = true,
          lsp = true,
        },
      })
    end,
    keys = {
      {
        "<Leader>tc",
        "<cmd>CccHighlighterToggle<CR>",
        mode = "n",
        desc = "Toggle color highlighter",
      },
    },
  },
  { "rhysd/vim-grammarous" },
  -- Startup time
  { "dstein64/vim-startuptime" },
  -- THEMES
  { "NLKNguyen/papercolor-theme" },
}
