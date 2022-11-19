return function()
  -- git diff select left/right
  vim.keymap.set("n", "<Leader>g<", ":diffget //2<CR>")
  vim.keymap.set("n", "<Leader>g>", ":diffget //3<CR>")
end
