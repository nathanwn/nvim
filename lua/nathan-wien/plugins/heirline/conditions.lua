local M = {}

M.view_is_full = function()
  return vim.o.columns >= 120
end

return M
