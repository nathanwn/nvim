return function()
  local lsp_servers = require("nathan-wien.plugins.lsp.servers")
  local default_config = require("nathan-wien.plugins.lsp.server_config.config")

  for _, server in ipairs(lsp_servers) do
    -- config overrides default_lsp_config
    local instance = require("lspconfig")[server.name]
    instance.setup(vim.tbl_deep_extend("force", default_config, server.config))
  end

  -- Diagnostic filter
  -- Credit: https://github.com/neovim/nvim-lspconfig/issues/726#issuecomment-1075539112
  local filter = function(arr, func)
    -- Filter in place
    -- https://stackoverflow.com/questions/49709998/how-to-filter-a-lua-array-inplace
    local new_index = 1
    local size_orig = #arr
    for old_index, v in ipairs(arr) do
      if func(v, old_index) then
        arr[new_index] = v
        new_index = new_index + 1
      end
    end
    for i = new_index, size_orig do
      arr[i] = nil
    end
  end

  local filter_diagnostics = function(diagnostic)
    -- Only filter out Pyright stuff for now
    if diagnostic.source ~= "Pyright" then
      return true
    end

    -- Allow kwargs to be unused, sometimes you want many functions to take the
    -- same arguments but you don't use all the arguments in all the functions,
    -- so kwargs is used to suck up all the extras
    if diagnostic.message == '"kwargs" is not accessed' then
      return false
    end

    -- Allow variables starting with an underscore
    if string.match(diagnostic.message, '"_.+" is not accessed') then
      return false
    end

    return true
  end

  local custom_on_publish_diagnostics = function(_, result, ctx, config)
    filter(result.diagnostics, filter_diagnostics)
    vim.lsp.diagnostic.on_publish_diagnostics(_, result, ctx, config)
  end

  vim.lsp.handlers["textDocument/publishDiagnostics"] =
    vim.lsp.with(custom_on_publish_diagnostics, {})

  vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("kickstart-lsp-attach", { clear = true }),
    callback = function(event)
      vim.api.nvim_buf_set_option(event.buf, "omnifunc", "v:lua.vim.lsp.omnifunc")

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

      map("n", "<Leader>g*", function()
        vim.cmd("e" .. vim.lsp.get_log_path())
      end, "Get log path")

      local client = vim.lsp.get_client_by_id(event.data.client_id)

      if
        client
        and client.server_capabilities.inlayHintProvider
        and vim.lsp.inlay_hint
      then
        map("<leader>gn", function()
          vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
        end, "Inlay Hints")
      end

      -- The following two autocommands are used to highlight references of the
      -- word under your cursor when your cursor rests there for a little while.
      --    See `:help CursorHold` for information about when this is executed
      -- When you move your cursor, the highlights will be cleared (the second autocommand).
      if client and client.server_capabilities.documentHighlightProvider then
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
