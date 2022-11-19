local which_key = require("which-key")

local neogen_factory = function(type)
  return function()
    require("neogen").generate({ type = type })
  end
end

which_key.register({
  d = {
    name = "neogen docstring",
    f = { neogen_factory("func"), "func" },
    m = { neogen_factory("file"), "file" },
    t = { neogen_factory("type"), "type" },
    c = { neogen_factory("class"), "class" },
  },
}, { prefix = "<leader>k" })
