if not pcall(require, "jdtls") then
  return
end

local config = require("nathan-wien.lsp.servers.jdtls")

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "java" },
  callback = function()
    require("jdtls").start_or_attach(config)
  end,
  group = vim.api.nvim_create_augroup("jdtls", { clear = true }),
})
