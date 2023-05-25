local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  -- bootstrap lazy.nvim
  -- stylua: ignore
  vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath })
end
vim.opt.rtp:prepend(vim.env.LAZY or lazypath)

if vim.g.vscode then
  require("lazy").setup({ spec = require("config.vscode") })
  return
end

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
    {
      "kkharji/sqlite.lua",
      event = "VeryLazy",
    },

    -- local plugins configuration
    { import = "plugins" },

    -- import any extras modules here
    -- { import = "lazyvim.plugins.extras.lang.typescript" },
    { import = "lazyvim.plugins.extras.lang.json", ft = "typescript" },
    { import = "lazyvim.plugins.extras.linting.eslint" },
    { import = "lazyvim.plugins.extras.dap.core" },
    -- { import = "lazyvim.plugins.extras.ui.mini-animate" },

    -- override plugin opts
    { "echasnovski/mini.ai", event = "VeryLazy" },

    -- disable plugins
    { "ggandor/leap.nvim", enabled = false },
    { "ggandor/flit.nvim", enabled = false },
    { "echasnovski/mini.surroakinsho/bufferline.nvimund", enabled = false },
    { "rcarriga/nvim-notify", enabled = false },
    -- { "akinsho/bufferline.nvim", enabled = false },
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

-- vim.api.nvim_set_hl(0, "Normal", { bg = "#3B4252" })
-- vim.api.nvim_set_hl(0, "CursorLine", { bg = "#434C5E" })
