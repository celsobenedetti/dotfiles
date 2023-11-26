return {
  {
    "mfussenegger/nvim-dap",
    optional = true,
    dependencies = {
      {
        "williamboman/mason.nvim",
        opts = function(_, opts)
          opts.ensure_installed = opts.ensure_installed or {}
          table.insert(opts.ensure_installed, "js-debug-adapter")
        end,
      },
    },
    opts = function()
      local filetype = vim.api.nvim_buf_get_option(0, "filetype")
      if filetype == "typescript" or filetype == "javascript" then
        require("config.dap.typescript").setup()
      end
    end,
  },
}
