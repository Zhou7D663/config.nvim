# My personal configuration for NVIM

## Requirements

- git
- any nerd font like
  [MonacoNerdFont](https://githFormatub.com/thep0y/monaco-nerd-font)
- treesitter-cli
- lua
- ripgrep
- fd
- npm
- python-venv

## Language Services

### Ensure to install

#### nvim-tree

- `Syntax highlighting`: lua, markdown, markdown_inline, yaml, editorconfig, c,
  cpp, python, lua

#### mason

- `LSP`: lua_ls, clangd, marksman, yamlls, bashls
- `Linter`: markdownlint, yamllint, shellcheck
- `Formatter`: prettier, shfmt

### lua

- `Syntax highlighting`: lua
- `LSP`: lua_ls
- `Linter`: lua_ls
- `Formatter`: lua_ls

Both `Formatter` and `Linter` use `.editorconfig` as configuration file.

### markdown

- `Syntax hightlighting`: markdown, markdown_inline
- `LSP`: marksman
- `Linter`: markdownlint
- `Formatter`: prettier

### yaml

- `Syntax highlighting`: yaml
- `LSP:` yamlls
- `Lintter`: yamllint
- `Formatter`: yamlls

### shell script

- `Syntax hightlighting`: bash
- `LSP`: bashls
- `Linter`: shellcheck
- `Formatter`: shfmt

`shfmt` uses `.editorconfig` as its configuration file and ignores LSP configs
when it finds `.editorconfig`. It is possible to disable `.editorconfig` support
and always use LSP configs by setting the "Ignore Editorconfig" configuration
varibale.
