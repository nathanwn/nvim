local M = {}

M.config = function()
  require("lsp-inlayhints").setup({
    enabled_at_startup = false,
  })
end

return M
