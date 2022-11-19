local luasnip = require("luasnip")

-- Snippet creator
-- s(trigger_string, node)
local s = luasnip.snippet

-- Format node
-- fmt(fmt_string, nodes...)
local fmt = require("luasnip.extras.fmt").fmt

-- Insert node
-- This node is used together with format
-- insert(position, [placeholder_text])
--   position: starts from 1
local i = luasnip.insert_node

--- Repeat node
-- This node replicates another node in a (previous) position
local rep = require("luasnip.extras").rep

return {
  s(
    "env",
    fmt(
      [[
  \begin{{{}}}
    {}
  \end{{{}}}
    ]],
      {
        i(1),
        i(2),
        rep(1),
      }
    )
  ),
  s(
    "item",
    fmt(
      [[
  \begin{{itemize}}
    \item {}
  \end{{itemize}}
    ]],
      {
        i(1),
      }
    )
  ),
  s("lstinline", fmt("\\lstinline{{{}}}", { i(1) })),
  s("cmd", fmt("\\{}{{{}}}", { i(1), i(2) })),
}
