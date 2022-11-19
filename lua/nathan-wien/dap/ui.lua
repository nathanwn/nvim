local M = {}

M.config = {
  layouts = {
    {
      elements = {
        "watches",
        "console",
        "repl",
      },
      size = 0.5,
      position = "right",
    },
    {
      elements = {
        -- Elements can be strings or table with id and size keys.
        -- { id = "scopes", size = 0.25 },
        "scopes",
        "breakpoints",
        "stacks",
      },
      size = 10, -- 0.0..1.0 for percentage, 1..100 for num rows/columns
      position = "bottom",
    },
  },
}

return M
