local neogen = require("neogen")
local which_key = require("which-key")

local docstring_generator_factory = function(type)
  local generator = function()
    require("neogen").generate({ type = type })
  end
  return { generator, type }
end

which_key.register({
  c = {
    name = "neogen docstring",
    f = docstring_generator_factory("func"),
    m = docstring_generator_factory("file"),
    t = docstring_generator_factory("type"),
    c = docstring_generator_factory("class"),
  },
}, { prefix = "," })

-- for more template configurations, see the language's configuration file in configurations/{lang}.lua
neogen.setup({
  enabled = true,
  languages = {
    python = {
      template = {
        annotation_convention = "numpydoc",
      },
    },
  },
})
