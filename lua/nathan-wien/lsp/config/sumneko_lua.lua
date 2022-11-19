-- -- Custom server
-- local sumneko_root_path = vim.fn.getenv("HOME")
--   .. "/bin/lang-servers/lua-language-server"
-- local os = nil
-- if vim.loop.os_uname().sysname == "Darwin" then
--   os = "macOS"
-- elseif string.find(vim.loop.os_uname().release, "WSL2") then
--   os = ""
-- else
--   os = "Linux"
-- end
-- local sumneko_binary = sumneko_root_path .. "/bin/" .. os .. "/lua-language-server"
--
-- -- Make runtime files discoverable to the server
-- local runtime_path = vim.split(package.path, ";")
-- table.insert(runtime_path, "lua/?.lua")
-- table.insert(runtime_path, "lua/?/init.lua")

return {
  -- cmd = { sumneko_binary, "-E", sumneko_root_path .. "/main.lua" },
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = "LuaJIT",
        -- Setup your lua path
        -- path = runtime_path,
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = { "vim" },
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  },
}
