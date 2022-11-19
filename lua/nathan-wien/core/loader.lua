-- nvim-tree
vim.keymap.set("n", "<Leader>ve", "<cmd>NvimTreeToggle<CR>")

-- outline
vim.keymap.set("n", "<Leader>vo", "<cmd>SymbolsOutline<CR>")

-- undotree
vim.keymap.set("n", "<Leader>vu", "<cmd>UndotreeToggle<CR>")

-- DAP
require("nathan-wien/dap").load()
