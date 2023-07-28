-- if doing relative jump, add current position to jump list
local function track_position_before_relative_jump(key)
  local count = vim.v.count or 1
  local orig_key = vim.api.nvim_replace_termcodes(key, true, true, true)
  if count > 1 then
    vim.api.nvim_feedkeys("m'", "n", true)
  end
  vim.api.nvim_feedkeys(count .. orig_key, "n", true)
end

return {
  up = function()
    track_position_before_relative_jump("k")
  end,
  down = function()
    track_position_before_relative_jump("j")
  end,
}
