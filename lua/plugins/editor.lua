return {
  { "wakatime/vim-wakatime", event = "VeryLazy" },
  { "christoomey/vim-tmux-navigator", event = "VeryLazy" },

  {
    "williamboman/mason.nvim",
    keys = {
      { "<leader>cm", false },
      { "<leader>ma", "<cmd>Mason<cr>", desc = "Mason" },
    },
  },

  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
      config = function()
        require("telescope").load_extension("fzf")
      end,
    },
    opts = {
      defaults = {
        mappings = {
          n = { ["<leader>dd"] = require("telescope.actions").delete_buffer },
          i = { ["<leader>dd"] = require("telescope.actions").delete_buffer },
        },
      },
    },
    keys = {
      { "<leader>fn", require("telescope.builtin").treesitter, desc = "Find Treesitter nodes" },
      { "<leader>dot", require("functions.telescope").search_dotfiles, desc = "Search Dotfiles" },
      { "<leader>uC", false },
      {
        "<leader>fC",
        require("lazyvim.util").telescope("colorscheme", { enable_preview = true }),
        desc = "Colorscheme with preview",
      },
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
    "simrat39/symbols-outline.nvim",
    cmd = "SymbolsOutline",
    keys = { { "<leader>sO", "<cmd>SymbolsOutline<cr>", desc = "Symbols Outline" } },
    config = true,
  },

  {
    "ThePrimeagen/harpoon",
    dependencies = { "nvim-lua/plenary.nvim" },
    event = "VeryLazy",
    config = function()
      local harpoon = require("harpoon.ui")
      Map("<leader>m", require("harpoon.mark").add_file)
      Map("mm", harpoon.toggle_quick_menu)
      Map("<A-h>", harpoon.nav_prev, { desc = "Harpoon previous" })
      Map("<A-l>", harpoon.nav_next, { desc = "Harpoon next" })

      local power_fingers = { "a", "s", "d", "f" }
      local power_fingers2 = { "h", "j", "k", "l" }
      for i = 1, 4 do
        Map("<A-" .. tostring(i) .. ">", function()
          harpoon.nav_file(i)
        end)

        Map("m" .. tostring(i), function()
          harpoon.nav_file(i)
        end)

        Map("m" .. power_fingers[i], function()
          harpoon.nav_file(i)
        end)

        Map("m" .. power_fingers2[i], function()
          harpoon.nav_file(i)
        end)
      end
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      if type(opts.ensure_installed) == "table" then
        vim.list_extend(opts.ensure_installed, {
          "css",
        })
      end
    end,
  },
}
