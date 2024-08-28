local utils = require("nathan-wien.utils")

-- platform: win, linux, mac
local platform
if utils.is_on_mac() then
  platform = "mac"
elseif utils.is_on_linux() then
  platform = "linux"
else
  return
end

local on_attach = require("nathan-wien.plugins.lsp.server_config.on_attach")
local mason_path = require("mason.settings").current.install_root_dir

local jdtls_install_path = vim.fs.joinpath(mason_path, "packages", "jdtls")
local platform_config_path = vim.fs.joinpath(jdtls_install_path, "config_" .. platform)
local equinox_jar = vim.fn.glob(
  vim.fs.joinpath(jdtls_install_path, "plugins", "org.eclipse.equinox.launcher_**.jar")
)
local lombok_jar_path = vim.fs.joinpath(jdtls_install_path, "lombok.jar")

-- If you started neovim within `~/dev/xy/project-1` this would resolve to `project-1`
local project_name = function()
  local cwd = vim.fn.getcwd()
  local current_dir_name = vim.fn.fnamemodify(cwd, ":p:h:t")
  local parent_dir_name = vim.fn.fnamemodify(cwd, ":p:h:h:t")
  return parent_dir_name .. "_" .. current_dir_name
end
local std_data_path = vim.fn.stdpath("data")
assert(type(std_data_path) == "string")
local workspace_dir = vim.fs.joinpath(std_data_path, "jdtls-ws", project_name())

-- jar files for debugging
-- from java-debug
local bundles = {
  vim.fn.glob(
    vim.fs.joinpath(
      mason_path,
      "packages",
      "java-debug-adapter",
      "extension",
      "server",
      "com.microsoft.java.debug.plugin-*.jar"
    )
  ),
}
-- from vscode-java-text
vim.list_extend(
  bundles,
  vim.split(
    vim.fn.glob(
      vim.fs.joinpath(
        mason_path,
        "packages",
        "java-test",
        "extension",
        "server",
        "*.jar"
      )
    ),
    "\n"
  )
)

local java_exec = require("nathan-wien.utils").get_java_exec("17") or "java"

-- See `:help vim.lsp.start_client` for an overview of the supported `config` options.
local config = {
  -- The command that starts the language server
  -- See: https://github.com/eclipse/eclipse.jdt.ls#running-from-the-command-line
  cmd = {
    -- Note: requires java 17
    java_exec,
    "-Declipse.application=org.eclipse.jdt.ls.core.id1",
    "-Dosgi.bundles.defaultStartLevel=4",
    "-Declipse.product=org.eclipse.jdt.ls.core.product",
    "-Dlog.protocol=true",
    "-Dlog.level=ALL",
    "-javaagent:" .. lombok_jar_path,
    "-Xms1g",
    "--add-modules=ALL-SYSTEM",
    "--add-opens",
    "java.base/java.util=ALL-UNNAMED",
    "--add-opens",
    "java.base/java.lang=ALL-UNNAMED",
    "-jar",
    equinox_jar,
    "-configuration",
    platform_config_path,
    "-data",
    workspace_dir,
  },
  -- This is the default if not provided, you can remove it. Or adjust as needed.
  -- One dedicated LSP server & client will be started per unique root_dir
  root_dir = require("jdtls.setup").find_root({ ".git", "mvnw", "gradlew" }),
  -- Here you can configure eclipse.jdt.ls specific settings
  -- For a list of options, see
  -- https://github.com/eclipse/eclipse.jdt.ls/wiki/Running-the-JAVA-LS-server-from-the-command-line#initialize-request
  settings = {
    java = {},
  },
  -- Language server `initializationOptions`
  -- You need to extend the `bundles` with paths to jar files
  -- if you want to use additional eclipse.jdt.ls plugins.
  --
  -- See https://github.com/mfussenegger/nvim-jdtls#java-debug-installation
  --
  -- If you don't plan on using the debugger or other eclipse.jdt.ls plugins you can remove this
  init_options = {
    bundles = bundles,
    extendedClientCapabilities = {
      progressReportProvider = false,
    },
  },
  on_attach = on_attach.create({
    pre_attach = function(_client, _bufnr)
      -- With `hotcodereplace = 'auto' the debug adapter will try to apply code changes
      -- you make during a debug session immediately.
      -- Remove the option if you do not want that.
      require("jdtls").setup_dap({
        hotcodereplace = "auto",
      })
    end,
    formatting = false,
  }),
}

return config
