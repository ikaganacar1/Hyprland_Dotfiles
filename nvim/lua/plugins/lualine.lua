return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  opts = {
    options = {
      theme = "pywal16-nvim",
      --component_separators = "",
      --section_separators = "",
    },
    sections = {
      lualine_a = {
        {
          "mode",
          fmt = function(str)
            --return ""
            return string.format(" %s", str)
          end,
        },
      },
      lualine_z = {},
    },
  },
}
