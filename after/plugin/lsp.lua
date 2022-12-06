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
  -- signs = {
  --   severity = {
  --     min = vim.diagnostic.severity.INFO,
  --   },
  --   severity_sort = true,
  -- },
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
    blend = 0,
  },
})

-- Diagnostic filter
-- Credit: https://github.com/neovim/nvim-lspconfig/issues/726#issuecomment-1075539112
local filter = function(arr, func)
  -- Filter in place
  -- https://stackoverflow.com/questions/49709998/how-to-filter-a-lua-array-inplace
  local new_index = 1
  local size_orig = #arr
  for old_index, v in ipairs(arr) do
    if func(v, old_index) then
      arr[new_index] = v
      new_index = new_index + 1
    end
  end
  for i = new_index, size_orig do
    arr[i] = nil
  end
end

local filter_diagnostics = function(diagnostic)
  -- Only filter out Pyright stuff for now
  if diagnostic.source ~= "Pyright" then
    return true
  end

  -- Allow kwargs to be unused, sometimes you want many functions to take the
  -- same arguments but you don't use all the arguments in all the functions,
  -- so kwargs is used to suck up all the extras
  if diagnostic.message == '"kwargs" is not accessed' then
    return false
  end

  -- Allow variables starting with an underscore
  if string.match(diagnostic.message, '"_.+" is not accessed') then
    return false
  end

  return true
end

local custom_on_publish_diagnostics = function(a, params, client_id, c, config)
  filter(params.diagnostics, filter_diagnostics)
  vim.lsp.diagnostic.on_publish_diagnostics(a, params, client_id, c, config)
end

vim.lsp.handlers["textDocument/publishDiagnostics"] =
  vim.lsp.with(custom_on_publish_diagnostics, {})
