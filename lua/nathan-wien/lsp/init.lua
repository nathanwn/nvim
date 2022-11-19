return function()
  local nvim_lsp = require("lspconfig")
  local lrequire = require("nathan-wien.utils").local_require
  local default = lrequire("lsp.default")
  local lsp_installer = require("nvim-lsp-installer")

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

  local server_config_map = {
    -- Bash
    bashls = lrequire("lsp.servers.bashls"),
    -- C++
    clangd = {},
    cmake = lrequire("lsp.servers.cmake"),
    -- Go
    gopls = lrequire("lsp.servers.gopls"),
    golangci_lint_ls = {},
    -- Java
    jdtls = {},
    -- JS, TS
    tsserver = lrequire("lsp.servers.tsserver"),
    -- Lua
    sumneko_lua = lrequire("lsp.servers.sumneko_lua"),
    -- JSON
    -- jsonls = lrequire('lsp.servers.jsonls'),
    -- Prisma
    prismals = {},
    -- Python
    pyright = {},
    -- Terraform
    terraformls = {},
    -- Tex
    texlab = {},
    -- Yaml
    yamlls = {},
    -- Formatting
    -- efm = lrequire('lsp.servers.efm'),
  }

  local server_names = {}
  local servers = {}

  -- Servers supported by nvim-lspconfig
  for server_name, server_config in pairs(server_config_map) do
    table.insert(server_names, server_name)
    table.insert(servers, {
      instance = nvim_lsp[server_name],
      config = server_config,
    })
  end

  -- Standalone servers (nvim-lsp-installer does not have to worry about these)
  table.insert(servers, {
    instance = require("null-ls"),
    config = lrequire("lsp.servers.null-ls"),
  })

  -- Let nvim-lsp-installer register necessary hooks before any server is set up
  lsp_installer.setup({
    ensure_installed = server_names,
  })

  for _, server in ipairs(servers) do
    -- config overrides default_lsp_config
    server.instance.setup(vim.tbl_deep_extend("force", default.config, server.config))
  end

  -- Virtual text coloring
  -- Read: https://neovim.io/doc/user/lsp.html
  vim.cmd([[ hi LspDiagnosticsDefaultHint guifg='#A0A0A0' ]])
end
