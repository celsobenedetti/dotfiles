local f = require("functions.luasnip")

return {

  { "wakatime/vim-wakatime" },
  {
    "christoomey/vim-tmux-navigator",
    keys = {
      { "<C-h>", f.navigate_tmux("TmuxNavigateLeft"), desc = "Go to Left tmux pane" },
      { "<C-j>", f.navigate_tmux("TmuxNavigateDown"), desc = "Go to Down tmux pane" },
      { "<C-k>", f.navigate_tmux("TmuxNavigateUp"), desc = "Go to Up tmux pane" },
      { "<C-l>", f.navigate_tmux("TmuxNavigateRight"), desc = "Go to Right tmux pane" },
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
      opts.window.position = "right"
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
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
        config = function()
          require("telescope").load_extension("fzf")
        end,
      },
      {
        "nvim-telescope/telescope-live-grep-args.nvim",
        version = "^1.0.0",
        config = function()
          require("telescope").load_extension("live_grep_args")
        end,
        keys = {
          {
            "<leader>sG",
            function()
              require("telescope").extensions.live_grep_args.live_grep_args()
            end,
            desc = "Telescope grep with args",
          },
        },
      },
    },
    opts = {
      defaults = {
        mappings = {
          n = { ["<leader>dd"] = require("telescope.actions").delete_buffer },
          i = { ["<leader>dd"] = require("telescope.actions").delete_buffer },
        },
        file_ignore_patterns = { "public", "dist", "drupal", "python" },
      },
    },
    keys = {
      { "<leader>uC", false },
      { "<leader>sG", false },
      { "<leader>fn", require("telescope.builtin").treesitter, desc = "Find Treesitter nodes" },
      { "<leader>fF", require("telescope.builtin").git_files, desc = "Search Dotfiles" },
      { "<leader>dot", require("functions.telescope").search_dotfiles, desc = "Search Dotfiles" },
      { "<leader>mv", require("functions.telescope").move_note, desc = "Search Dotfiles" },
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
    "nvim-treesitter/nvim-treesitter",
    -- TODO: update this
    commit = "ba6454783493ac3a5dd209c25e491640b07bd8de",
    lazy = false,
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, {
        "css",
        "graphql",
        "http",
        "hurl",
        "make",
        "markdown",
        "markdown_inline",
        "mermaid",
        "sql",
        "proto",
        "tsx",
        "vue",
        "xml",
      })
    end,
  },

  {
    "simrat39/symbols-outline.nvim",
    config = true,
    keys = {
      {
        "<leader>sO",
        function()
          require("symbols-outline").toggle_outline()
        end,
        desc = "SymbolsOutline toggle",
      },
    },
  },

  {
    "windwp/nvim-ts-autotag",
    config = true,
    ft = { "javascriptreact", "typescriptreact" },
  },

  {
    "danymat/neogen",
    dependencies = "nvim-treesitter/nvim-treesitter",
    opts = {
      snippet_engine = "luasnip",
    },
    keys = {
      {
        "<leader>A",
        ":Neogen<CR>",
        desc = "Neogen annotation",
      },
    },
  },
  {
    "qpkorr/vim-bufkill",
    event = "VeryLazy",
  },

  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    opts = {
      menu = {
        width = vim.api.nvim_win_get_width(0) - 4,
      },
    },
    keys = require("plugins.config.harpoon").keys,
  },
}
