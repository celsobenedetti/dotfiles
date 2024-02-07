return {
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-treesitter/nvim-treesitter", -- this adding nvim-treesitter
      {
        "nvim-neotest/neotest-jest",
        config = function()
          require("neotest-jest")({
            jestCommand = "pnpm test --",
            cwd = function(path)
              return vim.fn.getcwd()
            end,
          })
          -- code
        end,
      },
    },
    opts = function(_, opts)
      vim.list_extend(opts.adapters, {
        "neotest-jest",
      })
    end,
  },
}
