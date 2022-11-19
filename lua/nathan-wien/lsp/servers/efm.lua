local default = require("nathan-wien.lsp.default")

local formatters = {}
local linters = {}

formatters.luafmt = {
  formatCommand = "luafmt ${-i:tabWidth} --stdin",
  formatStdin = true,
}

formatters.prettier = {
  formatCommand = "prettier --stdin --stdin-filepath ${INPUT}",
  formatStdin = true,
}

-- npm add --global prettier_d_slim
-- Doesn't work for some reason...
formatters.prettier_d = {
  formatCommand = "prettier_d_slim --stdin --stdin-filepath ${INPUT}",
  formatStdin = true,
}

formatters.prettierd = {
  formatCommand = 'prettierd "${INPUT}"',
  formatStdin = true,
  -- env = {
  --   string.format('PRETTIERD_DEFAULT_CONFIG=%s', vim.fn.expand('~/.config/nvim/utils/linter-config/.prettierrc.json')),
  -- },
}

-- python
formatters.python_black = {
  formatCommand = "black --quiet -",
  formatStdin = true,
}

formatters.python_isort = {
  formatCommand = "isort --quiet -",
  formatStdin = true,
}

linters.eslint_d = {
  lintCommand = "eslint_d -f visualstudio --stdin --stdin-filename ${INPUT}",
  -- lintCommand = "eslint_d -f unix --stdin --stdin-filename ${INPUT}",
  lintIgnoreExitCode = true,
  lintStdin = true,
  lintFormats = { "%f(%l,%c): %tarning %m", "%f(%l,%c): %rror %m" },
  formatCommand = "eslint_d --fix-to-stdout --stdin --stdin-filename=${INPUT}",
  formatStdin = true,
}

linters.flake8 = {
  lintCommand = "flake8 --stdin-display-name ${INPUT} -",
  lintStdin = true,
  lintFormats = { "%f:%l:%c: %m" },
}

local languages = {
  -- lua = {luafmt},
  typescript = { formatters.prettierd, linters.eslint_d },
  javascript = { formatters.prettierd, linters.eslint_d },
  typescriptreact = { formatters.prettierd, linters.eslint_d },
  ["typescript.tsx"] = { formatters.prettierd, linters.eslint_d },
  javascriptreact = { formatters.prettierd, linters.eslint_d },
  ["javascript.jsx"] = { formatters.prettierd, linters.eslint_d },
  vue = { formatters.prettierd, linters.eslint_d },
  json = { formatters.prettierd },
  html = { formatters.prettierd },
  scss = { formatters.prettierd },
  css = { formatters.prettierd },
  python = { formatters.python_black, formatters.python_isort, linters.flake8 },
}

return {
  filetypes = vim.tbl_keys(languages),
  init_options = {
    documentFormatting = true,
  },
  settings = {
    rootMarkers = { "package.json", ".git" },
    lintDebounce = 500,
    languages = languages,
  },
  on_attach = function(client, bufnr)
    default.on_attach(client, bufnr)
  end,
}
