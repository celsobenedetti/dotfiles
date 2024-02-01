return function()
  local clipboard = vim.fn.getreg("+")
  -- if string is not of type string
  if type(clipboard) ~= "string" then
    print("clipboard is not string", clipboard)
    return
  end

  -- surround with []
  vim.api.nvim_feedkeys("S[", "v", true)
  -- delete whitespaces
  vim.api.nvim_feedkeys("lxh%hx", "n", true)
  -- -- insert ({clipboard content})
  vim.api.nvim_feedkeys("a(", "n", true)
  vim.api.nvim_feedkeys(clipboard, "n", true)
  vim.api.nvim_feedkeys(")", "n", true)
  vim.api.nvim_feedkeys(Escape("<esc>"), "n", true)
end
