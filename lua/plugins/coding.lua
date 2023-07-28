local snippets = require("functions.luasnip")

return {
  {
    "L3MON4D3/LuaSnip",
    keys = {
      { "<C-l>", snippets.accept_or_go_next, mode = "i" },
      { "<c-h>", snippets.go_back, mode = "i" },
      { "<c-j>", snippets.toggle_option, mode = "i" },
    },
  },
}
