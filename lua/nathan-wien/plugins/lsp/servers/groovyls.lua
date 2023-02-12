local Path = require("plenary.path")

local mason_path = Path.new(require("mason.settings").current.install_root_dir)
local jar_path = tostring(
  mason_path:joinpath(
    "packages",
    "groovy-language-server",
    "build",
    "libs",
    "groovy-language-server-all.jar"
  )
)

return {
  cmd = { "java", "-jar", jar_path },
}
