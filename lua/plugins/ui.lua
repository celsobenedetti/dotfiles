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
      opts.lsp.signature = {
        enabled = false,
      }
    end,
  },

  {
    "petertriho/nvim-scrollbar",
    dependencies = {
      {
        "kevinhwang91/nvim-hlslens",
        config = function()
          -- require("hlslens").setup() not needed
          require("scrollbar.handlers.search").setup({})
        end,
      },
    },
    event = "VeryLazy",
    config = function()
      require("scrollbar").setup()
      require("scrollbar.handlers.gitsigns").setup()
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
