local lsp_default = require("nathan-wien.lsp.default")

return {
  on_attach = function(client, bufnr)
    client.server_capabilities.document_formatting = false
    client.server_capabilities.document_range_formatting = false
    lsp_default.on_attach_run_always(client, bufnr)
  end,
}
