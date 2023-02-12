return function()
  local config = require("nathan-wien.plugins.lsp.servers.jdtls")

  vim.api.nvim_create_autocmd("FileType", {
    pattern = { "java" },
    callback = function()
      require("jdtls").start_or_attach(config)
      vim.keymap.set("n", "<Leader>dt", function()
        require("jdtls").test_nearest_method()
      end, { desc = "debug test", buffer = 0 })
      vim.keymap.set("n", "<Leader>df", function()
        require("jdtls").test_class()
      end, { desc = "debug test class", buffer = 0 })
    end,
    group = vim.api.nvim_create_augroup("jdtls", { clear = true }),
  })
end
