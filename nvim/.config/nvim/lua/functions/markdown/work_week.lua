local week = {
  "Sun",
  "Mon",
  "Tue",
  "Wed",
  "Thu",
  "Fri",
  "Sat",
}

return {
  fold = function()
    local file = vim.fn.expand("%:t")

    -- if file contains "work" then
    if type(file) == "string" and string.match(file, "work") then
      -- fold all
      vim.api.nvim_feedkeys("zM", "n", true)

      local day = vim.fn.system("date +%u") + 1
      if day > #week then
        day = #week
      end

      -- search for the day of the week
      local searchWeekDay = "/" .. week[tonumber(day)] .. "<CR>"
      vim.api.nvim_feedkeys(Escape(searchWeekDay), "n", true)

      -- unfold the day of the week
      vim.api.nvim_feedkeys("zaVzO", "n", true)
    end
  end,
}
