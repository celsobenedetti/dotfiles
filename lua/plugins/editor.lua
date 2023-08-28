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
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, {
        "css",
      })
    end,
  },

  {
    "ray-x/web-tools.nvim",
    ft = { "hurl" },
    keys = {
      { "<leader>rq", ":HurlRun<CR>", mode = "v" },
    },
    opts = {
      keymaps = {
        rename = nil, -- by default use same setup of lspconfig
        repeat_rename = ".", -- . to repeat
      },
      hurl = { -- hurl default
        show_headers = false, -- do not show http headers
        floating = false, -- use floating windows (need guihua.lua)
        formatters = { -- format the result by filetype
          json = { "jq" },
          html = { "prettier", "--parser", "html" },
        },
      },
    },
  },

  {
    "akinsho/git-conflict.nvim",
    version = "*",
    config = true,
    event = "VeryLazy",
    keys = {
      { "<leader>gC", ":GitConflictListQf<CR>" },
      { "<leader>gO", ":GitConflictChooseOurs<CR>" },
      { "<leader>gT", ":GitConflictChooseTheirs<CR>" },
      { "[C", ":GitConflictPrevConflict<CR>" },
      { "]C", ":GitConflictNextConflict<CR>" },
    },
  },

  {
    "ThePrimeagen/git-worktree.nvim",
    opts = true,
    config = function()
      require("telescope").load_extension("git_worktree")
    end,
    keys = {
      { "<leader>gw", ":Telescope git_worktree git_worktrees<CR>" },
    },
  },
}
