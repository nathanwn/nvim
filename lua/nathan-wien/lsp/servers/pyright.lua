local nvim_lsp_util = require("lspconfig.util")

return {
  root_dir = nvim_lsp_util.root_pattern(".git", "pyproject.toml"),
}
