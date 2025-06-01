local handle_yaml = function(_, bufnr)
  if vim.fn.filereadable("inventory") then
    local file_contents = vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)
    for _, line in ipairs(file_contents) do
      if vim.fn.match(line, "ansible[.]builtin") ~= -1 then
        return "yaml.ansible"
      end
    end
  end
  return "yaml"
end

vim.filetype.add({
  extension = {
    facts = "soufflefacts",
    dl = "souffle",
    gradle = "groovy.gradle",
    i3config = "i3config",
    souffle = "souffle",
    tex = "tex",
    tf = "terraform",
    tfvar = "terraform",
    tmux = "tmux",
    tsx = "typescriptreact",
    ts = "typescript",
    yaml = handle_yaml,
    yml = handle_yaml,
  },
  filename = {
    [".ansible-lint"] = "yaml",
    [".flake8"] = "cfg",
    ["Jenkinsfile"] = "groovy",
    [".eslintrc"] = "json",
    [".envrc"] = "bash",
    [".prettierrc"] = "json",
    [".babelrc"] = "json",
    [".stylelintrc"] = "json",
    [".terraformrc"] = "terraform",
    ["terraform.rc"] = "terraform",
    [".pre-commit-config.yaml"] = "yaml",
    [".pre-commit-config.yml"] = "yaml",
  },
  pattern = {
    ["*.g4"] = "antlr4",
    ["*.clang-format"] = "yaml",
    ["gitconfig"] = "gitconfig",
    ["*.gitconfig"] = "gitconfig",
    [".*/workflows/.*.yaml"] = "yaml.workflow",
    [".*/workflows/.*.yml"] = "yaml.workflow",
    [".*.intoto.jsonl"] = "json.intoto",
    [".*/tasks/.*.yaml"] = "yaml.ansible",
    [".*/roles/.*.yml"] = "yaml.ansible",
  },
})
