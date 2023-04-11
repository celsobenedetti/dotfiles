return {
  "ThePrimeagen/harpoon",
  dependencies = { "nvim-lua/plenary.nvim" },
  event = "VeryLazy",
  config = function()
    Map("<leader>'", require("harpoon.mark").add_file)
    Map("''", require("harpoon.ui").toggle_quick_menu)
    Map('"', "<C-^>")

    local power_fingers = { "a", "s", "d", "f" }
    local power_fingers2 = { "h", "j", "k", "l" }
    for i = 1, 4 do
      Map("'" .. tostring(i), function()
        require("harpoon.ui").nav_file(i)
      end)

      Map("'" .. power_fingers[i], function()
        require("harpoon.ui").nav_file(i)
      end)

      Map("'" .. power_fingers2[i], function()
        require("harpoon.ui").nav_file(i)
      end)
    end
  end,
}
