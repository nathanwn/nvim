local default_on_attach = require("nathan-wien.plugins.lsp.default.on_attach")

return {
  flags = {
    debounce_text_changes = 150,
  },
  capabilities = require("cmp_nvim_lsp").default_capabilities(),
  on_attach = default_on_attach,
}
