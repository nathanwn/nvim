return function()
  vim.api.nvim_create_autocmd("FileType", {
    pattern = { "scala", "sbt" },
    callback = function()
      local metals = require("metals")
      local config = require("nathan-wien.plugins.lsp.servers.metals")
      metals.initialize_or_attach(config)
      -- Getting error messages for nvim-metals
      vim.opt_local.shortmess:remove("F")
    end,
    group = vim.api.nvim_create_augroup("nvim-metals", { clear = true }),
  })
end
