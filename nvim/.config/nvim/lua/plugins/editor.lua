return {

  { "wakatime/vim-wakatime" },
  {
    "christoomey/vim-tmux-navigator",
    keys = {
      { "<C-h>", ":TmuxNavigateLeft<CR>", desc = "Go to Left tmux pane" },
      { "<C-j>", ":TmuxNavigateDown<CR>", desc = "Go to Down tmux pane" },
      { "<C-k>", ":TmuxNavigateUp<CR>", desc = "Go to Up tmux pane" },
      { "<C-l>", ":TmuxNavigateRight<CR>", desc = "Go to Right tmux pane" },
    },
  },

  {
    "mbbill/undotree",
    keys = {
      { "<leader>U", "<cmd>UndotreeToggle<cr>", desc = "Undotree Toggle" },
    },
    config = function()
      vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
    end,
  },

  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = function(_, opts)
      opts.filesystem.filtered_items = {
        hide_gitignored = false,
        hide_dotfiles = false,
      }
    end,
  },

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
        "<leader><leader>",
        require("telescope.builtin").buffers,
        desc = "Telescope find open buffers",
      },
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
    "ThePrimeagen/harpoon",
    dependencies = { "nvim-lua/plenary.nvim" },
    vscode = true,
    config = function()
      local harpoon = require("harpoon.ui")
      Map("<leader>M", require("harpoon.mark").add_file)
      Map("<leader>hc", require("harpoon.mark").clear_all)
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

      if not vim.g.vscode then
        Map("mm", harpoon.toggle_quick_menu)
      end
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, {
        "css",
        "http",
        "hurl",
        "make",
        "mermaid",
        "sql",
        "proto",
        "vue",
        "xml",
      })
    end,
  },
}
