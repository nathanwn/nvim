local function format()
  local win = vim.api.nvim_get_current_win()
  local filetype
  vim.api.nvim_win_call(win, function()
    filetype = vim.bo.filetype
  end)
  if filetype == "python" then
    vim.cmd("silent !pre-commit run black --files %")
  end
end

vim.api.nvim_create_user_command("F", format, {})
