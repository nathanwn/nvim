local M = {}

local default_on_attach = function(client, bufnr)
  vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
  require("nathan-wien.plugins.lsp.keymap").setup(bufnr)
  if client.server_capabilities.documentFormattingProvider then
    vim.cmd([[
      augroup lsp_buf_format
          autocmd! * <buffer>
          autocmd BufWritePre <buffer> :lua vim.lsp.buf.format()
      augroup END
    ]])
  end
  if client.server_capabilities.documentHighlightProvider then
    vim.cmd([[
      augroup lsp_document_highlight
        autocmd! * <buffer>
        autocmd CursorHold <buffer> :lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> :lua vim.lsp.buf.clear_references()
      augroup END
    ]])
  end
  if client.server_capabilities.documentSymbolProvider then
    require("nvim-navic").attach(client, bufnr)
  end
  require("lsp-inlayhints").on_attach(client, bufnr)
end

M.create = function(opts)
  opts = opts or {}
  return function(client, bufnr)
    if opts.pre_attach then
      opts.pre_attach(client, bufnr)
    end

    if not opts.formatting then
      client.server_capabilities.documentFormattingProvider = false
      client.server_capabilities.documentRangeFormattingProvider = false
    end

    default_on_attach(client, bufnr)
  end
end

return M
