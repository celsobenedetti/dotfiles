local colors = {
  github = "github_dark_high_contrast",
  github_light = "github_light",
  tokyo = "tokyonight",
  mocha = "catppuccin",
  frappe = "catppuccin-frappe",
  tundra = "tundra",
  rose = "rose-pine",
  dracula = "dracula-soft",
}

local colorscheme = colors.frappe

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

  { "projekt0n/github-nvim-theme", enabled = is_enabled(colors.github) or is_enabled(colors.github_light) },
  { "rose-pine/neovim", enabled = is_enabled(colors.rose) },
  { "sam4llis/nvim-tundra", enabled = is_enabled(colors.tundra) },
  { "Mofiqul/dracula.nvim", config = true, enabled = is_enabled(colors.dracula) },
}
