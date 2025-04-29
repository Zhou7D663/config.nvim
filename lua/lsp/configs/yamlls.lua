return {
  cmd = { "yaml-language-server", "--stdio" },
  filetypes = { "yaml", "yaml.docker-compose", "yaml.gitlablways" },
  root_markers = { ".git" },
  settings = {
    redhat = {
      telemetry = {
        enable = false,
      },
    },
    yaml = {
      hover = {
        enable = true,
      },
      completion = {
        enable = true
      },
      format = {
        enable = false,
      },
    }
  }
}
