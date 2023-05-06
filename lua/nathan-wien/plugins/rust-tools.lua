return {
  "simrat39/rust-tools.nvim",
  dependencies = { "neovim/nvim-lspconfig" },
  ft = "rust",
  config = function()
    require("rust-tools").setup({
      server = require("nathan-wien.plugins.lsp.servers.rust-analyzer"),
    })
  end,
}
