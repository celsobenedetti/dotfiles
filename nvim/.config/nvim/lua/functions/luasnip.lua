local ls = require("luasnip")

return {
  accept_or_go_next = function()
    if ls.expand_or_jumpable() then
      ls.expand_or_jump()
    end
  end,

  go_back = function()
    if ls.jumpable(-1) then
      ls.jump(-1)
    end
  end,

  toggle_option = function()
    if ls.choice_active() then
      ls.change_choice(1)
    end
  end,

  navigate_tmux = function(cmd)
    return function()
      if not require("luasnip").in_snippet() then
        vim.cmd(cmd)
      end
    end
  end,
}
