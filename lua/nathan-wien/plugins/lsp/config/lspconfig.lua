return function()
  local server_specs = require("nathan-wien.plugins.lsp.servers")
  local default_config = require("nathan-wien.plugins.lsp.server_config.config")

  for name, spec in pairs(server_specs) do
    if spec.enabled ~= false then
      local server = require("lspconfig")[name]
      local config = {}
      if spec.has_config == true then
        config = require(string.format("nathan-wien.plugins.lsp.servers.%s", name))
      end
      server.setup(vim.tbl_deep_extend("force", default_config, config))
    end
  end

  vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("kickstart-lsp-attach", { clear = true }),
    callback = function(event)
      local map = function(mode, keys, func, desc)
        vim.keymap.set(
          mode,
          keys,
          func,
          { buffer = event.buf, desc = "[lsp] " .. desc }
        )
      end
      local telescope_builtin = require("telescope.builtin")

      map("n", "<Leader>gd", vim.lsp.buf.definition, "Definition")

      map("n", "<Leader>gD", vim.lsp.buf.declaration, "Declaration")

      -- map("n", "<Leader>gi", vim.lsp.buf.implementation, "Implementation")
      map("n", "<Leader>gi", telescope_builtin.lsp_implementations, "Implementation")
      map("n", "<Leader>gu", telescope_builtin.lsp_references, "Usages/References")

      map("n", "<Leader>gt", vim.lsp.buf.type_definition, "Type Definition")

      map(
        "n",
        "<leader>gs",
        require("telescope.builtin").lsp_document_symbols,
        "Document Symbols"
      )

      map(
        "n",
        "<leader>gw",
        require("telescope.builtin").lsp_dynamic_workspace_symbols,
        "Workspace Symbols"
      )

      map("n", "<leader>gr", vim.lsp.buf.rename, "Rename")

      -- Execute a code action, usually your cursor needs to be on top of an error
      -- or a suggestion from your LSP for this to activate.
      map("n", "<leader>ga", vim.lsp.buf.code_action, "Code Action")

      map("n", "<leader>gk", vim.lsp.buf.hover, "Hover Documentation")

      map("n", "<C-k>", vim.lsp.buf.signature_help, "Signature Help")

      map("n", "<Leader>gl", vim.diagnostic.open_float, "Line diagnostic")

      map("n", "<Leader>[d", function()
        vim.diagnostic.jump({ count = -1, float = true })
      end, "Prev diagnostic")
      map("n", "<Leader>]d", function()
        vim.diagnostic.jump({ count = 1, float = true })
      end, "Next diagnostic")

      map("n", "<Leader>g*", function()
        vim.cmd("e" .. vim.lsp.get_log_path())
      end, "Get log path")

      local client = vim.lsp.get_client_by_id(event.data.client_id)

      if
        client
        and client:supports_method(
          vim.lsp.protocol.Methods.textDocument_inlayHint,
          event.buf
        )
      then
        map("n", "<leader>gn", function()
          vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = 0 }))
        end, "Inlay Hints")
      end

      -- The following two autocommands are used to highlight references of the
      -- word under your cursor when your cursor rests there for a little while.
      --    See `:help CursorHold` for information about when this is executed
      --
      -- When you move your cursor, the highlights will be cleared (the second autocommand).
      if
        client
        and client:supports_method(
          vim.lsp.protocol.Methods.textDocument_documentHighlight,
          event.buf
        )
      then
        local highlight_augroup =
          vim.api.nvim_create_augroup("kickstart-lsp-highlight", { clear = false })
        vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
          buffer = event.buf,
          group = highlight_augroup,
          callback = vim.lsp.buf.document_highlight,
        })

        vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
          buffer = event.buf,
          group = highlight_augroup,
          callback = vim.lsp.buf.clear_references,
        })

        vim.api.nvim_create_autocmd("LspDetach", {
          group = vim.api.nvim_create_augroup("kickstart-lsp-detach", { clear = true }),
          callback = function(event2)
            vim.lsp.buf.clear_references()
            vim.api.nvim_clear_autocmds({
              group = "kickstart-lsp-highlight",
              buffer = event2.buf,
            })
          end,
        })
      end
    end,
  })
end
