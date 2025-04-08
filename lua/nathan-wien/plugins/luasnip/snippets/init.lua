local luasnip = require("luasnip")

-- Snippet creator
-- s(trigger_string, node)
-- local s = luasnip.snippet

-- Format node
-- fmt(fmt_string, nodes...)
-- local fmt = require("luasnip.extras.fmt").fmt

-- Insert node
-- This node is used together with format
-- insert(position, [placeholder_text])
--   position: starts from 1
-- local i = luasnip.insert_node

--- Repeat node
-- This node replicates another node in a (previous) position
-- local rep = require("luasnip.extras").rep

-- luasnip.add_snippets("all", {})

luasnip.add_snippets(
  "markdown",
  require("nathan-wien.plugins.luasnip.snippets.markdown")
)
luasnip.add_snippets("python", require("nathan-wien.plugins.luasnip.snippets.python"))
luasnip.add_snippets("tex", require("nathan-wien.plugins.luasnip.snippets.tex"))
