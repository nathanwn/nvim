-- Virtual text
-- coloring
-- Read: https://neovim.io/doc/user/lsp.html
-- vim.cmd([[ hi LspDiagnosticsDefaultHint guifg='#A0A0A0' ]])
-- disable
vim.diagnostic.config({
  virtual_text = {
    severity = {
      min = vim.diagnostic.severity.WARN,
    },
    severity_sort = true,
  },

  signs = {
    severity = {
      min = vim.diagnostic.severity.INFO,
    },
    severity_sort = true,
  },
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
