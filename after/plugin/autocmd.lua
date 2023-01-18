vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  command = [[%s/\s\+$//e]],
  group = vim.api.nvim_create_augroup("RemoveTrailingWhitespaces", { clear = true }),
})
