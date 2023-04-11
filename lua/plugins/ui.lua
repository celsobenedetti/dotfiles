return {
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = function(_, opts)
      opts.presets = {
        bottom_search = true,
        command_palette = false,
        long_message_to_split = true,
      }
      opts.lsp.signature = {
        enabled = false,
      }
    end,
  },

  {
    "petertriho/nvim-scrollbar",
    dependencies = {
      {
        "kevinhwang91/nvim-hlslens",
        config = function()
          -- require("hlslens").setup() not needed
          require("scrollbar.handlers.search").setup({})
        end,
      },
    },
    event = "VeryLazy",
    config = function()
      require("scrollbar").setup()
      require("scrollbar.handlers.gitsigns").setup()
    end,
  },

  -- animations
  {
    "echasnovski/mini.animate",
    event = "VeryLazy",
    opts = function()
      -- don't use animate when scrolling with the mouse
      local mouse_scrolled = false
      for _, scroll in ipairs({ "Up", "Down" }) do
        local key = "<ScrollWheel" .. scroll .. ">"
        vim.keymap.set({ "", "i" }, key, function()
          mouse_scrolled = true
          return key
        end, { expr = true })
      end

      local animate = require("mini.animate")
      return {
        resize = {
          timing = animate.gen_timing.linear({ duration = 15, unit = "total" }),
        },
        scroll = {
          timing = animate.gen_timing.linear({ duration = 15, unit = "total" }),
          subscroll = animate.gen_subscroll.equal({
            predicate = function(total_scroll)
              if mouse_scrolled then
                mouse_scrolled = false
                return false
              end
              return total_scroll > 1
            end,
          }),
        },
      }
    end,
    config = function(_, opts)
      require("mini.animate").setup(opts)
    end,
  },

  {
    "nvim-tree/nvim-web-devicons",
    opts = {
      [".Dockerfile"] = {
        icon = "",
        color = "#007acc",
        name = "dockerfile_test",
      },
    },
  },

  {
    "jbyuki/venn.nvim",
    ft = "markdown",
    config = function()
      function _G.Toggle_venn()
        local venn_enabled = vim.inspect(vim.b.venn_enabled)
        if venn_enabled == "nil" then
          vim.b.venn_enabled = true
          vim.cmd([[setlocal ve=all]])
          -- draw a line on HJKL keystokes
          vim.api.nvim_buf_set_keymap(0, "n", "J", "<C-v>j:VBox<CR>", { noremap = true })
          vim.api.nvim_buf_set_keymap(0, "n", "K", "<C-v>k:VBox<CR>", { noremap = true })
          vim.api.nvim_buf_set_keymap(0, "n", "L", "<C-v>l:VBox<CR>", { noremap = true })
          vim.api.nvim_buf_set_keymap(0, "n", "H", "<C-v>h:VBox<CR>", { noremap = true })
          -- draw a box by pressing "f" with visual selection
          vim.api.nvim_buf_set_keymap(0, "v", "b", ":VBox<CR>", { noremap = true })
        else
          vim.cmd([[setlocal ve=]])
          vim.cmd([[mapclear <buffer>]])
          vim.b.venn_enabled = nil
        end
      end
      -- toggle keymappings for venn using <leader>v
      Map("<leader>v", ":lua Toggle_venn()<CR>", { desc = "Toggle venn" })
    end,
  },

  {
    "vimwiki/vimwiki",
    ft = "markdown",
    config = function()
      vim.cmd([[
        let g:vimwiki_list = [{'path': '~/vimwiki/',
        \ 'syntax': 'markdown', 'ext': '.md'}] 
        let g:vimwiki_global_ext = 0
        ]])
    end,
  },
}
