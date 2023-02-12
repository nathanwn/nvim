local metals = require("metals")

-- Override bare config
local default_config = require("nathan-wien.plugins.lsp.default.config")
local bare_config = metals.bare_config()
local config = vim.tbl_deep_extend("force", bare_config, default_config)

config.init_options.statusBarProvider = "on"

local telescope_metal_commands = require("telescope").extensions.metals.commands
local default_on_attach = require("nathan-wien.plugins.lsp.default.on_attach")

config.on_attach = function(client, bufnr)
  vim.keymap.set(
    "n",
    "<Leader>gs",
    telescope_metal_commands,
    { buffer = bufnr, desc = "[lsp] Commands" }
  )
  default_on_attach(client, bufnr)
end

return config
