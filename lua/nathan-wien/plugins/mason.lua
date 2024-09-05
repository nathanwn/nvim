return {
  {
    "williamboman/mason.nvim",
    cmd = "Mason",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    tag = "v1.30.0",
    dependencies = {
      {
        "neovim/nvim-lspconfig",
        "williamboman/mason.nvim",
      },
    },
    event = { "BufReadPost", "BufNewFile", "BufWritePre" },
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
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    dependencies = {
      {
        "williamboman/mason.nvim",
      },
    },
    event = { "VeryLazy" },
    opts = {
      ensure_installed = {
        -- you can pin a tool to a particular version
        -- { 'golangci-lint', version = 'v1.47.0' },
        -- you can turn off/on auto_update per tool
        -- { 'bash-language-server', auto_update = true },
        -- lua
        "stylua",
        -- python
        "autoflake",
        "black",
        "isort",
        -- shell
        "shellcheck",
      },
    },
  },
}
