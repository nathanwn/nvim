return function()
  require("dap-python").test_runner = "pytest"
  require("dap-python").setup(require("nathan-wien.utils").python_venv .. "/bin/python")
end
