local M = {}

M.on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

  -- Mappings
  vim.keymap.set(
    "n",
    "<Leader>gd",
    vim.lsp.buf.definition,
    { buffer = 0, desc = "[lsp] Go to definition" }
  )
  vim.keymap.set(
    "n",
    "<Leader>gD",
    vim.lsp.buf.declaration,
    { buffer = 0, desc = "[lsp] Go to declaration" }
  )
  vim.keymap.set(
    "n",
    "<Leader>gi",
    vim.lsp.buf.implementation,
    { buffer = 0, desc = "[lsp] Go to implementation" }
  )
  vim.keymap.set(
    "n",
    "<Leader>gt",
    vim.lsp.buf.type_definition,
    { buffer = 0, desc = "[lsp] Go to type definition" }
  )
  vim.keymap.set(
    "n",
    "<Leader>rn",
    vim.lsp.buf.rename,
    { buffer = 0, desc = "[lsp] Rename" }
  )
  vim.keymap.set(
    "n",
    "<Leader>fm",
    vim.lsp.buf.format,
    { buffer = 0, desc = "[lsp] Format" }
  )
  vim.keymap.set(
    "n",
    "<Leader>ca",
    vim.lsp.buf.code_action,
    { buffer = 0, desc = "[lsp] Code action" }
  )

  vim.keymap.set(
    "i",
    "<C-h>",
    vim.lsp.buf.signature_help,
    { buffer = 0, desc = "[lsp] Signature help" }
  )
  vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = 0, desc = "[lsp] Hover" })

  vim.keymap.set(
    "n",
    "<Leader>gl",
    vim.diagnostic.open_float,
    { buffer = 0, desc = "[lsp] Open float" }
  )
  vim.keymap.set(
    "n",
    "<Leader>[d",
    vim.diagnostic.goto_prev,
    { buffer = 0, desc = "[lsp] Diagnostic - Go to prev" }
  )
  vim.keymap.set(
    "n",
    "<Leader>]d",
    vim.diagnostic.goto_next,
    { buffer = 0, desc = "[lsp] Diagnostic - Go to next" }
  )
  vim.keymap.set("n", "<Leader>gq", vim.diagnostic.setloclist, { buffer = 0 })

  vim.keymap.set("n", "<Leader>wa", vim.lsp.buf.add_workspace_folder, { buffer = 0 })
  vim.keymap.set("n", "<Leader>wr", vim.lsp.buf.remove_workspace_folder, { buffer = 0 })
  vim.keymap.set("n", "<Leader>wl", function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, { buffer = 0 })
  vim.keymap.set("n", "<Leader>gr", vim.lsp.buf.references, { buffer = 0 })
  vim.keymap.set("n", "<Leader>g*", function()
    vim.cmd("e" .. vim.lsp.get_log_path())
  end, { buffer = 0 })

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

M.config = {
  flags = {
    debounce_text_changes = 150,
  },
  capabilities = require("cmp_nvim_lsp").update_capabilities(
    vim.lsp.protocol.make_client_capabilities()
  ),
  on_attach = M.on_attach,
}

return M
