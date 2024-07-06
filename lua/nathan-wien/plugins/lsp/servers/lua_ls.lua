local on_attach = require("nathan-wien.plugins.lsp.server_config.on_attach")

return {
  -- cmd = { sumneko_binary, "-E", sumneko_root_path .. "/main.lua" },
  settings = {
    Lua = {
      completion = {
        callSnippet = "Replace",
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = { "vim" },
      },
      -- Inlay hints
      -- hint = { enable = true },
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = "LuaJIT",
        -- Setup your lua path
        -- path = runtime_path,
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
      workspace = {
        -- Suppress the following questions:
        -- - "Do you need to configure your work environment as luaassert?"
        -- - "Do you need to configure your work environment as luv?"
        -- https://github.com/LunarVim/LunarVim/issues/4049#issuecomment-1798767366
        checkThirdParty = "Disable",
        -- Make the server aware of Neovim runtime files
        library = {
          vim.env.VIMRUNTIME,
          "${3rd}/luv/library",
          -- "${3rd}/busted/library",
        },
        -- or pull in all of 'runtimepath'. NOTE: this is a lot slower
        -- library = vim.api.nvim_get_runtime_file("", true)
      },
    },
  },
  on_attach = on_attach.create({
    formatting = false,
  }),
}
