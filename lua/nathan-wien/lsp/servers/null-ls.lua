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

-- local python_settings = {
--   prefer_local = ".venv/bin",
--   --cwd = function(params)
--   -- return vim.fn.fnamemodify(params.bufname, ":h")
--   -- end,
-- }

return {
  sources = {
    -- Lua
    builtins.formatting.stylua,
    -- JS/TS
    builtins.diagnostics.eslint_d,
    builtins.completion.spell,
    builtins.formatting.prettierd,
    -- Python
    builtins.formatting.black,
    builtins.formatting.isort,
    builtins.diagnostics.flake8,
    builtins.diagnostics.mypy,
    builtins.diagnostics.pylint,
    -- builtins.diagnostics.pylint.with(python_settings),
    -- Go
    builtins.diagnostics.golangci_lint,
  },
  diagnostics_format = "[#{c}|#{s}] #{m}",
  should_attach = should_attach, -- check if null-ls should attach or not
  on_attach = function(client, bufnr)
    client.server_capabilities.document_formatting = true
    default.on_attach(client, bufnr)
  end,
}
