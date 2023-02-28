local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  -- bootstrap lazy.nvim
  -- stylua: ignore
  vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath })
end
vim.opt.rtp:prepend(vim.env.LAZY or lazypath)

require("lazy").setup({
  spec = {
    -- LazyVim core
    {
      "LazyVim/LazyVim",
      import = "lazyvim.plugins",
      keys = {
        { "<leader><leader>", false }, -- disable default keymap to be set by local telescope config
      },
    },

    -- local plugins configuration
    { import = "plugins" },

    { "wakatime/vim-wakatime", event = "VeryLazy" },
    { "christoomey/vim-tmux-navigator", event = "VeryLazy" },

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
    },

    { "mbbill/undotree", cmd = "UndotreeToggle" },
    -- import any extras modules here
    -- { import = "lazyvim.plugins.extras.lang.typescript" },
    { import = "lazyvim.plugins.extras.lang.json", ft = "typescript" },
    -- { import = "lazyvim.plugins.extras.ui.mini-animate" },

    -- override plugin opts
    { "echasnovski/mini.ai", event = "VeryLazy" },

    -- disable plugins
    { "ggandor/leap.nvim", enabled = false },
    { "ggandor/flit.nvim", enabled = false },
    { "echasnovski/mini.surround", enabled = false },
    -- { "rcarriga/nvim-notify", enabled = false },
  },
  defaults = {
    lazy = true, -- every plugin is lazy-loaded by default
    version = "*", -- try installing the latest stable version for plugins that support semver
  },
  install = { colorscheme = { "tokyonight", "habamax" } },
  checker = { enabled = false }, -- automatically check for plugin updates
  performance = {
    rtp = {
      -- disable some rtp plugins
      disabled_plugins = {
        "gzip",
        "matchit",
        "matchparen",
        "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
})
