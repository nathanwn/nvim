return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = require("nathan-wien.plugins.treesitter.config.treesitter"),
  },
  {
    "nvim-treesitter/playground",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    config = require("nathan-wien.plugins.treesitter.config.playground"),
  },
}
