local nvim_lsp_util = require("lspconfig.util")
local null_ls = require("null-ls")
local default_on_attach = require("nathan-wien.lsp.default.on_attach")

local should_attach = function(bufnr)
  local disabled_filetypes = { "cpp" }

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
    null_ls.builtins.diagnostics.golangci_lint,
    -- Java
    null_ls.builtins.formatting.google_java_format.with({
      command = "java",
      args = { "-jar", "$HOME/bin/google-java-format-1-9.jar", "-" },
    }),
    -- JS/TS
    null_ls.builtins.diagnostics.eslint_d,
    null_ls.builtins.formatting.prettierd.with({
      filetypes = vim.tbl_filter(function(ft)
        return ft ~= "yaml"
      end, null_ls.builtins.formatting.prettierd.filetypes),
    }),
    -- Lua
    null_ls.builtins.diagnostics.luacheck,
    null_ls.builtins.formatting.stylua,
    -- Python
    null_ls.builtins.formatting.black,
    null_ls.builtins.formatting.isort,
    null_ls.builtins.diagnostics.flake8,
    null_ls.builtins.diagnostics.mypy,
    null_ls.builtins.diagnostics.pylint,
    -- builtins.diagnostics.pylint.with(python_settings),
    -- XML
    -- builtins.formatting.xmllint,
    null_ls.builtins.diagnostics.yamllint,
    -- Spelling?
    -- builtins.completion.spell,
  },
  diagnostics_format = "[#{c}|#{s}] #{m}",
  should_attach = should_attach, -- check if null-ls should attach or not
  root_dir = nvim_lsp_util.root_pattern(".null-ls-root", ".git"),
  on_attach = function(client, bufnr)
    client.server_capabilities.document_formatting = true
    default_on_attach(client, bufnr)
  end,
}
