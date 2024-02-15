return {
  {
    "mfussenegger/nvim-dap",
    optional = true,
    keys = {
      { "<leader>bC", require("dap").clear_breakpoints, { desc = "Clear DAP Breakpoints" } },
      {
        "<leader>bL",
        function()
          require("dap").list_breakpoints(true)
        end,
        { desc = "List DAP Breakpoints" },
      },
    },
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
      local filetype = vim.api.nvim_get_option_value("filetype", {})
      if filetype == "typescript" or filetype == "javascript" then
        require("config.dap.typescript").setup()
      end
    end,
  },

  {
    "rcarriga/nvim-dap-ui",
    opts = function(_, opts)
      opts.layouts = {

        {
          elements = {
            {
              id = "scopes",
              size = 0.25,
            },
            {
              id = "breakpoints",
              size = 0.25,
            },
            {
              id = "stacks",
              size = 0.25,
            },
            {
              id = "watches",
              size = 0.25,
            },
          },
          position = "left",
          size = 40,
        },

        {
          elements = {
            {
              id = "repl",
              size = 1,
            },
          },
          position = "bottom",
          size = 15,
        },
      }
      -- code
    end,
  },
}
