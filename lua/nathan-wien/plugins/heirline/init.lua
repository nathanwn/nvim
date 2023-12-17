local config = function()
  require("heirline").setup({
    statusline = require("nathan-wien.plugins.heirline.statusline"),
    winbar = require("nathan-wien.plugins.heirline.winbar"),
    opts = {
      -- if the callback returns true, the winbar will be disabled for that window
      -- the args parameter corresponds to the table argument passed to autocommand callbacks.
      -- :h nvim_lua_create_autocmd()
      disable_winbar_cb = function(args)
        local buf = args.buf
        local buftype = vim.tbl_contains(
          { "prompt", "nofile", "help", "quickfix" },
          vim.bo[buf].buftype
        )
        local filetype = vim.tbl_contains(
          { "gitcommit", "fugitive", "Trouble", "packer" },
          vim.bo[buf].filetype
        )
        return buftype or filetype
      end,
    },
  })
end

return {
  "rebelot/heirline.nvim",
  version = "v1.0.1",
  dependencies = {
    "catppuccin",
    "SmiteshP/nvim-navic",
  },
  config = config,
}
