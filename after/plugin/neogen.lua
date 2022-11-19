local neogen = require("neogen")

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
