return {
  "nvim-lualine/lualine.nvim",
  opts = {
    options = {
      theme = "auto",
      component_separators = { left = "", right = "" },
      section_separators = { left = " ", right = "" }
    },
    extensions = { "nvim-tree", "trouble", "mason" },
    sections = {
      lualine_a = {
        {
          "mode",
          icons_enabled = true,
        },
      },

      lualine_b = {
        {
          "filetype",
          colored = true,
          icon_only = true,
          padding = { left = 1, right = 0 },
        },
        {
          "filename",
          padding = { left = 0, right = 1 },
        },
      },

      lualine_c = {
        "branch",
        "diff",
        "diagnostics"
      },

      lualine_x = {},

      lualine_y = {},

      lualine_z = {
        "progress",
      },
    }

  },
  dependencies = { "nvim-tree/nvim-web-devicons" }
}
