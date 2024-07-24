local mason_path = require("mason.settings").current.install_root_dir
local java_exec = require("nathan-wien.utils").get_java_exec("11") or "java"
local jar = vim.fs.joinpath(
  mason_path,
  "packages",
  "groovy-language-server",
  "build",
  "libs",
  "groovy-language-server-all.jar"
)

return {
  cmd = { java_exec, "-jar", jar },
}
