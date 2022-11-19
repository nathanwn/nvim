vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  pattern = { "*.tex" },
  command = [[%s/\s\+$//e]],
  group = vim.api.nvim_create_augroup("RemoveTrailingWhitespaces", { clear = true }),
})
