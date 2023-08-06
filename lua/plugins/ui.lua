return {
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = function(_, opts)
      opts.presets = {
        bottom_search = true,
        command_palette = false,
        long_message_to_split = true,
      }
    end,
  },

  {
    "nvim-tree/nvim-web-devicons",
    opts = {
      [".Dockerfile"] = {
        icon = "",
        color = "#007acc",
        name = "dockerfile_test",
      },
    },
  },
}
