local lazy_colorschemes = true

local function catppuccin_setup()
  local catppuccin_opts = {
    flavour = "frappe", -- latte, frappe, macchiato, mocha
    term_colors = false,
    custom_colors = {},
    custom_highlights = {},
    integrations = {
      cmp = true,
      gitsigns = true,
      nvimtree = true,
      telescope = true,
      mini = true,
      harpoon = true,
      treesitter = true,
      lsp_trouble = true,
      mason = true,
      which_key = true,
      neotree = true,
    },
  }

  require("catppuccin").setup(catppuccin_opts)
  require("catppuccin").load(catppuccin_opts.flavour)
end

local material_opts = {
  plugins = {
    "gitsigns",
    "mini",
    "nvim-cmp",
    "nvim-web-devicons",
    "telescope",
    "trouble",
    "which-key",
  },
  custom_highlights = {
    LineNr = { fg = "#717CB4" },
    CursorLineNr = { fg = "#5eacd3" },
  },
  lualine_style = "stealth", -- "stealth" or "default"
}
local function change_cursor_color()
  vim.cmd([[
        highlight Cursor guifg=white guibg=#6c7086
        highlight iCursor guifg=white guibg=steelblue
        set guicursor=n-v-c:block-Cursor
        set guicursor-=i:ver100-iCursor
        set guicursor-=n-v-c:blinkon0
        set guicursor-=i:blinkwait10
    ]])
end

return {
  -- general plugins
  -- {
  --   "brenoprata10/nvim-highlight-colors",
  --   event = "VeryLazy",
  --   config = function()
  --     require("nvim-highlight-colors").setup({
  --       render = "foreground", -- or 'foreground' or 'first_column'
  --       enable_tailwind = true,
  --     })
  --   end,
  -- },
  {
    "NvChad/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup({
        user_default_options = {
          tailwind = true,
        },
      })
      require("colorizer").attach_to_buffer(0)
    end,
    event = "VimEnter",
  },

  -- colorschemes
  { "ellisonleao/gruvbox.nvim", lazy = lazy_colorschemes },
  { "rebelot/kanagawa.nvim", lazy = lazy_colorschemes },
  { "sainnhe/edge", lazy = lazy_colorschemes },
  -- { "shaunsingh/nord.nvim", lazy = lazy_colorschemes },
  { "gbprod/nord.nvim", lazy = lazy_colorschemes },

  { "nyoom-engineering/oxocarbon.nvim", lazy = lazy_colorschemes },
  { "EdenEast/nightfox.nvim", lazy = lazy_colorschemes },
  { "tiagovla/tokyodark.nvim", lazy = lazy_colorschemes },

  { "lewpoly/sherbet.nvim", lazy = lazy_colorschemes },
  { "Mofiqul/vscode.nvim", lazy = lazy_colorschemes },
  { "sainnhe/everforest", lazy = lazy_colorschemes },
  { "Mofiqul/dracula.nvim", lazy = lazy_colorschemes },
  { "olivercederborg/poimandres.nvim", config = true, lazy = lazy_colorschemes },

  { "rmehri01/onenord.nvim", config = true, lazy = lazy_colorschemes },

  {
    "catppuccin/nvim",
    as = "catppuccin",
    -- config = catppuccin_setup,
    lazy = lazy_colorschemes,
  },
  {
    "marko-cerovac/material.nvim",
    config = function()
      vim.g.material_style = "palenight"
      require("material").setup(material_opts)
    end,
    lazy = lazy_colorschemes,
  },
  {
    "rose-pine/neovim",
    config = function()
      require("rose-pine").setup({ dark_variant = "moon" })
    end,
    lazy = lazy_colorschemes,
  },

  {
    "projekt0n/github-nvim-theme",
    version = "0.0.7",
    config = function()
      change_cursor_color()
    end,
    lazy = lazy_colorschemes,
  },

  {
    "LazyVim/LazyVim",
    opts = {
      -- colorscheme = "nord",
      colorscheme = catppuccin_setup,
    },
  },

  ---
}
