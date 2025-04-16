local start_jdtls = function()
  local config = require("nathan-wien.plugins.lsp.servers.jdtls")
  require("jdtls").start_or_attach(config)
  vim.keymap.set("n", "<Leader>dt", function()
    require("jdtls").test_nearest_method()
  end, { desc = "debug test", buffer = 0 })
  vim.keymap.set("n", "<Leader>df", function()
    require("jdtls").test_class()
  end, { desc = "debug test class", buffer = 0 })
end

return function()
  if vim.env.JDTLS_OFF == nil then
    vim.api.nvim_create_autocmd("FileType", {
      pattern = { "java" },
      callback = start_jdtls,
      group = vim.api.nvim_create_augroup("jdtls", { clear = true }),
    })
  end
end

-- local jdtPlayCmd = "JdtPlay"

-- return function()
--   if vim.env.JDTLS_OFF == nil then
--   vim.api.nvim_create_autocmd("FileType", {
--     pattern = { "java" },
--     callback = function()
--       vim.api.nvim_create_user_command(jdtPlayCmd, start_jdtls, {})
--     end,
--     group = vim.api.nvim_create_augroup("jdtls", { clear = true }),
--   })
--   vim.keymap.set("n", "<Leader>gp", "<Cmd>" .. jdtPlayCmd .. "<CR>")
--   end
-- end
