vim.filetype.add({
  extension = {
    tex = "tex",
    tf = "terraform",
    tfvar = "terraform",
    tmux = "tmux",
    tsx = "typescriptreact",
    ts = "typescript",
  },
  filename = {
    [".flake8"] = "cfg",
    ["Jenkinsfile"] = "groovy",
    [".eslintrc"] = "json",
    [".prettierrc"] = "json",
    [".babelrc"] = "json",
    [".stylelintrc"] = "json",
    [".terraformrc"] = "terraform",
    ["terraform.rc"] = "terraform",
    [".pre-commit-config.yaml"] = "yaml",
    [".pre-commit-config.yml"] = "yaml",
  },
  pattern = {
    ["*.clang-format"] = "yaml",
    [".*/.*playbook.*/.*.yaml"] = "yaml.ansible",
    [".*/.*playbook.*/.*.yml"] = "yaml.ansible",
  },
})
