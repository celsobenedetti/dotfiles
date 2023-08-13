local colors = {
  github = "github_dark_high_contrast",
  tokyo = "tokyonight",
  catppuccin = "catppuccin",
  tundra = "tundra",
  rose = "rose-pine",
}

local colorscheme = colors.github

local function is_enabled(color)
  return colorscheme == colors[color]
end

return {
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = colorscheme,
    },
  },

  { "projekt0n/github-nvim-theme", enabled = is_enabled("github") },
  { "rose-pine/neovim", enabled = is_enabled("rose") },
  { "sam4llis/nvim-tundra", enabled = is_enabled("tundra") },
}
