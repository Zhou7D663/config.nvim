return {
  cmd = { "docker-languageserver", "--stdio" },
  filetypes = { "dockerfile", "ContainerFile" },
  root_markers = { ".git", "Dockerfile" }
}
