return {
  cmd = { "cmake-language-server" },
  filetypes = { "cmake" },
  init_options = {
    buildDirectory = "build",
  },
  root_markers = { ".git", "build" }
}
