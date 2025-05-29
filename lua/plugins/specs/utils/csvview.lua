return {
  "hat0uma/csvview.nvim",
  opts = {
    parser = { comments = { "#", "//" } },
    jump_next_field_end = { "<Tab>", mode = { "n", "v" } },
    jump_prev_field_end = { "<S-Tab>", mode = { "n", "v" } },
    jump_next_row = { "<Enter>", mode = { "n", "v" } },
    jump_prev_row = { "<S-Enter>", mode = { "n", "v" } },
  },
  config = function(_, opts)
    local csvview = require("csvview")
    csvview.setup(opts)
    csvview.enable()
  end,
  cmd = { "CsvViewEnable", "CsvViewDisable", "CsvViewToggle" },
}
