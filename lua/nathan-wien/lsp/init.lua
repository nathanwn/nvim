return function()
  local lrequire = require("nathan-wien.utils").local_require
  local default = lrequire("lsp.default")

  -- Make diagnostics less aggressive
  vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics,
    {
      underline = true,
      virtual_text = {
        spacing = 8,
        -- severity_limit = 'Error',
      },
      signs = false,
      update_in_insert = false,
    }
  )

  vim.api.nvim_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

  local lsp_servers = lrequire("lsp.servers")
  for _, server in ipairs(lsp_servers) do
    -- config overrides default_lsp_config
    server.instance.setup(vim.tbl_deep_extend("force", default.config, server.config))
  end

  -- Virtual text coloring
  -- Read: https://neovim.io/doc/user/lsp.html
  vim.cmd([[ hi LspDiagnosticsDefaultHint guifg='#A0A0A0' ]])
end
