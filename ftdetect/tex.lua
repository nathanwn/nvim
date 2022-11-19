local group = vim.api.nvim_create_augroup("FileTypeTex", { clear = true })
local options = {
  pattern = "*.tex",
  command = "set filetype=tex",
  group = group,
}
vim.api.nvim_create_autocmd("BufNewFile", options)
vim.api.nvim_create_autocmd("BufRead", options)
