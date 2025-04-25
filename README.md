# My personal configuration for NVIM

## Requirements

- git
- any nerd font like
  [MonacoNerdFont](https://github.com/thep0y/monaco-nerd-font)
- treesitter
- lua
- ripgrep
- fd

## Language Services

`Linter`: Static code analysis tool used to flag programming errors, bugs,
stylistic errors and suspicious constructs.

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
