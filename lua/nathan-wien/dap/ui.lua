local M = {}

M.config = {
  layouts = {
    {
      elements = {
        -- Elements can be strings or table with id and size keys.
        { id = "scopes", size = 0.25 },
        "breakpoints",
        "stacks",
        "watches",
      },
      size = 10, -- 0.0..1.0 for percentage, 1..100 for num rows/columns
      position = "bottom",
    },
    {
      elements = {
        "console",
        "repl",
      },
      size = 0.3,
      position = "right",
    },
  },
}

return M
