local nvim_lsp_util = require("lspconfig.util")
local builtins = require("null-ls").builtins
local default = require("nathan-wien.lsp.default")

local should_attach = function(bufnr)
  local disabled_filetypes = { "cpp", "yaml" }

  for _, ft in ipairs(disabled_filetypes) do
    if vim.api.nvim_buf_get_option(bufnr, "filetype") == ft then
      return false
    end
  end

  return true
end

return {
  sources = {
    -- Go
    builtins.diagnostics.golangci_lint,
    -- Java
    builtins.formatting.google_java_format.with({
      -- command = "java-format",
      command = "java",
      args = { "-jar", "$HOME/bin/google-java-format.jar", "-" },
    }),
    -- JS/TS
    builtins.diagnostics.eslint_d,
    builtins.formatting.prettierd,
    -- Lua
    builtins.formatting.stylua,
    -- Python
    builtins.formatting.black,
    builtins.formatting.isort,
    builtins.diagnostics.flake8,
    builtins.diagnostics.mypy,
    builtins.diagnostics.pylint,
    -- builtins.diagnostics.pylint.with(python_settings),
    -- XML
    -- builtins.formatting.xmllint,
    -- Spelling?
    -- builtins.completion.spell,
  },
  diagnostics_format = "[#{c}|#{s}] #{m}",
  should_attach = should_attach, -- check if null-ls should attach or not
  root_dir = nvim_lsp_util.root_pattern(".null-ls-root", ".git"),
  on_attach = function(client, bufnr)
    client.server_capabilities.document_formatting = true
    default.on_attach(client, bufnr)
  end,
}
