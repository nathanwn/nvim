return function()
  local dap = require("dap")

  -- Read .vscode/launch.json
  require("dap.ext.vscode").load_launchjs()

  -- Set-up dap-ui
  local dap_ui = require("dapui")

  dap.listeners.after.event_initialized["dapui_config"] = function()
    dap_ui.open({})
  end
  -- dap.listeners.before.event_terminated["dapui_config"] = function()
  --   dap_ui.close()
  -- end
  -- dap.listeners.before.event_exited["dapui_config"] = function()
  --   dap_ui.close()
  -- end

  require("dapui").setup({
    {
      elements = {
        "watches",
        "console",
        "repl",
      },
      size = 0.5,
      position = "right",
    },
    {
      elements = {
        -- Elements can be strings or table with id and size keys.
        -- { id = "scopes", size = 0.25 },
        "scopes",
        "breakpoints",
        "stacks",
      },
      size = 10, -- 0.0..1.0 for percentage, 1..100 for num rows/columns
      position = "bottom",
    },
  })
end
