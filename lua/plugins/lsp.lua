return {
  {
    "neovim/nvim-lspconfig",
    ---@class PluginLspOpts
    opts = function(_, opts)
      opts.autoformat = true
      opts.servers = vim.tbl_deep_extend("force", opts.servers, {
        cssls = {},
        prismals = {},
        angularls = {},
        volar = {},
        bufls = {}, -- protobuf
        -- emmet_ls = { filetypes = { "html", "gohtml", "vue" } },
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
    "nvimtools/none-ls.nvim",
    opts = function(_, opts)
      local nls = require("null-ls")
      table.insert(
        opts.sources,
        nls.builtins.formatting.sqlfluff.with({ extra_args = { "--dialect", "tsql" } })
      )
      table.insert(opts.sources, nls.builtins.formatting.black)

      table.insert(opts.sources, nls.builtins.diagnostics.shellcheck)
      table.insert(opts.sources, nls.builtins.code_actions.shellcheck)

      table.insert(opts.sources, nls.builtins.formatting.buf)
      table.insert(opts.sources, nls.builtins.diagnostics.buf)
    end,
  },

  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, {
        "shellcheck",
        "sqlfluff",
        "sonarlint-language-server",
        "vue-language-server",
        "buf-language-server",
        "buf",
      })
    end,
  },
}
