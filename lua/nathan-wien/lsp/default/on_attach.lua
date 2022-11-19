return function(client, bufnr)
  vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
  require("nathan-wien.lsp.keymap").map(bufnr)
  if client.server_capabilities.document_formatting then
    vim.cmd([[
      augroup lsp_buf_format
          autocmd! * <buffer>
          autocmd BufWritePre <buffer> :lua vim.lsp.buf.format()
      augroup END
    ]])
  end
  if client.server_capabilities.document_highlight then
    vim.cmd([[
      augroup lsp_document_highlight
        autocmd! * <buffer>
        autocmd CursorHold <buffer> :lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> :lua vim.lsp.buf.clear_references()
      augroup END
    ]])
  end
end
