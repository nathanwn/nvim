local M = {}

M.editor = {}

M.editor.set_buf_indent = function(tabsize)
  vim.bo.tabstop = tabsize
  vim.bo.shiftwidth = tabsize
  vim.bo.softtabstop = tabsize
end

M.python_venv = vim.fn.stdpath("data") .. "/py-venv"

return M
