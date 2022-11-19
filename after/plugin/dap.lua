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
  dap_ui.open({})
end
-- dap.listeners.before.event_terminated["dapui_config"] = function()
--   dap_ui.close()
-- end
-- dap.listeners.before.event_exited["dapui_config"] = function()
--   dap_ui.close()
-- end

local debug_test_methods = {
  go = dap_go.debug_test,
  java = require("jdtls").test_nearest_method,
  python = dap_python.test_method,
}

local debug_test_file_methods = {
  java = require("jdtls").test_class,
}

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

for ft, test_method in pairs(debug_test_methods) do
  vim.api.nvim_create_autocmd("FileType", {
    pattern = ft,
    callback = vim.schedule_wrap(function()
      which_key.register({
        d = {
          name = "dap",
          t = { test_method, "debug test" },
        },
      }, { prefix = ",", buffer = 0 })
    end),
  })
end

for ft, test_method in pairs(debug_test_file_methods) do
  vim.api.nvim_create_autocmd("FileType", {
    pattern = ft,
    callback = vim.schedule_wrap(function()
      which_key.register({
        d = {
          name = "dap",
          f = { test_method, "debug test file" },
        },
      }, { prefix = ",", buffer = 0 })
    end),
    group = vim.api.nvim_create_augroup("dap-" .. ft, { clear = true }),
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
      },
      size = 40, -- columns
      position = "left",
    },
    {
      elements = {
        "repl",
        "console",
      },
      size = 0.36, -- percentage
      position = "bottom",
    },
  },
})
dap_virtualtext.setup({})

-- Go
dap_go.setup()

-- Python
dap_python.test_runner = "pytest"
dap_python.setup(require("nathan-wien.utils").python_venv .. "/bin/python")
