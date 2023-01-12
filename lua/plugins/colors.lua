vim.g.nord_contrast = true
vim.g.nord_borders = true
vim.g.nord_uniform_diff_background = true

vim.o.background = "dark"

return {
  { "catppuccin/nvim", as = "catppuccin" },
  -- { "rebelot/kanagawa.nvim", },
  -- { "sainnhe/edge", },
  { "shaunsingh/nord.nvim" },
  -- { "andersevenrud/nordic.nvim" },
  { "nyoom-engineering/oxocarbon.nvim" },
  { "rose-pine/neovim" },

  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = function()
        -- require("nord").set()

        -- require("rose-pine").setup({dark_variant = "moon"})
        -- require("rose-pine").colorscheme()

        require("catppuccin").load("frappe")
      end,
    },
  },
}
