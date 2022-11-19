local lsp_servers = require("nathan-wien.lsp.servers")
local default_config = require("nathan-wien.lsp.default.config")

for _, server in ipairs(lsp_servers) do
  -- config overrides default_lsp_config
  server.instance.setup(vim.tbl_deep_extend("force", default_config, server.config))
end

-- Virtual text
-- coloring
-- Read: https://neovim.io/doc/user/lsp.html
-- vim.cmd([[ hi LspDiagnosticsDefaultHint guifg='#A0A0A0' ]])
-- disable
vim.diagnostic.config({
  virtual_text = false,
})

-- Diagnostic Signs
-- Read: https://neovim.io/doc/user/diagnostic.html
local signs = {
  ["Error"] = "E", -- "",
  ["Info"] = "I", -- "",
  ["Hint"] = "H", --"",
  ["Warn"] = "W", --"",
}
for kind, icon in pairs(signs) do
  local name = "DiagnosticSign" .. kind
  local texthl_group = "DiagnosticSign" .. kind
  vim.fn.sign_define(name, { text = icon, texthl = texthl_group })
end

-- LSP-related plugins
require("lsp-colors").setup()

-- Fidget - lsp progress
require("fidget").setup({
  text = {
    spinner = "moon",
  },
  align = {
    bottom = true,
  },
  window = {
    relative = "editor",
  },
})
