return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
      config = function()
        require("telescope").load_extension("fzf")
      end,
    },
    keys = {
      { "<leader>fn", require("telescope.builtin").treesitter, desc = "Find Treesitter nodes" },
      { "<leader>dot", require("functions.telescope").search_dotfiles, desc = "Search Dotfiles" },
    },
  },

  {
    "echasnovski/mini.files",
    opts = {
      windows = {
        preview = false,
      },
    },
  },

  {
    "nvim-lualine/lualine.nvim",
    opts = function(_, opts)
      table.insert(opts.sections.lualine_x, require("functions.lualine").get_lsp_client_list)
    end,
  },

  {
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
  },
}
