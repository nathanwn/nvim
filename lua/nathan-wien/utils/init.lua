local M = {}

M.editor = {}

M.editor.set_buf_indent = function(tabsize)
  vim.bo.tabstop = tabsize
  vim.bo.shiftwidth = tabsize
  vim.bo.softtabstop = tabsize
end

M.local_require = function(path)
  return require("nathan-wien." .. path)
end

M.local_dir_path = vim.fn.getenv("HOME") .. "/.local/share/nvim"
M.python_venv = vim.fn.getenv("HOME") .. "/.local/share/nvim/venv"

M.deep_copy = function(original)
  local copy = {}
  for k, v in pairs(original) do
    if type(v) == "table" then
      v = M.deep_copy(v)
    end
    copy[k] = v
  end
  return copy
end

return M
