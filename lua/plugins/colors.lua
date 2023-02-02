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
  { "Mofiqul/dracula.nvim" },

  {
    "catppuccin/nvim",
    as = "catppuccin",
    config = catppuccin_setup,
    -- event = "VimEnter",
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

  {
    "projekt0n/github-nvim-theme",
    version = "0.0.7",
    config = function()
      require("github-theme").setup({})
      change_cursor_color()
    end,
  },

  {
    "LazyVim/LazyVim",
    opts = {
      -- colorscheme = "",
      colorscheme = catppuccin_setup,
    },
  },

  ---
}
