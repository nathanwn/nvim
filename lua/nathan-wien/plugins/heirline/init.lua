local config = function()
  vim.api.nvim_create_autocmd("User", {
    pattern = "HeirlineInitWinbar",
    callback = function(args)
      local buf = args.buf
      local buftype = vim.tbl_contains(
        { "prompt", "nofile", "help", "quickfix" },
        vim.bo[buf].buftype
      )
      local filetype =
        vim.tbl_contains({ "gitcommit", "fugitive" }, vim.bo[buf].filetype)
      if buftype or filetype then
        vim.opt_local.winbar = nil
      end
    end,
  })

  require("heirline").setup({
    statusline = require("nathan-wien.plugins.heirline.statusline"),
    winbar = require("nathan-wien.plugins.heirline.winbar"),
  })
end

return {
  "rebelot/heirline.nvim",
  dependencies = {
    "catppuccin",
    "SmiteshP/nvim-navic",
  },
  config = config,
}
