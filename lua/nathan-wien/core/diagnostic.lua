vim.diagnostic.config({
  virtual_text = {
    severity = {
      min = vim.diagnostic.severity.WARN,
    },
    severity_sort = true,
  },

  signs = {
    severity = {
      min = vim.diagnostic.severity.INFO,
    },
    severity_sort = true,
  },
})
