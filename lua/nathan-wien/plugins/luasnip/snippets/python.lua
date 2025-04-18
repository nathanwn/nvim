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
-- local rep = require("luasnip.extras").rep

return {
  s(
    "<<<main",
    fmt(
      [[
def main():
    {}
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
    ]],
      { i(1) }
    )
  ),
}
