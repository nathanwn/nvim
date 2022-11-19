local lsp_default = require("nathan-wien.lsp.default")

return {
  flags = {
    debounce_text_changes = 150,
  },
  capabilities = require("cmp_nvim_lsp").update_capabilities(
    vim.lsp.protocol.make_client_capabilities()
  ),
  on_attach = lsp_default.on_attach_run_always,
}
