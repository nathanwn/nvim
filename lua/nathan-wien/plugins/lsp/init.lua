return {
  -- LspConfig
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "folke/neodev.nvim",
      "nvim-telescope/telescope.nvim",
    },
    config = require("nathan-wien.plugins.lsp.config"),
  },
  -- Formatting & Linting
  { "jose-elias-alvarez/null-ls.nvim", dependencies = { "nvim-lua/plenary.nvim" } },
  -- UI
  {
    "folke/lsp-colors.nvim",
    config = function()
      require("lsp-colors").setup()
    end,
  },
  {
    "j-hui/fidget.nvim",
    version = "legacy", -- See: https://github.com/j-hui/fidget.nvim/issues/131
    config = require("nathan-wien.plugins.lsp.config.fidget"),
  },
  {
    "lvimuser/lsp-inlayhints.nvim",
    config = require("nathan-wien.plugins.lsp.config.lsp-inlayhints"),
  },
  -- Java
  {
    "mfussenegger/nvim-jdtls",
    config = require("nathan-wien.plugins.lsp.config.jdtls"),
  },
  -- Scala
  {
    "scalameta/nvim-metals",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = require("nathan-wien.plugins.lsp.config.metals"),
  },
}
