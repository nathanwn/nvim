return function()
  vim.g.doge_enable_mappings = false
  vim.g.doge_doc_standard_python = "numpy"

  vim.keymap.set(
    "n",
    "<Leader>Dg",
    "<Plug>(doge-generate)",
    { desc = "[vim-doge] Generate comment" }
  )
  vim.keymap.set(
    "n",
    "<Leader>Dp",
    "<Plug>(doge-comment-jump-backward)",
    { desc = "[vim-doge] Jump backward" }
  )
  vim.keymap.set(
    "n",
    "<Leader>Dn",
    "<Plug>(doge-comment-jump-forward)",
    { desc = "[vim-doge] Jump forward" }
  )
end
