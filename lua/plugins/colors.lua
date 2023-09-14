local enableall = false

local colors = {
  github = "github_dark_high_contrast",
  github_light = "github_light",
  tokyo = "tokyonight",
  mocha = "catppuccin",
  frappe = "catppuccin-frappe",
  tundra = "tundra",
  rose = "rose-pine-moon",
  dracula = "dracula-soft",
  nordic = "nordic",
  materialgruv = "gruvbox-material",
  gruvbaby = "gruvbox-baby",
  gruvbox = "gruvbox",
}

local colorscheme = colors.gruvbox
local gruvbox = { colors.gruvbox, colors.gruvbaby, colors.materialgruv, colors.nordic }

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

local function is_enabled(themes)
  if type(themes) == "table" then
    for _, v in pairs(themes) do
      if v == colorscheme then
        return true
      end
    end
    return false
  end

  return enableall or colorscheme == themes
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
  { "sainnhe/gruvbox-material", enabled = is_enabled(gruvbox) },
  { "luisiacc/gruvbox-baby", enabled = is_enabled(gruvbox) },
  { "ellisonleao/gruvbox.nvim", enabled = is_enabled(gruvbox) },
}
