local default_on_attach = require("nathan-wien.lsp.default.on_attach")

return {
  flags = {
    debounce_text_changes = 150,
  },
  capabilities = require("cmp_nvim_lsp").update_capabilities(
    vim.lsp.protocol.make_client_capabilities()
  ),
  on_attach = default_on_attach,
}
