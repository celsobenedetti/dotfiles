local snippets = require("functions.luasnip")

return {
  {
    "L3MON4D3/LuaSnip",
    keys = {
      { "<C-l>", snippets.accept_or_go_next, mode = { "i", "s" } },
      { "<C-h>", snippets.go_back, mode = { "i", "s" } },
      { "<C-j>", snippets.toggle_option, mode = { "i", "s" } },
    },
    config = function()
      require("luasnip.loaders.from_vscode").lazy_load({
        paths = { "~/.config/nvim/snippets" },
      })
    end,
  },

  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit for the latest features
    config = true,
    vscode = true,
  },

  {
    "hrsh7th/nvim-cmp",
    ---@param opts cmp.ConfigSchema
    opts = function(_, opts)
      local cmp = require("cmp")

      opts.mapping["<C-j>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select })
      opts.mapping["<C-k>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select })

      ---@diagnostic disable-next-line: missing-fields
      opts.matching = {
        disallow_fuzzy_match = false,
      }

      -- copilot suggestions and hide ghost text
      opts.sources = vim.tbl_extend("force", opts.sources, {
        { name = "copilot", group_index = 2 },
      })
      cmp.event:on("menu_opened", function()
        vim.b.copilot_suggestion_hidden = true
      end)

      cmp.event:on("menu_closed", function()
        vim.b.copilot_suggestion_hidden = false
      end)

      opts.window = {
        completion = cmp.config.window.bordered({ col_offset = -1 }),
        documentation = cmp.config.window.bordered(),
      }
    end,
    keys = {
      { "<leader>uC", require("functions.cmp").toggle, { desc = "Toggle autocompletion (cmp)" } },
    },
  },

  {
    "stevearc/conform.nvim",
    opts = function(_, opts)
      opts.formatters.goimports = {
        prepend_args = { "-local", "github.com/celsobenedetti/" },
      }
    end,
  },
}
