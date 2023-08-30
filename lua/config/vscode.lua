Map("<leader>e", function()
  vim.cmd("call VSCodeCall('workbench.action.toggleSidebarVisibility')")
end, { desc = "Toggle sidebar" })

Map("<leader>ff", function()
  vim.cmd("call VSCodeCall('workbench.action.quickOpen')")
end, { desc = "Quick Open pop-up (File search)" })

Map("<leader>bd", function()
  vim.cmd("call VSCodeCall('workbench.action.files.save')")
  vim.cmd("call VSCodeCall('workbench.action.closeActiveEditor')")
end, { desc = "Close current editor (buffer)" })

Map("<leader>cr", function()
  vim.cmd("call VSCodeCall('editor.action.rename')")
end, { desc = "Rename symbol" })
