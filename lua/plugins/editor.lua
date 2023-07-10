return {

  { "wakatime/vim-wakatime", event = "VeryLazy" },
  { "christoomey/vim-tmux-navigator", event = "VeryLazy" },
  {
    "numToStr/Comment.nvim",
    event = "VeryLazy",
    config = function()
      require("nvim-treesitter.configs").setup({
        context_commentstring = {
          enable = true,
          enable_autocmd = false,
        },
      })
      require("Comment").setup({
        pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
      })
    end,
  },

  {
    "Wansmer/treesj",
    keys = { "<space>m" },
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    config = function()
      require("treesj").setup({--[[ your config ]]
      })
    end,
  },

  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit for the latest features
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup({})
    end,
  },

  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = function(_, opts)
      opts.event_handlers = {
        {
          event = "file_opened",
          handler = function(_)
            require("neo-tree").close_all() --auto close
          end,
        },
      }
    end,
    keys = {
      { "<C-E>", "<leader>e", desc = "Explorer NeoTree (root dir)", remap = true },
    },
  },

  {
    "stevearc/oil.nvim",
    opts = {
      keymaps = {
        ["g?"] = "actions.show_help",
        ["<CR>"] = "actions.select",
        ["<C-s>"] = "actions.select_vsplit",
        ["<C-h>"] = "actions.select_split",
        ["<C-t>"] = "actions.select_tab",
        ["<C-p>"] = "actions.preview",
        ["<C-c>"] = "",
        ["q"] = "actions.close",
        ["<C-l>"] = "actions.refresh",
        ["-"] = "actions.parent",
        ["<BS>"] = "actions.parent",
        ["_"] = "actions.open_cwd",
        ["`"] = "actions.cd",
        ["~"] = "actions.tcd",
        ["g."] = "actions.toggle_hidden",
      },
    },
    command = "Oil",
    keys = { "-" },
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },

  { "mbbill/undotree", cmd = "UndotreeToggle" },

  {
    "barrett-ruth/import-cost.nvim",
    build = "sh install.sh npm",
    -- ft = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
    cmd = "ImportCost",
    config = function()
      vim.api.nvim_create_user_command("ImportCost", function()
        require("import-cost").setup()
      end, { desc = "Enable ImportCost" })
    end,
  },

  {
    "rest-nvim/rest.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    event = "VeryLazy",
    config = function()
      Map("<leader>rq", require("rest-nvim").run, { desc = "Run http request under cursor" })
      Map("<leader>rp", function()
        require("rest-nvim").run(true)
      end, { desc = "Previe http request under cursor" })

      require("rest-nvim").setup({
        -- Open request results in a horizontal split
        result_split_horizontal = false,
        -- Keep the http file buffer above|left when split horizontal|vertical
        result_split_in_place = false,
        -- Skip SSL verification, useful for unknown certificates
        skip_ssl_verification = false,
        -- Encode URL before making request
        encode_url = true,
        -- Highlight request on run
        highlight = {
          enabled = true,
          timeout = 150,
        },
        result = {
          -- toggle showing URL, HTTP info, headers at top the of result window
          show_url = true,
          -- show the generated curl command in case you want to launch
          -- the same request via the terminal (can be verbose)
          show_curl_command = false,
          show_http_info = true,
          show_headers = true,
          -- executables or functions for formatting response body [optional]
          -- set them to false if you want to disable them
          formatters = {
            json = "jq",
            html = "bat",
            -- html = function(body)
            --   return vim.fn.system({ "tidy", "-i", "-q", "-" }, body)
            -- end,
          },
        },
        -- Jump to request line on run
        jump_to_request = false,
        env_file = ".env",
        custom_dynamic_variables = {},
        yank_dry_run = true,
      })
    end,
  },
}
