local default_on_attach = require("nathan-wien.lsp.default.on_attach")

return {
  on_attach = function(client, bufnr)
    client.server_capabilities.document_formatting = false
    client.server_capabilities.document_range_formatting = false
    default_on_attach(client, bufnr)
  end,
}
