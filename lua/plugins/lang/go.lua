return {
  {
    "leoluz/nvim-dap-go",
    ft = { "go" },
    opts = {
      dap_configurations = {
        {
          type = "go",
          name = "Debug Attach remote",
          mode = "remote",
          request = "attach",
          connect = {
            host = "127.0.0.1",
            port = "8181",
          },
        },
      },
      delve = {
        port = "8181",
      },
    },
  },
  {
    "ray-x/go.nvim",
    ft = "go",
    opts = {
      disable_defaults = true,
    },
    dependencies = { "ray-x/guihua.lua" },
  },
}
