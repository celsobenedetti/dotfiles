local snippets = require("functions.luasnip")

return {
  {
    "L3MON4D3/LuaSnip",
    keys = {
      { "<C-l>", snippets.accept_or_go_next, mode = "i" },
      { "<c-h>", snippets.go_back, mode = "i" },
      { "<c-j>", snippets.toggle_option, mode = "i" },
    },
  },

  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit for the latest features
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup()
    end,
    vscode = true,
  },

  {
    "hrsh7th/nvim-cmp",
    dependencies = { "uga-rosa/cmp-dictionary" },
    ---@param opts cmp.ConfigSchema
    opts = function(_, opts)
      local cmp = require("cmp")
      opts.sources = cmp.config.sources(vim.list_extend(opts.sources, {
        { name = "dictionary", keyword_length = 2 },
      }))

      ---@diagnostic disable-next-line: missing-fields
      opts.matching = {
        disallow_fuzzy_match = false,
      }

      opts.window = {
        completion = cmp.config.window.bordered({ col_offset = -1 }),
        documentation = cmp.config.window.bordered(),
      }
    end,
  },
}
