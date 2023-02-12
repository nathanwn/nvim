return {
  {
    "<Leader>db",
    function()
      require("dap").toggle_breakpoint()
    end,
    desc = "toggle breakpoint",
  },
  {
    "<Leader>dc",
    function()
      vim.ui.input({ prompt = "Breakpoint condition: " }, function(condition)
        require("dap").set_breakpoint(condition)
      end)
    end,
    desc = "toggle conditional breakpoint",
  },
  {
    "<Leader>dg",
    function()
      require("dap").continue()
    end,
    desc = "continue",
  },
  {
    "<Leader>dj",
    function()
      require("dap").step_into()
    end,
    desc = "step into",
  },
  {
    "<Leader>dk",
    function()
      require("dap").step_out()
    end,
    desc = "step out",
  },
  {
    "<Leader>dl",
    function()
      require("dap").step_into()
    end,
    desc = "step over",
  },
  {
    "<Leader>dr",
    function()
      require("dap").repl.open()
    end,
    desc = "open repl",
  },
  {
    "<Leader>de",
    function()
      require("dapui").eval()
    end,
    desc = "ui eval",
  },
  {
    "<Leader>dq",
    function()
      require("dapui").close()
    end,
    desc = "ui close",
  },
}
