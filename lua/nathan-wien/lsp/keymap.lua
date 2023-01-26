local M = {}

M.setup = function(bufnr)
  local set_key = function(mode, key, handler, desc)
    vim.keymap.set(mode, key, handler, { buffer = bufnr, desc = "[lsp] " .. desc })
  end
  local telescope_builtin = require("telescope.builtin")

  set_key("n", "<Leader>gd", vim.lsp.buf.definition, "Definition")
  set_key("n", "<Leader>gD", vim.lsp.buf.declaration, "Declaration")
  set_key("n", "<Leader>gi", vim.lsp.buf.implementation, "Implementation")
  set_key("n", "<Leader>gt", vim.lsp.buf.type_definition, "Type definition")
  set_key("n", "<Leader>gu", telescope_builtin.lsp_references, "References/Usages")
  set_key("n", "<Leader>gr", vim.lsp.buf.rename, "Rename")
  set_key("n", "<Leader>gf", vim.lsp.buf.format, "Format")
  set_key("n", "<Leader>ga", vim.lsp.buf.code_action, "Code actions")
  set_key("i", "<C-k>", vim.lsp.buf.signature_help, "Signature help")
  set_key("n", "<Leader>gk", vim.lsp.buf.hover, "Hover")
  set_key("n", "<Leader>gl", vim.diagnostic.open_float, "Line diagnostic")
  set_key("n", "<Leader>gn", require("lsp-inlayhints").toggle, "Inlay hints")
  set_key("n", "[e", vim.diagnostic.goto_prev, "Prev diagnostic")
  set_key("n", "]e", vim.diagnostic.goto_next, "Next diagnostic")
  set_key("n", "<Leader>ge", telescope_builtin.diagnostics, "Diagnostics")
  set_key("n", "<Leader>gwa", vim.lsp.buf.add_workspace_folder, "Add workspace folder")
  set_key(
    "n",
    "<Leader>gwr",
    vim.lsp.buf.remove_workspace_folder,
    "Remove workspace folder"
  )
  set_key("n", "<Leader>gwl", function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, "List workspace folders")
  set_key("n", "<Leader>g*", function()
    vim.cmd("e" .. vim.lsp.get_log_path())
  end, "Get log path")
end

return M
