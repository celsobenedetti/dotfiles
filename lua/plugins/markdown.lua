return {
  -- zk
  {
    "mickael-menu/zk-nvim",
    ft = "markdown",
    keys = {
      { "<leader>zn", ":ZkNewFromTitleSelection<CR>", mode = "v" },
      { "<leader>zn", ":ZkNewFromTitleSelection<CR>", mode = "v" },
      { "<leader>zz", ":ZkNotes<CR>" },
      { "<leader>zb", ":ZkBacklinks<CR>" },
      { "<leader>zl", ":ZkLinks<CR>" },
      { "<leader>zt", ":ZkTags<CR>" },
    },
    dependencies = {
      {
        "williamboman/mason.nvim",
        opts = function(_, opts)
          opts.ensure_installed = opts.ensure_installed or {}
          table.insert(opts.ensure_installed, "zk")
        end,
      },
    },
  },
}
