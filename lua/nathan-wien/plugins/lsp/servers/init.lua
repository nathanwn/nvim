local get_config = function(server_name)
  return require(string.format("nathan-wien.plugins.lsp.servers.%s", server_name))
end

local new_language_server = function(name, has_config)
  local config
  if has_config then
    config = get_config(name)
  else
    config = {}
  end

  return {
    name = name,
    config = config,
  }
end

local servers = {
  -- new_language_server("ansiblels"),
  new_language_server("bashls", true),
  new_language_server("clangd"),
  new_language_server("cmake", true),
  new_language_server("dockerls", true),
  -- new_language_server("esbonio", true),
  new_language_server("gopls", true),
  -- new_language_server("groovyls", true),
  new_language_server("lua_ls", true),
  new_language_server("prismals"),
  new_language_server("pyright", true),
  new_language_server("rust_analyzer", true),
  new_language_server("terraformls"),
  new_language_server("texlab", true),
  new_language_server("tsserver", true),
}

return servers
