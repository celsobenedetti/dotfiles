local function link()
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

local function italic()
  vim.api.nvim_feedkeys(Escape("S_"), "v", true)
end

local function bold()
  vim.api.nvim_feedkeys(Escape("S*"), "v", true)
  vim.api.nvim_feedkeys(Escape("ysi**"), "v", true)
end

local function strikethrough()
  vim.api.nvim_feedkeys(Escape("S~"), "v", true)
  vim.api.nvim_feedkeys(Escape("ysi~~"), "v", true)
end

local function code()
  vim.api.nvim_feedkeys(Escape("S`"), "v", true)
end

return {
  link = link,
  italic = italic,
  bold = bold,
  code = code,
  strikethrough = strikethrough,
}
