return {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    "nvim-neotest/neotest-go",
  },
  ft = "go",
  config = function()
    -- get neotest namespace (api call creates or returns namespace)
    -- local neotest_ns = vim.api.nvim_create_namespace("neotest")
    -- vim.diagnostic.config({
    --   virtual_text = {
    --     format = function(diagnostic)
    --       local message = diagnostic.message:gsub("\n", " "):gsub("\t", " "):gsub("%s+", " "):gsub("^%s+", "")
    --       return message
    --     end,
    --   },
    -- }, neotest_ns)
    require("neotest").setup({
      -- your neotest config here
      adapters = {
        require("neotest-go"),
      },
    })

    Map("<leader>tf", function()
      require("neotest").run.run(vim.fn.expand("%"))
    end, { desc = "Run current test file" })

    Map("<leader>tt", function()
      require("neotest").run.run()
    end, { desc = "Run nearest test" })

    Map("<leader>ts", function()
      require("neotest").summary.toggle()
    end, { desc = "Test Summary Toggle" })

    Map("<leader>to", function()
      require("neotest").output_panel.toggle()
    end, { desc = "Test Output Panel Toggle" })
  end,
}
