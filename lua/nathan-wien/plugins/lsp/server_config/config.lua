local on_attach = require("nathan-wien.plugins.lsp.server_config.on_attach")

return {
  flags = {
    debounce_text_changes = 150,
  },
  capabilities = require("cmp_nvim_lsp").default_capabilities(),
  on_attach = on_attach.create(),
}
