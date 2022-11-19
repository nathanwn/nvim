require("nathan-wien.utils").editor.set_buf_indent(2)

local cmp = require("cmp")

cmp.setup.buffer({
  sources = cmp.config.sources({
    { name = "omni" },
  }),
})
