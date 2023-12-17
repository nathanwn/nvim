return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
      {
        "neovim/nvim-lspconfig",
        "williamboman/mason.nvim",
      },
    },
    config = function()
      local lsp_servers = require("nathan-wien.plugins.lsp.servers")
      local ensure_installed = {}

      for _, server in ipairs(lsp_servers) do
        table.insert(ensure_installed, server.name)
      end

      table.insert(ensure_installed, "jdtls")

      require("mason-lspconfig").setup({
        ensure_installed = ensure_installed,
      })
    end,
  },
}
