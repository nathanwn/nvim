local dap = require("dap")
local dap_ui = require("dapui")
local dap_virtualtext = require("nvim-dap-virtual-text")

local dap_python = require("dap-python")
local dap_go = require("dap-go")

local which_key = require("which-key")

-- additional methods
dap.toggle_conditional_breakpoint = function()
  vim.ui.input({ prompt = "Breakpoint condition: " }, function(condition)
    dap.set_breakpoint(condition)
  end)
end

-- dapui
dap.listeners.after.event_initialized["dapui_config"] = function()
  dap_ui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dap_ui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dap_ui.close()
end

-- Key bindings
which_key.register({
  d = {
    name = "dap",
    b = { dap.toggle_breakpoint, "toggle breakpoint" },
    c = { dap.toggle_conditional_breakpoint, "toggle conditional breakpoint" },
    g = { dap.continue, "continue" },
    j = { dap.step_into, "step into" },
    k = { dap.step_out, "step out" },
    l = { dap.step_into, "step over" },
    r = { dap.repl.open, "open repl" },
    e = { dap_ui.eval, "ui eval" },
    x = { dap_ui.close, "ui close" },
  },
}, { prefix = "," })

for ft, debug_test_fn in pairs({
  python = dap_python.test_method,
  go = dap_go.debug_test,
}) do
  vim.api.nvim_create_autocmd("FileType", {
    pattern = ft,
    callback = vim.schedule_wrap(function()
      which_key.register({
        d = {
          name = "dap",
          t = { debug_test_fn, "debug test" },
        },
      }, { prefix = ",", buffer = 0 })
    end),
  })
end

-- Set up dap-related plugins
-- UI
dap_ui.setup({
  layouts = {
    {
      elements = {
        -- Elements can be strings or table with id and size keys.
        { id = "scopes", size = 0.25 },
        "breakpoints",
        "stacks",
        "watches",
        "repl",
      },
      size = 40, -- columns
      position = "left",
    },
    {
      elements = {
        "console",
      },
      size = 80, -- columns
      position = "right",
    },
  },
})
dap_virtualtext.setup()

-- Go
dap_go.setup()

-- Python
dap_python.test_runner = "pytest"
dap_python.setup(require("nathan-wien.utils").python_venv .. "/bin/python")
