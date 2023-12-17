local metals = require("metals")

-- Override bare config
local default_config = require("nathan-wien.plugins.lsp.server_config.config")
local on_attach = require("nathan-wien.plugins.lsp.server_config.on_attach")

local bare_config = metals.bare_config()
local config = vim.tbl_deep_extend("force", bare_config, default_config)
config.init_options.statusBarProvider = "on"

config.on_attach = on_attach.create({
  pre_attach = function(_client, bufnr)
    vim.keymap.set(
      "n",
      "<Leader>gs",
      require("telescope").extensions.metals.commands,
      { buffer = bufnr, desc = "[lsp] Commands" }
    )
  end,
})

return config
