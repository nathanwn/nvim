local default_on_attach = require("nathan-wien.plugins.lsp.default.on_attach")

return {
  on_attach = function(client, bufnr)
    client.server_capabilities.documentFormattingProvider = false
    client.server_capabilities.documentRangeFormattingProvider = false
    default_on_attach(client, bufnr)
  end,
}
