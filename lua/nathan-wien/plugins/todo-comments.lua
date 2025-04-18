return {
  "folke/todo-comments.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  tag = "v1.4.0",
  event = "VimEnter",
  opts = {
    signs = false,
    -- Highlight the TODO(username) pattern
    -- See https://github.com/folke/todo-comments.nvim/issues/10#issuecomment-2446101986.
    search = { pattern = [[\b(KEYWORDS)(\([^\)]*\))?:]] },
    highlight = { pattern = [[.*<((KEYWORDS)%(\(.{-1,}\))?):]] },
  },
}
