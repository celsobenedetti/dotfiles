local week = {
  "Sun",
  "Mon",
  "Tue",
  "Wed",
  "Thu",
  "Fri",
  "Sat",
}

--- If file is a work-week file, go to section for current week day and unfold it
local function work_week()
  local file = vim.fn.expand("%:t")
  if type(file) ~= "string" then
    return
  end

  local is_work_week = string.match(file, "work") and string.match(file, "week")

  if is_work_week then
    -- close all folds
    vim.api.nvim_feedkeys("zM", "n", true)
    vim.api.nvim_feedkeys("za", "n", true)

    local day = vim.fn.system("date +%u") + 1
    if day > #week then
      day = #week
    end
    -- search for the day of the week
    local searchWeekDay = "/" .. week[tonumber(day)] .. "<CR>"
    vim.api.nvim_feedkeys(Escape(searchWeekDay), "n", true)

    -- -- -- unfold the day of the week
    vim.api.nvim_feedkeys("VzO", "n", true)
  end
end

return {
  work_week = work_week,
}
