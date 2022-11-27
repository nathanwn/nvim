vim.api.nvim_create_autocmd("FileType", {
  pattern = { "scala", "sbt" },
  callback = function()
    if not pcall(require, "metals") then
      return
    end
    local metals = require("metals")
    local config = require("nathan-wien.lsp.servers.metals")
    metals.initialize_or_attach(config)
    -- Getting error messages for nvim-metals
    vim.opt_local.shortmess:remove("F")
  end,
  group = vim.api.nvim_create_augroup("nvim-metals", { clear = true }),
})
