local default_on_attach = require("nathan-wien.plugins.lsp.default.on_attach")

return {
  on_attach = default_on_attach,
  cmd = {
    "rustup",
    "run",
    "nightly", -- or "stable" or "nightly"
    "rust-analyzer",
  },
}
