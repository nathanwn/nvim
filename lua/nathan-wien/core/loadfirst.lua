vim.g.python3_host_prog = require("nathan-wien.utils").python_venv .. "/bin/python3"

-- Concise way to escape termcodes
local function t(str)
  -- Adjust boolean arguments as needed
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

vim.g.mapleader = t("<Space>")
vim.g.maplocalleader = t("<Space>")
