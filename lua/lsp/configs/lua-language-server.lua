return {
  cmd = { "lua-language-server" },
  filetypes = { "lua" },
  root_markers = {
    ".luarc.json",
    ".luarc.jsonc",
    ".luacheckrc",
    ".stylua.toml",
    "stylua.toml",
    "selene.toml",
    "selene.yml",
    ".git",
  },
  settings = {
    Lua = {
      hint = {
        enable = true,
        setType = true,
      },
      completion = {
        displayContext = 5,
      },
      diagnostics = {
        neededFileStatus = {
          ["codestyle-check"] = "Any",
        },
        globals = {
          "vim",
        }
      },
      format = {
        enable = true,
      }
    }
  }
}
