local M = {}

M.editor = {}

M.editor.set_buf_indent = function(tabsize)
  vim.bo.tabstop = tabsize
  vim.bo.shiftwidth = tabsize
  vim.bo.softtabstop = tabsize
end

M.python_venv = vim.fs.joinpath(vim.fn.stdpath("data") .. "py-venv")

M.get_sdk_java_home = function(java_version)
  local java_dirs = vim.split(
    vim.fn.glob(
      vim.fs.joinpath(
        vim.env.HOME,
        ".sdkman",
        "candidates",
        "java",
        tostring(java_version) .. "*"
      )
    ),
    "\n"
  )
  table.sort(java_dirs, function(p1, p2)
    return p1 > p2
  end)
  local java_home = java_dirs[1]
  return java_home
end

M.get_java_exec = function(java_version)
  local java_home = M.get_sdk_java_home(java_version)
  if java_home == nil then
    return nil
  end
  return vim.fs.joinpath(java_home, "bin", "java")
end

return M
