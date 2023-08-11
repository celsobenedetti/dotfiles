require("dap-go").setup({
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
})
