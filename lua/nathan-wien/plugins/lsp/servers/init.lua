local server_specs = {
  bashls = {
    has_config = true,
    enabled = vim.fn.executable("npm") == 1,
  },
  clangd = {},
  cmake = {},
  dockerls = {
    has_config = true,
    enabled = vim.fn.executable("npm") == 1,
  },
  esbonio = {
    has_config = true,
  },
  gopls = {
    has_config = true,
    enabled = vim.fn.executable("go") == 1,
  },
  gradle_ls = {
    has_config = true,
  },
  lua_ls = {
    has_config = true,
  },
  pyright = {
    has_config = true,
    enabled = vim.fn.executable("npm") == 1,
  },
  rust_analyzer = {
    has_config = true,
    enabled = vim.fn.executable("cargo") == 1,
  },
  texlab = {
    has_config = true,
    enabled = vim.fn.executable("cargo") == 1,
  },
  tsserver = {
    has_config = true,
    enabled = vim.fn.executable("npm") == 1,
  },
}

return server_specs
