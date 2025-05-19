# My personal configuration for NVIM

## Requirements

- git
- any nerd font like
  [MonacoNerdFont](https://github.com/thep0y/monaco-nerd-font)
- lua
- ripgrep
- fd (fd-find)
- npm
- python3-venv
- unzip (zip)
- curl

## Language Services

### Ensure to install

#### nvim-tree

- `Syntax highlighting`: lua, markdown, markdown_inline, yaml, editorconfig, c,
  cpp, python, lua

#### mason

- `LSP`: lua_ls, clangd, marksman, yamlls, bashls
- `Linter`: markdownlint, yamllint, shellcheck
- `Formatter`: prettier, shfmt, clang-format
- `Integrated`: cmakelang (cmake-lint and cmake-format)

### c/cpp

- `Syntax highlighting`: c, cpp
- `LSP`: clangd
- `Linter`: clang-tidy -- clangd
- `Formatter`: clang-format

### python

- `Syntax highlighting`: python
- `LSP`: pyright
- `Linter`: ruff
- `Formatter`: ruff

`Ruff` can be reconfigured through a `pyproject.toml`, `ruff.toml`, or
`.ruff.toml` file.

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
- `Formatter`: prettier

### shell script

- `Syntax hightlighting`: bash
- `LSP`: bashls
- `Linter`: shellcheck
- `Formatter`: shfmt

`shfmt` uses `.editorconfig` as its configuration file and ignores LSP configs
when it finds `.editorconfig`. It is possible to disable `.editorconfig` support
and always use LSP configs by setting the "Ignore Editorconfig" configuration
varibale.

### cmake

- `Syntax hightlighting`: cmake
- `LSP`: neocmake
- `Linter`: cmake-lint -- cmakelang
- `Formatter`: cmake-format -- cmakelang

### Dockerfile

- `Syntax highlighting`: docker
- `LSP`: dockerfile-language-server
- `Linter`: hadolint
