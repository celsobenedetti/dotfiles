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
    enabled = vim.g.perf,
    opts = {
      timeout = 5000, -- 5s
    },
  },
  {
    "folke/noice.nvim",
    enabled = vim.g.perf,
    dependencies = {
      {
        "nvim-telescope/telescope.nvim",
        keys = { { "<leader>snm", ":Telescope noice<CR>" } },
      },
    },
    opts = require("plugins.config.noice").opts,
    config = function()
      require("telescope").load_extension("noice")
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
    "nvimdev/dashboard-nvim",
    opts = {
      config = {
        header = vim.split(logo, "\n"),
      },
    },
  },

  {
    "folke/twilight.nvim",
    config = function()
      require("twilight").setup()
    end,
    ft = { "markdown" },
    keys = { { "<leader>tw", ":Twilight<CR>" } },
  },

  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = require("plugins.config.lualine").opts,
  },
}
