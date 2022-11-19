return function()
  vim.cmd(
    [[ let g:pandoc#command#templates_file=expand("$HOME")."/.config/nvim/settings/vim-pandoc-templates" ]]
  )
  vim.cmd([[ let g:pandoc#spell#enabled = 0 ]])
end
