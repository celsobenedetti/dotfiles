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

  -- {
  --   "nvimtools/none-ls.nvim",
  --   opts = function(_, opts)
  --     local nls = require("null-ls")
  --     table.insert(
  --       opts.sources,
  --       nls.builtins.formatting.sqlfluff.with({ extra_args = { "--dialect", "tsql" } })
  --     )
  --     table.insert(opts.sources, nls.builtins.formatting.black)
  --
  --     table.insert(opts.sources, nls.builtins.diagnostics.shellcheck)
  --     table.insert(opts.sources, nls.builtins.code_actions.shellcheck)
  --
  --     table.insert(opts.sources, nls.builtins.formatting.buf)
  --     table.insert(opts.sources, nls.builtins.diagnostics.buf)
  --   end,
  -- },

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
}
