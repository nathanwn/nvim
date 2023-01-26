return {
  cmd = { "gopls", "--remote=auto" },
  settings = {
    gopls = {
      hints = {
        assignVariableTypes = true,
        -- compositeLiteralFields = true,
        -- compositeLiteralTypes = true,
        constantValues = true,
        functionTypeParameters = true,
        -- parameterNames = true,
        -- rangeVariableTypes = true,
      },
    },
  },
}
