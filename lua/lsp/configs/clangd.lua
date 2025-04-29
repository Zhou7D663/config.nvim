return {
  cmd = { "clangd" },
  filetypes = { "c", "cpp", },
  root_markers = { ".git", ".clang-tidy", ".clang-format", "build" },
  capabilities = {
    offsetEncoding = { "utf-8", "utf-16" },
  }
}
