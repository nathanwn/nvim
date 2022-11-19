if not pcall(require, "metals") then
  return
end

local metals = require("metals")
local config = require("nathan-wien.lsp.config.metals")

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "scala", "sbt" },
  callback = function()
    metals.setup_dap()
    metals.initialize_or_attach(config)
  end,
  group = vim.api.nvim_create_augroup("nvim-metals", { clear = true }),
})

-- TODO: add keymap for `require("telescope").extensions.metals.commands()`
