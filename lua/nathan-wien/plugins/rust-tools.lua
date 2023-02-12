return {
  "simrat39/rust-tools.nvim",
  dependencies = { "neovim/nvim-lspconfig" },
  ft = "rust",
  config = function()
    require("rust-tools").setup({})
  end,
}
