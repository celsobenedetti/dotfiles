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
        emmet_ls = { filetypes = { "html", "gohtml" } },
      })

      opts.setup = {
        zk = function()
          require("zk").setup()
          return true --let zk.nvim handle zk lsp
        end,
      }
    end,
  },
}
