local dap = require("dap")
local dap_go = require("dap-go")
local dap_python = require("dap-python")

local M = {}

M.toggle_conditional_breakpoint = function()
  vim.ui.input({ prompt = "Breakpoint condition: " }, function(condition)
    dap.set_breakpoint(condition)
  end)
end

M.test = {
  method = {
    go = dap_go.debug_test,
    java = require("jdtls").test_nearest_method,
    python = dap_python.test_method,
  },
  file = {
    java = require("jdtls").test_class,
  },
}

return M
