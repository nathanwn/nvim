local default = require("nathan-wien.lsp.default")

-- Make diagnostics less aggressive
vim.lsp.handlers["textDocument/publishDiagnostics"] =
  vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
    underline = true,
    -- virtual_text = {
    --   spacing = 8,
    --   -- severity_limit = 'Error',
    -- },
    virtual_text = false,
    signs = true,
    update_in_insert = false,
  })

vim.api.nvim_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

local lsp_servers = require("nathan-wien.lsp.servers")
for _, server in ipairs(lsp_servers) do
  -- config overrides default_lsp_config
  server.instance.setup(vim.tbl_deep_extend("force", default.config, server.config))
end

-- Virtual text coloring
-- Read: https://neovim.io/doc/user/lsp.html
vim.cmd([[ hi LspDiagnosticsDefaultHint guifg='#A0A0A0' ]])

-- Signs
-- Read: https://neovim.io/doc/user/diagnostic.html
for kind, icon in pairs({
  ["Error"] = "",
  ["Info"] = "",
  ["Hint"] = "",
  ["Warn"] = "",
}) do
  local name = "DiagnosticSign" .. kind
  local texthl_group = "DiagnosticSign" .. kind
  vim.fn.sign_define(name, { text = icon, texthl = texthl_group })
end

-- LSP-related plugins
require("lsp-colors").setup()
