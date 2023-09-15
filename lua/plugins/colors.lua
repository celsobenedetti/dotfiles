local enableall = false

local colors = {
  github = "github_dark_high_contrast",
  github_light = "github_light",
  tokyo = "tokyonight",
  tokyo_day = "tokyonight-day",
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

local colorscheme = colors.frappe
local gruvbox = { colors.gruvbox, colors.gruvbaby, colors.materialgruv, colors.nordic }
local light = { colors.github_light, colors.tokyo_day }

local function check_black_cursor(theme)
  for _, v in pairs(light) do
    if theme == v then
      vim.cmd([[
highlight Cursor guifg=white guibg=black
highlight iCursor guifg=white guibg=steelblue
set guicursor=n-v-c:block-Cursor
set guicursor+=i:ver100-iCursor
set guicursor+=n-v-c:blinkon0
set guicursor+=i:blinkwait10
]])
    end
  end
end
check_black_cursor(colorscheme)

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
