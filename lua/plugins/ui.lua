return {
  -- { "rcarriga/nvim-notify", enabled = false },
  {
    "folke/noice.nvim",
    enabled = false,
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
    config = function()
      local icon = require("nvim-web-devicons")
      icon.set_icon({
        [".Dockerfile"] = {
          icon = "",
          color = "#007acc",
          name = "dockerfile_test",
        },
      })
      icon.set_icon({
        proto = {
          icon = "󰿘",
          color = "#FF5C77",
          name = "protobuf",
        },
      })
    end,
  },
}
