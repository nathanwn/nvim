local config = require("nathan-wien.lsp.config.jdtls")
require("jdtls").start_or_attach(config)
require("nathan-wien.utils").editor.set_buf_indent(2)
