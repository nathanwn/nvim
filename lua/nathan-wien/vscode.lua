-- To view all available actions, do
-- Ctrl+Shift+P into 'Preferences: Open Default Keyboard Shortcuts'
local vscode = require('vscode-neovim')
vim.keymap.set("n", "<Leader>ff", function()
  vscode.call("workbench.action.quickOpen")
end)
vim.keymap.set("n", "<Leader>fg", function()
  vscode.call("workbench.action.findInFiles")
end)
vim.keymap.set("n", "<Leader>f;", function()
  vscode.call("workbench.action.showCommands")
end)

vim.keymap.set("n", "<Leader>gd", function()
  vscode.call("editor.action.revealDefinition")
end)

vim.keymap.set("n", "<Leader>ve", function()
  vscode.call("workbench.action.toggleSidebarVisibility")
end)
