local nvim_lsp = require("lspconfig")
local lrequire = require("nathan-wien.utils").local_require

-- http://lua-users.org/wiki/SimpleLuaClasses
LanguageServer = {
  name = nil,
  config = nil,
}
LanguageServer.__index = LanguageServer

function LanguageServer:new(name, opt)
  opt = opt or {}
  local server = {}
  setmetatable(server, LanguageServer)
  server.name = name
  if opt.has_custom_config then
    server.config = lrequire("lsp.servers." .. name)
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
  return server
end

return {
  -- Bash
  LanguageServer:new("bashls", {
    has_custom_config = true,
  }),
  -- Clangd
  LanguageServer:new("clangd"),
  -- Cmake
  LanguageServer:new("cmake", {
    has_custom_config = true,
  }),
  -- Dockerfile
  LanguageServer:new("dockerls"),
  -- Go
  LanguageServer:new("gopls", {
    has_custom_config = true,
  }),
  -- Groovy
  LanguageServer:new("groovyls"),
  LanguageServer:new("golangci_lint_ls"),
  -- JS/TS
  LanguageServer:new("tsserver", {
    has_custom_config = true,
  }),
  -- Lua
  LanguageServer:new("sumneko_lua", {
    has_custom_config = true,
  }),
  -- JSON: jsonls
  -- Prisma
  LanguageServer:new("prismals"),
  -- Python
  LanguageServer:new("pyright", {
    has_custom_config = true,
  }),
  -- Terraform
  LanguageServer:new("terraformls"),
  -- Tex
  LanguageServer:new("texlab"),
  -- Yaml
  LanguageServer:new("yamlls", {
    has_custom_config = true,
  }),
  -- null-ls
  LanguageServer:new("null-ls", {
    has_custom_config = true,
    noninstallable = true,
    instance = require("null-ls"),
  }),
}
