local function open_vertical_panel()
  vim.cmd("vsplit")
  local win = vim.api.nvim_get_current_win()
  vim.cmd("Copilot panel")
  vim.api.nvim_win_close(win, false)

  Map("<M-[>", require("copilot.panel").jump_prev, { desc = "Jump Prev (Copilot Panel)" })
  Map("<M-]>", require("copilot.panel").jump_next, { desc = "Jump Next (Copilot Panel)" })
end

-- create a function to open the panel created from "Copilot panel" but vertically

return {
  {
    "zbirenbaum/copilot.lua",
    -- event = "VeryLazy",
    cmd = "Copilot",
    keys = {
      { "<leader>cp", open_vertical_panel, desc = "Open Copilot Panel" },
    },
    config = function()
      vim.schedule(function()
        require("copilot").setup({
          panel = {
            enabled = true,
            auto_refresh = false,
            keymap = {
              -- jump_prev = "<M-[>",
              -- jump_next = "<M-]>",
              accept = "<CR>",
              refresh = "gr",
              open = "<M-CR>",
            },
          },
          suggestion = {
            enabled = true,
            auto_trigger = false,
            debounce = 75,
            keymap = {
              accept = "<M-l>",
              accept_word = false,
              accept_line = false,
              next = "<M-]>",
              prev = "<M-[>",
              dismiss = "<C-]>",
            },
          },
          filetypes = {
            yaml = false,
            markdown = false,
            help = false,
            gitcommit = false,
            gitrebase = false,
            hgcommit = false,
            svn = false,
            cvs = false,
            ["."] = false,
          },
          copilot_node_command = "node", -- Node.js version must be > 16.x
          server_opts_overrides = {},
        })
      end)
    end,
  },

  {
    "zbirenbaum/copilot-cmp",
    -- event = "VeryLazy",
    dependencies = { "zbirenbaum/copilot.lua", "hrsh7th/nvim-cmp" },
    config = function()
      require("copilot_cmp").setup()
    end,
  },

  {
    "jackMort/ChatGPT.nvim",
    config = function()
      require("chatgpt").setup()
    end,
    keys = {
      { "<leader>gpt", ":ChatGPT<CR>", desc = "Open Chat GPT" },
      { "<leader>gpa", ":ChatGPTActAs<CR>", desc = "Open Chat GPT (Act as)" },
      { "<leader>gpe", ":ChatGPTEditWithInstructions<CR>", desc = "Open Chat GPT (Edit With Instructions)" },
    },
    dependencies = { "nvim-lua/plenary.nvim" },
    cmd = { "ChatGPT", "ChatGPTEditWithInstructions", "ChatGPTActAs" },
    -- event = "VeryLazy",
  },
}
