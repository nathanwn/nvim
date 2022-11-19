local bare_config = require("metals").bare_config()
local default_config = require("nathan-wien.lsp.config")
local config = vim.tbl_deep_extend("force", bare_config, default_config)

config.init_options.statusBarProvider = "on"
config.on_attach = function(client, bufnr)
  require("nathan-wien.lsp.default").on_attach_run_always(client, bufnr)
end

return config
