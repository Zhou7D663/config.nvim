return {
  cmd = { "cmake-language-server" },
  filetypes = { "cmake", "CMakeLists.txt" },
  init_options = {
    buildDirectory = "build",
  },
  root_markers = { ".git", "build" }
}
