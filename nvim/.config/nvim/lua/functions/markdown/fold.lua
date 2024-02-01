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
---@param file string name for current buffer
local function work_week(file)
  local is_work_week = string.match(file, "work") and string.match(file, "week")

  if is_work_week then
    local day = vim.fn.system("date +%u") + 1
    if day > #week then
      day = #week
    end

    -- search for the day of the week
    local searchWeekDay = "/" .. week[tonumber(day)] .. "<CR>"
    vim.api.nvim_feedkeys(Escape(searchWeekDay), "n", true)

    -- unfold the day of the week
    vim.api.nvim_feedkeys("VzO", "n", true)
  end
end

--- Closes all folds in document and unfolds only the first level
local function one_level()
  vim.api.nvim_feedkeys("zMza", "n", true)
end

return {
  work_week = work_week,
  one_level = one_level,
}
