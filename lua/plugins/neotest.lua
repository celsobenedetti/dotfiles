return {
  -- { "<leader>tr", function() require("neotest").run.run() end, desc = "Run Nearest" },
  -- { "<leader>tR", function() require("neotest").run.run(vim.fn.expand("%")) end, desc = "Run File" },
  -- { "<leader>ts", function() require("neotest").summary.toggle() end, desc = "Toggle Summary" },
  -- { "<leader>to", function() require("neotest").output.open({ enter = true, auto_close = true }) end, desc = "Show Output" },
  -- { "<leader>tO", function() require("neotest").output_panel.toggle() end, desc = "Toggle Output Panel" },
  -- { "<leader>tS", function() require("neotest").run.stop() end, desc = "Stop" },

  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "nvim-neotest/neotest-go",
      "nvim-neotest/neotest-python",
      "haydenmeade/neotest-jest",
      "marilari88/neotest-vitest",
    },
    ft = { "go", "python", "typescript" },

    opts = function(_, opts)
      if opts.adapters == nil then
        opts.adapters = {}
      end
      opts.adapters = vim.list_extend(opts.adapters, {
        require("neotest-go"),
        require("neotest-vitest"),

        require("neotest-python")({
          args = { "--log-level", "DEBUG" },
        }),

        require("neotest-jest")({
          jestCommand = "npm test --",
          jestConfigFile = "custom.just.config.ts",
          env = { CI = true },
          cwd = function()
            return vim.fn.getcwd()
          end,
        }),
      })
    end,
  },
}
