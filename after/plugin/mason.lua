local lsp_servers = require("nathan-wien.lsp.servers")

local ensure_installed = {}

for _, server in ipairs(lsp_servers) do
  table.insert(ensure_installed, server.name)
end

ensure_installed = vim.tbl_filter(function(server_name)
  return server_name == "null-ls"
end, ensure_installed)

table.insert(ensure_installed, "jdtls")

require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = ensure_installed,
})
