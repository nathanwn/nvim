return {
  -- LspConfig
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPost", "BufNewFile", "BufWritePre" },
    dependencies = {
      { "williamboman/mason.nvim", config = true }, -- NOTE: Must be loaded before dependants
      "williamboman/mason-lspconfig.nvim",
      "WhoIsSethDaniel/mason-tool-installer.nvim",
      "j-hui/fidget.nvim",
      "nvim-telescope/telescope.nvim",
      "hrsh7th/cmp-nvim-lsp",
    },
    config = require("nathan-wien.plugins.lsp.config.lspconfig"),
  },
  -- UI
  {
    "j-hui/fidget.nvim",
    tag = "v1.4.5",
    opts = {},
  },
  -- Java
  {
    "mfussenegger/nvim-jdtls",
    config = require("nathan-wien.plugins.lsp.config.jdtls"),
    cond = false
  },
  -- Scala
  {
    "scalameta/nvim-metals",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = require("nathan-wien.plugins.lsp.config.metals"),
  },
}
