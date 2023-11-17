return {
  {
    "neovim/nvim-lspconfig",
    ---@class PluginLspOpts
    opts = function(_, opts)
      opts.servers = vim.tbl_deep_extend("force", opts.servers, {
        prismals = {},
        bufls = {}, -- protobuf

        -- web
        html = {},
        cssls = { filetypes = { "html", "gohtml", "vue" } },
        emmet_ls = { filetypes = { "html", "gohtml", "vue" } },
        volar = {},
        angularls = {},
      })

      opts.setup = {
        zk = function()
          require("zk").setup()
          return true --let zk.nvim handle zk lsp
        end,

        jdtls = require("config.jdtls").setup,
      }
    end,
  },

  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, {
        "lua-language-server",
        "vue-language-server",
        "shellcheck",
        "sqlfluff",
        "buf-language-server",
        "buf",
        "html-lsp",
      })
    end,
  },

  {
    "mfussenegger/nvim-lint",
    optional = true,
    opts = function(_, opts)
      opts.linters_by_ft = {
        zsh = { "shellcheck" },
        sh = { "shellcheck" },
        bash = { "shellcheck" },
      }
    end,
  },
}
