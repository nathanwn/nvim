vim.api.nvim_create_autocmd("FileType", {
  pattern = { "souffle" },
  callback = function()
    local homedir = Path.new(vim.fn.getenv("HOME"))
    local project_dir = homedir:joinpath("dev", "personal", "souffle-analyzer")
    local cmd = {
      tostring(project_dir:joinpath(".venv", "bin", "souffle-analyzer")),
      "server",
      "--verbose",
      "--log-file",
      -- tostring(homedir:joinpath(".local","state", "souffle-language-server", "tmp.log")),
      tostring(project_dir:joinpath("log", "tmp.log")),
    }
    vim.lsp.start({
      name = "souffle-analyzer",
      cmd = cmd,
      root_dir = vim.fs.dirname(vim.fs.find({ ".git" }, { upward = true })[1]),
    })
  end,
})

vim.api.nvim_create_autocmd("LspAttach", {
  pattern = { "*.dl" },
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    local bufnr = args.buf
    local on_attach =
      require("nathan-wien.plugins.lsp.server_config.on_attach").create()
    on_attach(client, bufnr)
  end,
})
