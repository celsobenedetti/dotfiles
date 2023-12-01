return {
  {
    "zbirenbaum/copilot.lua",
    cmd = {
      "Copilot",
    },
    opts = {
      filetypes = {
        yaml = true,
      },
      suggestion = {
        auto_trigger = true,
      },
    },
  },

  -- Lazy
  {
    "jackMort/ChatGPT.nvim",
    cmd = {
      "ChatGPT",
      "ChatGPTActAs",
      "ChatGPTCompleteCode",
      "ChatGPTEditWithInstructions",
      "ChatGPTRun",
    },
    lazy = true,
    config = function()
      require("chatgpt").setup()
    end,
    dependencies = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
    },
  },
}
