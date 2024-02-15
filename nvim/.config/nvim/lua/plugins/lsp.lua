return {
  {
    "neovim/nvim-lspconfig",
    ---@class PluginLspOpts
    opts = function(_, opts)
      opts.servers = vim.tbl_deep_extend("force", opts.servers, {
        -- prismals = {},
        bufls = {}, -- protobuf

        -- web
        html = {},
        cssls = { filetypes = { "html", "gohtml", "vue" } },
        emmet_ls = { filetypes = { "none" } },
        volar = {},
        zk = {},
      })

      opts.setup = {
        tailwindcss = function()
          return vim.g.disable_tailwind
        end,

        -- zk = function()
        --   require("zk").setup()
        --   return true
        -- end,
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
        go = { "staticcheck" },
      }
    end,
  },
  {
    "ray-x/lsp_signature.nvim",
    event = "VeryLazy",
    opts = {
      hint_prefix = " ", --   parameter indicator
    },
    config = function(_, opts)
      require("lsp_signature").setup(opts)
    end,
  },
}
