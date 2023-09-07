local colors = {
  github = "github_dark_high_contrast",
  github_light = "github_light",
  tokyo = "tokyonight",
  mocha = "catppuccin",
  frappe = "catppuccin-frappe",
  tundra = "tundra",
  rose = "rose-pine",
  dracula = "dracula-soft",
  nordic = "nordic",
}

local colorscheme = colors.nordic

local function set_black_cursor()
  vim.cmd([[
highlight Cursor guifg=white guibg=black
highlight iCursor guifg=white guibg=steelblue
set guicursor=n-v-c:block-Cursor
set guicursor+=i:ver100-iCursor
set guicursor+=n-v-c:blinkon0
set guicursor+=i:blinkwait10
]])
end

local function is_enabled(color)
  return colorscheme == color
end

return {
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = colorscheme,
    },
  },

  {
    "projekt0n/github-nvim-theme",
    enabled = true,
  },
  { "rose-pine/neovim", enabled = is_enabled(colors.rose) },
  { "sam4llis/nvim-tundra", enabled = is_enabled(colors.tundra) },
  { "Mofiqul/dracula.nvim", config = true, enabled = is_enabled(colors.dracula) },
  { "AlexvZyl/nordic.nvim", enabled = is_enabled(colors.nordic) },
}
