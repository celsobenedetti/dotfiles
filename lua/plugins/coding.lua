local snippets = require("functions.luasnip")

return {
  {
    "L3MON4D3/LuaSnip",
    keys = {
      { "<C-l>", snippets.accept_or_go_next, mode = "i" },
      { "<c-h>", snippets.go_back, mode = "i" },
      { "<c-j>", snippets.toggle_option, mode = "i" },
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
    keys = {
      { "<leader>uC", require("functions.cmp").toggle, { desc = "Toggle autocompletion (cmp)" } },
    },
  },

  {
    "ray-x/web-tools.nvim",
    ft = { "hurl" },
    keys = {
      { "<leader>rq", ":HurlRun<CR>", mode = "v" },
    },
    opts = {
      keymaps = {
        rename = nil, -- by default use same setup of lspconfig
        repeat_rename = ".", -- . to repeat
      },
      hurl = { -- hurl default
        show_headers = false, -- do not show http headers
        floating = false, -- use floating windows (need guihua.lua)
        formatters = { -- format the result by filetype
          json = { "jq" },
          html = { "prettier", "--parser", "html" },
        },
      },
    },
  },

  {
    "leoluz/nvim-dap-go",
    ft = { "go" },
    opts = {
      dap_configurations = {
        {
          type = "go",
          name = "Debug Attach remote",
          mode = "remote",
          request = "attach",
          connect = {
            host = "127.0.0.1",
            port = "8181",
          },
        },
      },
      delve = {
        port = "8181",
      },
    },
  },
}
