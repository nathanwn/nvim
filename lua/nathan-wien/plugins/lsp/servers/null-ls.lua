local nvim_lsp_util = require("lspconfig.util")
local null_ls = require("null-ls")
local default_on_attach = require("nathan-wien.plugins.lsp.default.on_attach")

local disable_filetypes = function(null_ls_source, disabled_fts)
  return null_ls_source.with({
    filetypes = vim.tbl_filter(function(ft)
      return not vim.tbl_contains(disabled_fts, ft)
    end, null_ls_source.filetypes),
  })
end

local should_attach = function(bufnr)
  local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(0), ":t")
  local filetype = vim.api.nvim_buf_get_option(bufnr, "filetype")

  local disabled = {
    filetypes = {
      -- Example: "cpp"
    },
    filenames = {
      "grammar.js", -- treesitter
    },
  }

  if vim.tbl_contains(disabled.filetypes, filetype) then
    return false
  end
  if vim.tbl_contains(disabled.filenames, filename) then
    return false
  end

  return true
end

return {
  sources = {
    -- Go
    -- null_ls.builtins.diagnostics.golangci_lint,

    -- Java
    -- null_ls.builtins.formatting.google_java_format.with({
    --   command = "java",
    --   args = { "-jar", "$HOME/bin/google-java-format-1-9.jar", "-" },
    -- }),

    -- JS/TS
    null_ls.builtins.diagnostics.eslint_d,
    disable_filetypes(null_ls.builtins.formatting.prettierd, {
      "yaml",
      "markdown",
    }),

    -- Lua
    null_ls.builtins.diagnostics.luacheck,
    null_ls.builtins.formatting.stylua,

    -- Python
    null_ls.builtins.formatting.black,
    null_ls.builtins.formatting.isort,
    null_ls.builtins.diagnostics.flake8,
    null_ls.builtins.diagnostics.mypy,
    -- null_ls.builtins.diagnostics.mypy.with({
    --   command = "pipenv",
    --   args = { "run", "mypy" },
    -- }),
    null_ls.builtins.diagnostics.pylint,

    -- XML
    -- builtins.formatting.xmllint,

    -- YAML
    null_ls.builtins.diagnostics.yamllint.with({
      filetypes = { "yaml.ansible" },
    }),
    -- Spelling?
    -- builtins.completion.spell,
  },
  diagnostics_format = "[#{s}|#{c}] #{m}",
  should_attach = should_attach, -- check if null-ls should attach or not
  root_dir = nvim_lsp_util.root_pattern(".null-ls-root", ".git"),
  on_attach = function(client, bufnr)
    client.server_capabilities.documentFormattingProvider = true
    default_on_attach(client, bufnr)
  end,
}
