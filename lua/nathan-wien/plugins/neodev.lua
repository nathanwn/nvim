return {
  "folke/neodev.nvim",
  version = "v2.5.2",
  config = function()
    -- IMPORTANT: make sure to setup neodev BEFORE lspconfig
    require("neodev").setup({
      library = { plugins = { "nvim-dap-ui" }, types = true },
    })
  end,
}
