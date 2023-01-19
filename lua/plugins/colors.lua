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

return {
  -- general plugins
  {
    "brenoprata10/nvim-highlight-colors",
    event = "VeryLazy",
    config = function()
      require("nvim-highlight-colors").setup({
        render = "foreground", -- or 'foreground' or 'first_column'
        enable_tailwind = true,
      })
    end,
  },

  -- colorschemes
  { "ellisonleao/gruvbox.nvim" },
  { "rebelot/kanagawa.nvim" },
  { "sainnhe/edge" },
  -- { "shaunsingh/nord.nvim" },
  { "nyoom-engineering/oxocarbon.nvim" },
  { "EdenEast/nightfox.nvim" },

  { "lewpoly/sherbet.nvim" },
  { "Mofiqul/vscode.nvim" },
  { "sainnhe/everforest" },

  {
    "catppuccin/nvim",
    as = "catppuccin",
    config = function()
      require("catppuccin").setup(catppuccin_opts)
    end,
  },
  {
    "marko-cerovac/material.nvim",
    config = function()
      vim.g.material_style = "palenight"
      require("material").setup(material_opts)
    end,
  },
  {
    "olivercederborg/poimandres.nvim",
    config = function()
      require("poimandres").setup()
    end,
  },
  {
    "rose-pine/neovim",
    config = function()
      require("rose-pine").setup({ dark_variant = "moon" })
    end,
  },

  -- {
  --   "LazyVim/LazyVim",
  --   opts = {
  --     colorscheme = "material",
  --   },
  -- },

  ---
}
