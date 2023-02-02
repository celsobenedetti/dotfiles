return {
  {
    "L3MON4D3/LuaSnip",
    dependencies = { "rafamadriz/friendly-snippets", "saadparwaiz1/cmp_luasnip" },
    config = function()
      local ls = require("luasnip")

      -- require("luasnip.loaders.from_vscode").lazy_load()
      require("luasnip.loaders.from_vscode").lazy_load({
        paths = { "~/.dotfiles/snippets", include = "go" },
      })

      ls.config.set_config({
        history = true,
        update_events = "TextChanged,TextChangedI",
      })

      -- keymaps -------------------------------------------------------------------------------------c

      vim.keymap.set({ "i", "s" }, "<C-l>", function()
        if ls.expand_or_jumpable() then
          ls.expand_or_jump()
        end
      end, { silent = true })

      vim.keymap.set({ "i", "s" }, "<c-h>", function()
        if ls.jumpable(-1) then
          ls.jump(-1)
        end
      end, { silent = true })

      vim.keymap.set({ "i" }, "<c-j>", function()
        if ls.choice_active() then
          ls.change_choice(1)
        end
      end, { silent = true })

      local s = ls.snippet
      local fmt = require("luasnip.extras.fmt").fmt
      local rep = require("luasnip.extras").rep
      local i = ls.insert_node
      local c = ls.choice_node
      local t = ls.text_node
      local sn = ls.snippet_node

      require("config.snippets.html").config(ls, s, fmt, rep, i, t, c)
    end,
  },
}
