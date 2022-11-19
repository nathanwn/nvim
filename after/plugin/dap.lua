-- UI
local dap = require("dap")
local dap_ui = require("dapui")
dap_ui.setup(require("nathan-wien.dap.ui").config)

dap.listeners.after.event_initialized["dapui_config"] = function()
  dap_ui.open({})
end
-- dap.listeners.before.event_terminated["dapui_config"] = function()
--   dap_ui.close()
-- end
-- dap.listeners.before.event_exited["dapui_config"] = function()
--   dap_ui.close()
-- end

-- Virtual text
require("nvim-dap-virtual-text").setup({})

-- Go
require("dap-go").setup()

-- Python
local dap_python = require("dap-python")
local dap_python_exec = (
  require("mason.settings").current.install_root_dir
  .. "/packages/debugpy/venv/bin/python"
)
dap_python.test_runner = "pytest"
dap_python.setup(dap_python_exec)

-- Keybinding
require("nathan-wien.dap.keymap").setup()
