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
    event = "VeryLazy",
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

  -- {
  --   "zbirenbaum/copilot-cmp",
  --   cmd = "Copilot",
  --   dependencies = { "zbirenbaum/copilot.lua", "hrsh7th/nvim-cmp" },
  --   config = true,
  -- },

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
  {
    "dpayne/CodeGPT.nvim",
    cmd = "Chat",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
    },

    -- config = function()
    --   require("codegpt.config")
    -- Override the default chat completions url, this is useful to override when testing custom commands
    -- vim.g["codegpt_chat_completions_url"] = "http://127.0.0.1:800/test"

    -- vim.g["codegpt_commands"] = {
    --   ["tests"] = {
    --     -- Language specific instructions for java filetype
    --     language_instructions = {
    --       java = "Use the TestNG framework.",
    --     },
    --   },
    --   ["doc"] = {
    --     -- Language specific instructions for python filetype
    --     language_instructions = {
    --       python = "Use the Google style docstrings.",
    --     },
    --
    --     -- Overrides the max tokens to be 1024
    --     max_tokens = 1024,
    --   },
    --   ["code_edit"] = {
    --     -- Overrides the system message template
    --     system_message_template = "You are {{language}} developer.",
    --
    --     -- Overrides the user message template
    --     user_message_template = "I have the following {{language}} code: ```{{filetype}}\n{{text_selection}}```\nEdit the above code. {{language_instructions}}",
    --
    --     -- Display the response in a popup window. The popup window filetype will be the filetype of the current buffer.
    --     callback_type = "code_popup",
    --   },
    --   -- Custom command
    --   ["modernize"] = {
    --     user_message_template = "I have the following {{language}} code: ```{{filetype}}\n{{text_selection}}```\nModernize the above code. Use current best practices. Only return the code snippet and comments. {{language_instructions}}",
    --     language_instructions = {
    --       cpp = "Use modern C++ syntax. Use auto where possible. Do not import std. Use trailing return type. Use the c++11, c++14, c++17, and c++20 standards where applicable.",
    --     },
    --   },
    -- }
    -- end,
  },
}
