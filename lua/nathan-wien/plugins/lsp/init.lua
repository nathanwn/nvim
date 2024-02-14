return {
  -- LspConfig
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "folke/neodev.nvim",
      "nvim-telescope/telescope.nvim",
      "hrsh7th/cmp-nvim-lsp",
      "kevinhwang91/nvim-ufo",
    },
    config = require("nathan-wien.plugins.lsp.config.lspconfig"),
  },
  -- UI
  {
    "folke/lsp-colors.nvim",
    config = function()
      require("lsp-colors").setup()
    end,
  },
  {
    "j-hui/fidget.nvim",
    tag = "v1.1.0",
    opts = {},
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
