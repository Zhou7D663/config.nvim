# My personal configuration for NVIM

## Requirements

- git
- any nerd font like
  [MonacoNerdFont](https://githFormatub.com/thep0y/monaco-nerd-font)
- treesitter
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

- `LSP`: lua_ls, clangd, marksman, yamlls
- `Linter`: markdownlint, yamllint
- `Formatter`: prettier

### lua

- `Syntax highlighting`: lua
- `LSP`: lua_ls
- `Linter`: lua_ls
- `Formatter`: lua_ls

Both `Formatter` and `Linter` use **.editorconfig** as configuration file.

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
