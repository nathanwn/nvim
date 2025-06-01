return function()
  local dap = require("dap")
  local dapui = require("dapui")

  dapui.setup()

  dap.listeners.before.attach.dapui_config = function()
    dapui.open()
  end
  dap.listeners.before.launch.dapui_config = function()
    dapui.open()
  end
  dap.listeners.before.event_terminated.dapui_config = function()
    dapui.close()
  end
  dap.listeners.before.event_exited.dapui_config = function()
    dapui.close()
  end
  vim.fn.sign_define("DapBreakpoint", {
    text = "B",
    texthl = "DiagnosticError",
    linehl = "DapUIBreakpointsLine",
    numhl = "DapUIBreakpointsLine",
  })

  -- https://github.com/mfussenegger/nvim-dap/wiki/Java
  dap.configurations.java = {
    {
      type = "java",
      request = "attach",
      name = "Debug (Attach) - Remote",
      hostName = vim.env.WSL2_JVM_DEBUG_HOST or "127.0.0.1",
      port = 5005,
    },
  }
end
