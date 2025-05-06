return {
  "akinsho/bufferline.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {
    options = {
      offsets = {
        {
          filetype = "NvimTree",
          text = "File Explorer",
          text_align = "left",
          separator = true,
        },
      },
      indicator = {
        style = "underline",
      },
      diagnostics = "nvim_lsp",
      diagnostics_indicator = function(count, level, diagnostics_dict, context)
        if context.buffer:current() then
          return " "
        end

        local res = ""
        for severity, number in pairs(diagnostics_dict) do
          local symbol = severity == "error" and " " or (severity == "warning" and " " or (severity == "info" and " " or "󰌵 "))
          res = res .. number .. symbol
        end
        return res
      end,
      numbers = function(opts)
        return string.format("%s-%s", opts.ordinal, opts.id)
      end,
      separator_style = "slant",
      hover = {
        enabled = true,
        delay = 200,
        reveal = { "close" }
      },
    },
  },
  config = function(_, opts)
    require("bufferline").setup(opts)

    local api = vim.api
    local keymap = vim.keymap

    keymap.set("n", "<leader>3", ":BufferLineCycleNext<CR>")
    keymap.set("n", "<leader>1", ":BufferLineCyclePrev<CR>")

    keymap.set("n", "<leader>j", function()
      local count = vim.v.count
      if count == 0 then
        count = 1
      end
      if vim.fn.buflisted(count) == 1 then
        api.nvim_set_current_buf(count)
      else
        print("Buffer `" .. count .. "` not listed.")
      end
    end, { expr = false })
  end,
}
