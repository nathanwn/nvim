local nvim_lsp = require("lspconfig")

-- http://lua-users.org/wiki/SimpleLuaClasses
local LanguageServer = {
  name = nil,
  config = nil,
}

function LanguageServer:new(name, opt)
  opt = opt or {}
  local server = {}

  server.name = name

  local has_config, config = pcall(require, "nathan-wien.lsp.servers." .. name)
  if has_config then
    server.config = config
  else
    server.config = {}
  end

  if opt.noninstallable then
    server.installable = false
  else
    server.installable = true
  end

  if opt.instance then
    server.instance = opt.instance
  else
    server.instance = nvim_lsp[server.name]
  end

  setmetatable(server, self)
  self.__index = self

  return server
end

local servers = {
  -- Ansible
  LanguageServer:new("ansiblels"),
  -- Bash
  LanguageServer:new("bashls"),
  -- Clangd
  LanguageServer:new("clangd"),
  -- Cmake
  LanguageServer:new("cmake"),
  -- Dockerfile
  LanguageServer:new("dockerls"),
  -- Go
  LanguageServer:new("gopls"),
  -- Groovy
  LanguageServer:new("groovyls"),
  LanguageServer:new("golangci_lint_ls"),
  -- JS/TS
  LanguageServer:new("tsserver"),
  -- Lua
  LanguageServer:new("sumneko_lua"),
  -- JSON: jsonls
  -- Prisma
  LanguageServer:new("prismals"),
  -- Python
  LanguageServer:new("pyright"),
  -- Terraform
  LanguageServer:new("terraformls"),
  -- Tex
  LanguageServer:new("texlab"),
  -- Yaml
  -- LanguageServer:new("yamlls"),
  -- null-ls
  LanguageServer:new("null-ls", {
    instance = require("null-ls"),
  }),
}

return servers
