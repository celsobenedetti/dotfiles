local logo = [[
███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║
██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝
]]
logo = string.rep("\n", 8) .. logo .. "\n\n"

return {
  {
    "rcarriga/nvim-notify",
    opts = {
      timeout = 5000, -- 5s
    },
  },
  {
    "folke/noice.nvim",
    dependencies = {
      {
        "nvim-telescope/telescope.nvim",
        keys = { { "<leader>snm", ":Telescope noice<CR>" } },
      },
    },
    opts = function(_, opts)
      opts.presets.bottom_search = true -- use a classic bottom cmdline for search
      opts.presets.lsp_doc_border = true -- add a border to hover docs and signature help
      opts.presets.command_palette = false -- position the cmdline and popupmenu together
      opts.presets.long_message_to_split = true -- long messages will be sent to a split

      opts.lsp.signature = {
        enabled = false, -- use lsp_signature.nvim instead
      }

      -- ignore notifications which contain any of these
      local ignore_notifications = {
        { "notify", "No information available" },
        { "notify", "Config Change" },
        { "notify", "'NotifyBackground' has no background highlight" },
        { "notify", "Set conceallevel to" },
        { "notify", "Plugin Updates" },
        { "msg_show", "search hit BOTTOM, continuing at TOP" },
        { "msg_show", "Pattern not found" },
        { "msg_show", "invalid node type" },
        { "msg_show", "Keyboard interrupt" },
        { "msg_show", ":qa" },
        { "msg_show", "Error in decoration provider" },
      }

      for _, filter in ipairs(ignore_notifications) do
        table.insert(opts.routes, {
          filter = {
            event = filter[1],
            find = filter[2],
          },
          opts = { skip = true },
        })
      end

      config = function()
        require("telescope").load_extension("noice")
      end
    end,
  },

  {
    "nvim-tree/nvim-web-devicons",
    config = function()
      local icon = require("nvim-web-devicons")
      icon.set_icon({
        [".Dockerfile"] = {
          icon = "",
          color = "#007acc",
          name = "dockerfile_test",
        },
      })
      icon.set_icon({
        proto = {
          icon = "󰿘",
          color = "#FF5C77",
          name = "protobuf",
        },
      })
    end,
  },

  -- filenamees
  {
    "b0o/incline.nvim",
    opts = function(_, opts)
      opts.window = { margin = { vertical = 0, horizontal = 1 } }
      opts.hide = { cursorline = true }

      opts.render = function(props)
        local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
        if vim.bo[props.buf].modified then
          filename = "[+] " .. filename
        end

        local icon, color = require("nvim-web-devicons").get_icon_color(filename)
        return { { icon, guifg = color }, { " " }, { filename } }
      end
    end,
  },

  {
    "lukas-reineke/headlines.nvim",
    config = function()
      require("headlines").setup({
        markdown = {
          headline_highlights = { "DevIconEditorConfig" },
          codeblock_highlight = "None",
          dash_highlight = "None",
          dash_string = "-",
          quote_highlight = "CursorLine",
          quote_string = "┃",
          fat_headlines = true,
          fat_headline_upper_string = "",
          fat_headline_lower_string = "━",
        },
      })
    end,
  },
  {
    "nvimdev/dashboard-nvim",
    opts = {
      config = {
        header = vim.split(logo, "\n"),
      },
    },
  },

  {
    "folke/twilight.nvim",
    opts = {},
    ft = { "markdown" },
    keys = { { "<leader>tw", ":Twilight<CR>" } },
  },

  {
    "folke/zen-mode.nvim",
    opts = {
      window = {
        -- backdrop = 0.95,
        width = 0.975, -- width of the Zen window
        height = 1, -- height of the Zen window
        options = {
          signcolumn = "no", -- disable signcolumn
          -- number = false, -- disable number column
          -- relativenumber = true, -- disable relative numbersui l
          -- cursorline = false, -- disable cursorline
          -- cursorcolumn = false, -- disable cursor column
          -- foldcolumn = "0", -- disable fold column
          -- list = false, -- disable whitespace characters
        },
      },
      plugins = {
        -- disable some global vim options (vim.o...)
        options = {
          enabled = true,
          ruler = false, -- disables the ruler text in the cmd line area
          showcmd = false, -- disables the command in the last line of the screen
          -- you may turn on/off statusline in zen mode by setting 'laststatus'
          -- statusline will be shown only if 'laststatus' == 3
          laststatus = 0, -- turn off the statusline in zen mode
        },
        twilight = { enabled = true }, -- enable to start Twilight when zen mode opens
        gitsigns = { enabled = false }, -- disables git signs
        tmux = { enabled = false }, -- disables the tmux statusline
      },
    },
  },
}
