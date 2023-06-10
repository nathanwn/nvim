local Path = require("plenary.path")

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "souffle" },
  callback = function()
    local homedir = Path.new(vim.fn.getenv("HOME"))
    -- Use sdkman to manage java versions
    local java_version = "11.0.19-tem"
    local java = tostring(
      homedir:joinpath(".sdkman", "candidates", "java", java_version, "bin", "java")
    )
    local repo_path = homedir:joinpath("dev", "personal", "souffle-lsp-plugin")
    local cmd = {
      java,
      "-cp",
      tostring(repo_path:joinpath("build", "libs", "*")),
      "SouffleLanguageServerLauncher",
    }
    vim.lsp.start({
      name = "souffle-ls",
      cmd = cmd,
      root_dir = vim.fs.dirname(vim.fs.find({ "main.dl" }, { upward = true })[1]),
    })
  end,
})

vim.api.nvim_create_autocmd("LspAttach", {
  pattern = { "*.dl" },
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    local bufnr = args.buf
    require("nathan-wien.plugins.lsp.default.on_attach")(client, bufnr)
  end,
})
