return {
  {
    "kristijanhusak/vim-dadbod-ui",
    cmd = "DBUIToggle",
    keys = {
      { "<leader>D", ":DBUIToggle<CR>" },
    },
    dependencies = {
      {
        "tpope/vim-dadbod",
        "kristijanhusak/vim-dadbod-completion",
      },
    },
  },
}
