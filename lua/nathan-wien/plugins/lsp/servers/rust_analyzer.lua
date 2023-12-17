local on_attach = require("nathan-wien.plugins.lsp.server_config.on_attach")

return {
  on_attach = on_attach.create(),
  cmd = {
    "rustup",
    "run",
    "nightly", -- or "stable" or "nightly"
    "rust-analyzer",
  },
}
