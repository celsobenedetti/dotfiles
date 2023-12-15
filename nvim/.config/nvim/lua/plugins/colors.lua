local enableall = false
local bg = "dark"
local transparent = false
local colors = {
  github = "github_dark_dimmed",
  github_dark = "github_dark",
  github_light = "github_light",
  tokyo = "tokyonight",
  tokyo_day = "tokyonight-day",
  mocha = "catppuccin",
  frappe = "catppuccin-frappe",
  tundra = "tundra",
  rose = "rose-pine",
  rosemoon = "rose-pine-moon",
  dracula = "dracula",
  dracula_soft = "dracula-soft",
  nordic = "nordic",
  materialgruv = "gruvbox-material",
  gruvbaby = "gruvbox-baby",
  gruvbox = "gruvbox",
  everforest = "everforest",
  nord = "nord",
  oxocarbon = "oxocarbon",
  sonokai = "sonokai",
  poimandres = "poimandres",
  default = "default",
}

local colorscheme = colors.frappe

if vim.loop.os_gethostname() == "pop-os" then
  colorscheme = colors.default
end

local github = { colors.github_light, colors.github, colors.github_dark }
local gruvbox = { colors.gruvbox, colors.gruvbaby, colors.materialgruv }
local light = { colors.github_light, colors.tokyo_day }
local rose = { colors.rose, colors.rosemoon }

local function check_black_cursor(theme)
  for _, v in pairs(light) do
    if theme == v or bg == "light" then
      vim.cmd([[
highlight Cursor guifg=white guibg=#2f1e4d
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

vim.opt.background = bg

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
    enabled = is_enabled(github),
  },
  {
    "rose-pine/neovim",
    main = "rose-pine",
    enabled = is_enabled(rose),
    opts = {
      disable_background = transparent,
      disable_italics = true,
    },
  },
  { "sam4llis/nvim-tundra", enabled = is_enabled(colors.tundra) },
  { "Mofiqul/dracula.nvim", config = true, enabled = is_enabled(colors.dracula) },
  { "AlexvZyl/nordic.nvim", enabled = is_enabled(colors.nordic) },

  { "sainnhe/gruvbox-material", enabled = is_enabled(gruvbox) },
  { "luisiacc/gruvbox-baby", enabled = is_enabled(gruvbox) },
  { "ellisonleao/gruvbox.nvim", enabled = is_enabled(gruvbox) },

  { "sainnhe/everforest", enabled = is_enabled(colors.everforest) },
  {
    "shaunsingh/nord.nvim",
    enabled = is_enabled(colors.nord),
    config = function()
      vim.g.nord_italic = false
      require("headlines").setup({
        markdown = {
          headline_highlights = {
            "Headline1",
            "Headline2",
            "Headline3",
            "Headline4",
            "Headline5",
            "Headline6",
          },
          codeblock_highlight = "CodeBlock",
          dash_highlight = "Dash",
          quote_highlight = "Quote",
        },
      })
    end,
  },
  { "nyoom-engineering/oxocarbon.nvim", enabled = is_enabled(colors.oxocarbon) },
  { "sainnhe/sonokai", enabled = is_enabled(colors.sonokai) },
  { "olivercederborg/poimandres.nvim", enabled = is_enabled(colors.poimandres) },

  {
    "folke/tokyonight.nvim",
    opts = {
      transparent = transparent,
      styles = {
        sidebars = "transparent",
        floats = "transparent",
      },
    },
  },
}
