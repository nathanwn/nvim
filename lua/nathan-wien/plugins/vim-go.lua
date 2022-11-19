return function()
  vim.g.go_def_mode = "gopls"
  vim.g.go_info_mode = "gopls"
  vim.g.go_def_mapping_enabled = false -- prevent conflict with coc/lsp
end
