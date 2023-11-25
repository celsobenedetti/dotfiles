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
        paths = { "~/.dotfiles/snippets" },
      })
    end,
  },

  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit for the latest features
    event = "VeryLazy",
    config = true,
    vscode = true,
  },

  {
    "hrsh7th/nvim-cmp",
    ---@param opts cmp.ConfigSchema
    opts = function(_, opts)
      local cmp = require("cmp")
      -- opts.sources = cmp.config.sources(vim.list_extend(opts.sources, {
      --   { name = "dictionary", keyword_length = 2 },
      -- }))

      ---@diagnostic disable-next-line: missing-fields
      opts.matching = {
        disallow_fuzzy_match = false,
      }

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
