local on_attach = require("nathan-wien.plugins.lsp.server_config.on_attach")

local capabilities = require("cmp_nvim_lsp").default_capabilities()
-- Settings for kevinhwang91/nvim-ufo
capabilities.textDocument.foldingRange = {
  dynamicRegistration = false,
  lineFoldingOnly = true,
}

return {
  flags = {
    debounce_text_changes = 150,
  },
  capabilities = capabilities,
  on_attach = on_attach.create(),
}
