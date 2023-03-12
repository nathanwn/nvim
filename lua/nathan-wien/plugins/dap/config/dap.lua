return function()
  local dap = require("dap")

  -- Read .vscode/launch.json
  require("dap.ext.vscode").load_launchjs()

  -- Set-up dap-ui
  require("dapui").setup({
    layouts = {
      {
        elements = {
          -- { id = "scopes", },
          {
            id = "breakpoints",
            size = 0.20,
          },
          {
            id = "stacks",
            size = 0.40,
          },
          {
            id = "watches",
            size = 0.40,
          },
        },
        position = "right",
        size = 0.32,
      },
      {
        elements = {
          {
            id = "repl",
            size = 0.5,
          },
          {
            id = "console",
            size = 0.5,
          },
        },
        position = "bottom",
        size = 12,
      },
    },
  })

  dap.listeners.after.event_initialized["dapui_config"] = function()
    require("dapui").open()
  end
  -- dap.listeners.before.event_terminated["dapui_config"] = function()
  --   dap_ui.close()
  -- end
  -- dap.listeners.before.event_exited["dapui_config"] = function()
  --   dap_ui.close()
  -- end
end
