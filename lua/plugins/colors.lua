local function catppuccin()
  require("catppuccin").setup({
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
  })
  vim.cmd("silent! colorscheme catppuccin")
  -- require("catppuccin").load("frappe")
end

local function material()
  vim.g.material_style = "palenight"
  require("material").setup({
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
  })
  vim.cmd("silent! colorscheme material")
end

local function rose_pine()
  require("rose-pine").setup({
    --- @usage 'main' | 'moon'
    dark_variant = "moon",
  })
  vim.cmd("colorscheme rose-pine")
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
  { "catppuccin/nvim", as = "catppuccin" },
  { "ellisonleao/gruvbox.nvim" },
  { "marko-cerovac/material.nvim" },
  { "rebelot/kanagawa.nvim" },
  { "sainnhe/edge" },
  -- { "shaunsingh/nord.nvim" },
  { "rose-pine/neovim" },
  { "nyoom-engineering/oxocarbon.nvim" },

  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = function()
        catppuccin()
        -- material()
        -- rose_pine()
      end,
      -- colorscheme = "kanagawa"
    },
  },
}
