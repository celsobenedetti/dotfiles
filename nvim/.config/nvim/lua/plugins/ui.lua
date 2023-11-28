return {
  {
    "rcarriga/nvim-notify",
    opts = {
      timeout = 5000, -- 5s
    },
  },
  {
    "folke/noice.nvim",
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
        { "notify", "Set conceallevel to 0" },
        { "msg_show", "search hit BOTTOM, continuing at TOP" },
        { "msg_show", "Pattern not found" },
        { "msg_show", "invalid node type" },
        { "msg_show", "Keyboard interrupt" },
        { "msg_show", ":qa" },
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
    ft = "markdown",
    dependencies = "nvim-treesitter/nvim-treesitter",
    opts = {
      markdown = {
        fat_headlines = false,
      },
    },
  },
}
