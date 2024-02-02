return {
  -- Note: do not rely on esbonio installed by mason
  -- Reason: esbonio needs to execute conf.py, which is most likely only possible
  -- within the virtual environment of the project.
  -- Therefore, the best option is to install esbonio directly in the virtual env of the project.
  -- cmd = { "esbonio" },
  -- TODO: This config assumes the sphinx documentation is always in docs/source.
  -- To accommodate different use cases, it is probably better to reimplement the server
  -- initialization and attachment logic from scratch.
  init_options = {
    sphinx = {
      confDir = "docs/source",
      srcDir = "${confDir}",
    },
  },
}
