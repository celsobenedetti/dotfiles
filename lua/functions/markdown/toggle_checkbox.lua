return {
  toggle = function()
    local current_line = vim.api.nvim_get_current_line()

    if string.match(current_line, "^%s*%-%s*%[[ ]%]") then
      -- Checkbox is already checked, uncheck it
      local new_line = string.gsub(current_line, "%[ ]", "[x]", 1)
      vim.api.nvim_set_current_line(new_line)
      return
    end

    if string.match(current_line, "x") then
      -- Checkbox is unchecked, check it
      local new_line = string.gsub(current_line, "x", " ", 1)
      vim.api.nvim_set_current_line(new_line)
      return
    end

    if string.match(current_line, "^%s*%-") then
      local new_line = string.gsub(current_line, "-", "- [ ]", 1)
      vim.api.nvim_set_current_line(new_line)
    else
      vim.api.nvim_set_current_line("- " .. current_line)
    end
    -- Checkbox is unchecked, check it

    -- local new_line = string.gsub(current_line, "%[.-%]", "[ ]", 1)
    -- vim.api.nvim_set_current_line("- " .. new_line)
  end,
}
