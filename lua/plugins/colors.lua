local colorscheme = "tundra"

local function is_enabled(color)
  return tostring(string.match(colorscheme, color)) ~= "nil"
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
