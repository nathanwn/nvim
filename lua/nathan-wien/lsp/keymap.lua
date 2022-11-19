local M = {}

M.map = function(bufnr)
  local set = function(mode, key, handler, desc)
    vim.keymap.set(mode, key, handler, { buffer = bufnr, desc = "[lsp] " .. desc })
  end
  local telescope_builtin = require("telescope.builtin")

  set("n", "<Leader>gd", vim.lsp.buf.definition, "Go to definition")
  set("n", "<Leader>gD", vim.lsp.buf.declaration, "Go to declaration")
  set("n", "<Leader>gi", vim.lsp.buf.implementation, "Go to implementation")
  set("n", "<Leader>gt", vim.lsp.buf.type_definition, "Go to type definition")
  set("n", "<Leader>gr", telescope_builtin.lsp_references, "Go to references")
  set("n", "<Leader>rn", vim.lsp.buf.rename, "Rename")
  set("n", "<Leader>fm", vim.lsp.buf.format, "Format")
  set("n", "<Leader>ca", vim.lsp.buf.code_action, "Code action")
  set("i", "<C-h>", vim.lsp.buf.signature_help, "Signature help")
  set("n", "K", vim.lsp.buf.hover, "Hover")
  set("n", "?", vim.diagnostic.open_float, "Open float")
  set("n", "<Leader>[e", vim.diagnostic.goto_prev, "Go to prev diagnostic")
  set("n", "<Leader>]e", vim.diagnostic.goto_next, "Go to next diagnostic")
  set("n", "<Leader>ge", telescope_builtin.diagnostics, "Find diagnostics")
  set("n", "<Leader>gq", vim.diagnostic.setloclist, "List diagnostics in quickfix")
  set("n", "<Leader>wa", vim.lsp.buf.add_workspace_folder, "Add workspace folder")
  set("n", "<Leader>wr", vim.lsp.buf.remove_workspace_folder, "Remove workspace folder")
  set("n", "<Leader>wl", function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, "List workspace folders")
  set("n", "<Leader>g*", function()
    vim.cmd("e" .. vim.lsp.get_log_path())
  end, "Get log path")
end

return M
